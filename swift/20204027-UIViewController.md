# 2020년 04월 27일(월)



## UIViewController

- 앱 구조의 뼈대: 모든 앱에 반드시 하나 이상, 대부분 많은 수의 View Controller로 구성
- **주요 역할**
  - View Management
  - Data Marshaling
- User Interactions 
  - Resource Management 
  - Adaptivity

### View Management

- 모든 뷰 컨트롤러마다 RootView를 지니며, 화면에 표시하기 위해서는 해당 RootView 계층에 속해야 함

### Two types of view controllers

- Content View Controllers
  - 모든 뷰를 단독으로 관리
  - UIViewController, UITableViewController, UICollectionViewController 􏰺
- Containter View Controllers
  - 자체 뷰 + 하나 이상의 자식 뷰 컨트롤러가 가진 루트뷰 관리
  - 각 컨텐츠를 관리하는 것이 아닌 루트뷰만 관리하며 컨테이너 디자인에 따라 크기 조정
  - UINavigationController, UITabbarController, UIPageViewController 􏰺􏰻􏰼􏰜􏰑􏰒􏰓􏰔􏰈􏰻􏰽􏰜􏰡􏰢􏰣􏰤

### Data Marshaling

- MVC(Model - View - Controller)
  - 자신이 관리하는 View와 Data 간 중개 역할

### User Interactions

- 이벤트 처리
  - 뷰 컨트롤러는 Responder 객체: 직접 이벤트를 받아 처리 가능하나 일반적으로 지양
  - 뷰가 그 자신의 터치 이벤트를 연관된 객체에 action 메서드나 delegate로 전달

### Resource Management

- 뷰컨트롤러가 생성한 모든 뷰와 객체들은 뷰컨트롤러의 책임
- 뷰 컨트롤러의 생명 주기에 따라 생성되었다가 자동 소멸 되기도 하지만 ARC 개념에 맞게 관리 필요
- 메모리 부족시 didReceiveMemoryWarning 메서드에서 꼭 유지하지 않아도 되는 자원들은 정리 필요

***

### The Root View Controller

- UIWindow는 그 자체로는 유저에게 보여지는 컨텐츠를 가지지 못함
- Window는 정확히 **하나의 Root View Controller** 를 가지는데 이것을 통해 컨텐츠를 표현

***

## Card-Style Modal Presentation

``` swift
public enum UIModalPresentationStyle : Int {
  case fullScreen
  case pageSheet
  case formSheet
  
  // ...
  
  @available(iOS 13.0, *)
  case automatic	// 팝업처럼 뜸
}
```



***

### iOS 13 이상 SceneDelegate.swift 사용 시

```` swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        //ios 13 이상이면서 스토리보드를 사용하지 않고 시작 하는 방법
        
        // 처음 시작할 때 맨 바닥에 깔아주는 뷰라고 생각하면 됨
        window = UIWindow(windowScene: windowScene)
        
        // window?.backgroundColor = .systemBackground
        // light = 흰색, dark mode = 검은색(물론 iOS 13 이상)
        window?.backgroundColor = .systemBackground
        
        //window를 ViewController()로 지정하여 ViewController에 해당하는 화면을 보여줌. 윈도우 위로.
        window?.rootViewController = ViewController()
        window?.frame = UIScreen.main.bounds
        
        window?.makeKeyAndVisible() //window가 하나가 아니라 여러개인경우, key윈도우를 지정.
    }

}
````

### Storyboard + SceneDelegate 안 쓸 때

```` swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 스토리보드 + SceneDelegate 안 쓸 때
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.backgroundColor = .systemTeal
        window?.makeKeyAndVisible()
        
        return true
    }
}

````

***

### modalPresentationStyle(**Card-Style Lifecycle**)

- FullScreen != Sheet

- **.fullScreen** (ViewController(A), NextViewController(B))
- A -> B

``` swift
---------- [ viewWillDisappear - A vc ] ----------


---------- [ viewWillAppear - B vc ] ----------


---------- [ viewDidAppear - B vc ] ----------


---------- [ viewDidDisappear - A vc ] ----------
```

* B -> A

``` swift
---------- [ viewWillDisappear - B vc ] ----------


---------- [ viewWillAppear - A vc ] ----------


---------- [ viewDidAppear - A vc ] ----------


---------- [ viewDidDisappear - B vc ] ----------

Deinitialized - Next View Controller


// 해당 뷰가 메모리에서 삭제 될 때 실행 됨
deinit {
  print("Deinitialized - Next View Controller")
}
```

***

- **.automatic** (ViewController(A), NextViewController(B))
- A -> B

``` swift
---------- [ viewWillAppear - B vc ] ----------


---------- [ viewDidAppear - B vc ] ----------
```

- B -> A

``` swift
---------- [ viewWillDisappear - B vc ] ----------


---------- [ viewDidDisappear - B vc ] ----------

Deinitialized - Next View Controller
```

***

### Tips

``` swift
button.sizeToFit() // 화면 크기에 버튼 크기가 맞춰 조절 됨 

deinit {
  print("Deinitialized - View Controller")
  // 해당 뷰가 메모리에서 삭제 될 때 실행 됨
}

// isModalInPresentation true -> 제스처를 통해 창 닫기 가능
// false -> 창 닫기 불가능
if #available(iOS 13.0, *) {
  nextVC.isModalInPresentation = true
} else {
  // Fallback on earlier versions
}

//--------------------------
view.sizeToFit() // 이것은 마지막으로 해야 함. 그게 아니면 사이즈가 이상해져서 텍스트를 못 볼 수 있음
```

***

### View Lifecycle

``` swift
override func viewWillAppear(_ animated: Bool) {
  super.viewWillAppear(animated)
  print("\n---------- [ viewWillAppear - view vc ] ----------\n")
}

override func viewDidAppear(_ animated: Bool) {
  super.viewDidAppear(animated)
  print("\n---------- [ viewDidAppear - view vc ] ----------\n")
}

override func viewWillDisappear(_ animated: Bool) {
  super.viewWillDisappear(animated)
  print("\n---------- [ viewWillDisappear - view vc ] ----------\n")
}

override func viewDidDisappear(_ animated: Bool) {
  super.viewDidDisappear(animated)
  print("\n---------- [ viewDidDisappear - view vc ] ----------\n")
}
```

***

### 중요ㅁ7ㅁ8

```` swift
presentingViewController // - 나를 띄운 ViewController
presentedViewController // - 내가 띄운 ViewController

// self: Next VC
// self.presentingViewController // ViewController
// self.presentingViewController.presentedViewController // Next VC


// 나를 띄운 뷰의 버튼 글자를 바꾸고 싶을 때?
if let vc = self.presentingViewController as? ViewController {
  vc.button.setTitle("클릭's", for: .normal)
}

// A -> B -> C
// C dismiss -> B
// presentingViewController?.dismiss = dismiss
// presentingViewController?.presentingViewController?.dismiss(animated: true)

// 최상위 뷰를 찾을 때 사용 할 수 있음
// UIApplication.shared.keyWindow?.rootViewController
````

***



### UIAdaptivePresentationControllerDelegate

- Presentation Controller와 함께 app의 trait 변화에 응답하는 방법을 결정하는 일련의 메소드
- 해당 프로토콜은 준수하는 객체를 구현 한 후, 해당 객체를 적절한 UIPresentationController 객체의 delegate 프로퍼티에 할당해야 함
- Delegate는 콘텐츠를 표시하기 위핸 새로운 Presentation Style 또는 완전히 새로운 ViewController를 제안 할 수 있다.
- ```isModalInPresentation``` 은 modal behavior를 적용하는지 여부를 나타내는 boolean 값으로, default는 false이다.
  - true로 set 할 경우 UIKit은 viewController의 bounds 바깥에서 일어나는 이벤트를 무시하고, viewController가 화면에 있는 동안 interactive dismissal(화면 내리는거)도 막아줌
- 사용하고자 하는 ViewController에 ```UIAdaptivePresentationControllerDelegate``` 를 추가해줘야함

``` swift
// 추가적으로 아래의 코드를 viewDidLoad()에 입력해줘야 실행 된다.
// self.navigationController?.presentationController?.delegate = self 이건 줄 알았더니 아니였음.......ㅠㅠ
self.presentationController?.delegate = self

func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
  // View를 내릴 때 동작 함
}

func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
  // View를 내리고 난 후 실행 함(동작 완료)
}

func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
  // View를 내릴 때 동작 함
  return true
}

func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
  // isModalInPresentation => true 일 경우 창이 안내려갈 때 실행 됨
}
```



### ModalPresentationStyle => .automatic

#### A -> B Controller

1. viewDidLoad() // B
2. viewWillAppear() // B
3. viewDidAppear() // B

#### B -> A Controller(Button)

1. ViewWillDisappear() // B
2. ViewDidDisappear() // B

#### B -> A Controller(isModalInPresentation: false)

1. presentationControllerShouldDismiss // B
2. presentationControllerWillDismiss // B
3. viewWillDisappear // B
4. viewDidDisappear // B
5. presentationControllerDidDismiss // B

#### B -> A Controller(isModalInPresentation: true)

1. presentationControllerDidAttemptToDismiss

[참고사이트](https://milyo-codingstories.tistory.com/34)