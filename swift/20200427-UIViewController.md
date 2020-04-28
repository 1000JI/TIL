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

* presentingViewController : **나를 띄운 ViewController**

  presentedViewController : **내가 띄운 ViewController**

```` swift
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



***

#### 04/28 과제

###### [ 과제 ]

1. ViewController 데이터 전달
2. AViewController 와 BViewController 를 만든 뒤, 각각 하나씩의 Label 생성
3. A에서 B로 화면을 넘어갈 때는 B의 Label 값이 이전 값에서 +3 증가
4. B에서 A로 화면을 넘어갈 때는 A의 Label 값이 이전 값에서 +1 증가

- e.g. A에서 B로 갈 때 3, B에서 다시 A로 넘어올 때 4, 다시 A에서 B로 가면 7, 다시 A로 오면 8

###### [ 도전 과제 ]

1. 카드 스타일에서 제스처로 내릴 때는 UIAdaptivePresentationControllerDelegate 프로토콜을 사용한 별도의 작업 필요. 관련 내용을 검색해보고 presentationControllerDidDismiss 메서드를 이용해서 구현해보기

###### [해결 방법]

1. A ViewController(이하 'A'), B ViewController(이하 'B') 두 개로 구성하여 각 뷰에 Count 변수 생성
2. A -> B로 이동 시 이동할 B를 가져와서 B에 있는 Count 변수를 증가시킴
3. B가 화면 구성하면서 증가한 Count(A Count + 3)로 Label을 구성
4. B -> A로 이동 시 ```self.presentingViewController as? AViewController``` 를 통해 A를 불러와 Count(B Count + 1)를 구성 후 Label 구성해줌(만약 Label을 빼고 싶다면 A쪽에 willAppear을 가지고 할 수 있을 것 같다)
5. 위의 내용을 반복!!

###### [도전 과제 중 문제점]

* 상위 해결 방법은 **modalPresentStyle** 이 .fullscreen이거나 버튼으로만 이동했을 경우인데, .automatic(Page Sheet OR Form Sheet) 일 때, 제스처로 내리는 것은 별도의 **Delegate** 를 사용해야 한다.

``` swift
extension BViewController: UIAdaptivePresentationControllerDelegate {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.presentationController?.delegate = self
    // 이거... 구글링하다 보니 self.navigation.present... 식으로 있는 것을 볼 수 있는데 뭔가가 업데이트 되고 나서 바꼈나보다ㅠㅠ 이걸로 시간 너무 잡아먹었다.
  }
}
```

* 또한, ```presentationControllerWillDismiss``` 를 사용할 경우 self.presentingViewController를 사용하면 쉽게 해결 할 수 있지만 ```presentationControllerDidDismiss``` 를 사용할 경우 제스처로 창을 닫은 상태에서 실행이 되기 때문에 **self의 주체를 찾기가 어렵다.**
* ```presentationControllerDidDismiss``` 에서 ```let vc = AViewController()``` 식으로 불러와도 이때 A 컨트롤러는 현재 B를 부른 A를 가져오는 것이 아니라, 새로운 A를 만드는 것이기 때문에 Counting이 되지 않는다.
* 따라서, B를 부른 A를 찾는 것이 중요한 부분이다.

###### [상위 문제 해결 방법]

- **첫 번째 방법**은 B를 부른 뷰가 최상위 뷰이기 때문에(하나밖에 없어서) Root ViewController를 찾는 방법이다.

``` swift
func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
  print("presentationControllerDidDismiss")

  // UIApplication을 통해 최상단 rootViewController를 찾아 AViewController를 불러옴
  let vc = UIApplication.shared.keyWindow?.rootViewController as? AViewController
  vc!.aViewCount = bViewCount + 1
  vc!.aCountLabel.text = "\(vc!.aViewCount)"
  vc!.aCountLabel.sizeToFit()

```

- **두 번째 방법**은 ```presentationControllerDidDismiss``` 메소드를 보면 매개변수가 있는데 그 매개변수를 활용하는 방법이다.

```swift
func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
  print("presentationControllerDidDismiss")

  if let vc = presentationController.presentingViewController as? AViewController {
    vc.aViewCount = bViewCount + 1
    vc.aCountLabel.text = "\(vc.aViewCount)"
    vc.aCountLabel.sizeToFit()
  }
}
```

* 위처럼 해결 할 수 있었는데, 궁금한 부분이 생겨났다. 바로 presentingViewController와 presentedViewController인데 살펴보면
  1. A ViewController
     - presentingViewController : nil
     - presentedViewController : nil
  2. A -> B Present (현재 A View이며, self.present 이후)
     - presentingViewController : nil
     - presentedViewController : B ViewController
  3. B ViewController
     - presentingViewController : A ViewController
     - presentedViewController : nil
  4. B -> A Dismiss (현재 B View이며, self.dismiss 이후)
     - presentingViewController : A ViewController
     - presentedViewController : nil
     - 하지만, self.dimiss에서 **completion에 출력하면 둘 다 모두 nil이 출력** 된다.
  5. B -> A 제스처 Dismiss (현재 ```presentationControllerDidDismiss``` 메소드 위치
     - presentingViewController : nil
     - presentedViewController : nil
     - DidDismiss 이므로, 이미 Dismiss가 된 후 호출 되서 현재 B는 호출하거나 호출하지 않은 상태라 nil이 출력된다.
     - 따라서 매개변수 ```presentationController``` 를 사용해서 출력하면
     - presentationController.presentedViewController: B ViewController
     - presentationController.presentingViewController: A ViewController
     - 위 처럼 나오는데 그러면... 매개변수 presentationController는 A ViewController - presentationController - B ViewController 처럼 중간에 껴있는 걸까?

####### [presentationController ????]

- 영어를 구글 번역하여 쓰기 때문에 약간 상이 할 수 있음

- UIPresentationController 정의: 화면에서 전환 애니메이션 및 뷰 컨트롤러의 프리젠테이션을 관리하는 객체이다.
- **UIKit은 View Controller가 표시되는 시점부터 해제 될 때까지 Presentation Controller를 사용하여 해당 View Controller에 대한 Presentation Controller의 다양한 측면을 관리**합니다. Presentation Controller는 애니메이터 객체가 제공하는 애니메이션 위에 자체 애니메이션을 추가하고 크기 변경에 응답 할 수 있으며 View Controller가 화면에 표시되는 방식의 다른 측면을 관리 할 수 있다.
- [Presentation Process]
  1. Presentation을 통해 일련의 애니메이션을 통해 화면에 새로운 뷰 컨트롤러를 이동하는 것을 포함한다.
  2. 관리 단계는 새로운 뷰 컨트롤러 화면에 있는 동안 환경의 변화에 응답하는 것을 포함한다.
  3. 일련의 애니메이션을 통해 새로운 뷰 컨트롤러로 이동하는 것을 포함한다.
- [결론]
  - Presentation Controller는 새로운 뷰(B ViewController)가 생성되는 시점부터 해당 View Controller를 해제할 때까지 관리한다. 따라서 제스처를 통해 Dismiss 할 때 넘어오는 매개변수 presentationController가 바로 그 역할을 하고 있다.
  - presentationController를 띄운(PresentingViewController) 뷰는 A Controller가 되며, presentationController가 띄우고 있는(PresentedViewController) 뷰는 B Controller가 된다고 보면 될 것 같다. :)