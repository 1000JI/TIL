# 2020년 05월 08일(금)

## ContainerView(Navigation Controller)

#### Navigation Interface란?

- 네비게이션 인터페이스는 **주로 계층적 구조의 화면전환**을 위해 사용되는 **드릴 다운 인터페이스**(**drill-down interface**)이다.

#### Navigation Controller

- 컨테이너 뷰 컨트롤러로써 **네비게이션 스택(navigation stack)을 사용하여 다른 뷰 컨트롤러를 관리**한다. 여기서 네이게이션 스택에 담겨서 콘텐츠를 보여주게 되는 뷰 컨트롤러들을 **컨텐트 뷰 컨트롤러**(**content view controller**)라고 한다.

- 네비게이션 컨트롤러는 **두 개의 뷰를 화면에 표시**하는데 하나는 스택**뷰에 포함 된 최상위 컨텐트 뷰 컨트롤러의 콘텐츠를 나타내는 뷰**와 **네비게이션 컨트롤러가 직접 관리하는 뷰**(**네비게이션 바 또는 툴바**)가 있다.
- 네비게이션 **인터페이스의 변화에 따른 특정 액션을 동작하도록** 하기 위해 **네비게이션 델리게이트 객체를 사용**할 수 있다.

#### Navigation Stack

- 네비게이션 컨트롤러에 의해 관리되며, 뷰 컨트롤러를 담을 수 있는 배열과도 같다.
- **가장 하위에 있는 뷰 컨트롤러**는 **루트 뷰 컨트롤러**(**root view controller**)가 되며, <u>스택에서 팝(pop)되지</u> 않는다.
- **스택의 가장 상위에 있는 뷰 컨트롤러**는 최상위 뷰 컨트롤러로 <u>화면에 보이게 된다</u>.
- 스택은 push 또는 pop을 통하여 아이템을 관리한다.

#### UINavigation Controller 클래스

- 네비게이션 컨트롤러의 생성

``` swift
// 내비게이션 컨트롤러의 인스턴스를 생성하는 메서드입니다.
// 매개변수로 내비게이션 스택의 가장 아래에 있는 루트 뷰 컨트롤러가 될 뷰 컨트롤러를 넘겨줍니다.
init(rootViewController: UIViewController)
```

- 네비게이션 스택의 뷰 컨트롤러에 대한 접근

``` swift
// 내비게이션 스택에 있는 최상위 뷰 컨트롤러에 접근하기 위한 프로퍼티입니다.
var topViewController: UIViewController?

// 현재 내비게이션 인터페이스에서 보이는 뷰와 관련된 뷰 컨트롤러에 접근하기 위한 프로퍼티입니다.
var visibleViewController: UIViewController?

// 내비게이션 스택에 특정 뷰 컨트롤러에 접근하기 위한 프로퍼티입니다.(루트 뷰 컨트롤러의 인덱스는 0 입니다.)
var viewController: [UIViewController]
```

* 네비게이션 스택의 Push와 Pop에 관한 메서드

``` swift
// 내비게이션 스택에 뷰 컨트롤러를 푸시합니다.
// 푸시 된 뷰 컨트롤러는 최상위 뷰 컨트롤러로 화면에 표시됩니다.
func pushViewController(UIViewController, animated: Bool)

// 내비게이션 스택에 있는 최상위 뷰 컨트롤러를 팝합니다.
// 최상위 뷰 컨트롤러 아래에 있던 뷰 컨트롤러의 콘텐츠가 화면에 표시됩니다.
func popViewController(animated: Bool) -> UIViewController?

// 내비게이션 스택에서 루트 뷰 컨트롤러를 제외한 모든 뷰 컨트롤러를 팝합니다.
// 루트 뷰 컨트롤러가 최상위 뷰 컨트롤러가 됩니다.
// 삭제된 모든 뷰 컨트롤러의 배열이 반환됩니다.
func popToRootViewController(animated: Bool) -> [UIViewController]?

// 특정 뷰 컨트롤러가 내비게이션 스택에 최상위 뷰 컨트롤러가 되기 전까지 상위에 있는 뷰 컨트롤러들을 팝합니다.
func popToViewController(_ viewController: UIViewController, 
		animated: Bool) -> [UIViewController]?
```

- 코드 작성을 통해 네비게이션 인터페이스 구성하기

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
  // Override point for customization after application launch.

  // 루트 뷰 컨트롤러가 될 뷰 컨트롤러를 생성합니다.
  let rootViewController = UIViewController()
  // 위에서 생성한 뷰 컨트롤러로 내비게이션 컨트롤러를 생성합니다.
  let navigationController = UINavigationController(rootViewController: rootViewController)

  self.window = UIWindow(frame: UIScreen.main.bounds)
  // 윈도우의 루트 뷰 컨트롤러로 내비게이션 컨트롤러를 설정합니다.
  self.window?.rootViewController = navigationController
  self.window?.makeKeyAndVisible()

  return true
}
```



#### Navigation Code 구현

- Navigation Controller는 UI ViewController 생성 뒤 감싸주는 형식으로 진행을 해야한다.

``` swift
// Navigation ---------------------------------------------
let vc = AViewController()
let navi = UINavigationController(rootViewController: vc)
navi.navigationController?.navigationBar.prefersLargeTitles = true
window?.rootViewController = navi

/*
	- prefers Large Title -> 네비게이션 상단 바가 크게 변함
	- 이어 받는 navigation view에서 Large Title을 Naver로 설정하여 설정을 막는 방법도 있음
	- iOS 11 version 이상
*/
```

- 위 코드에서 AViewController를 생성 뒤 네비게이션으로 감싸주고 rootView로 설정한다.
- 여기서 ```navi.navigationController?.navigationBar.prefersLargeTitles``` 는 네비게이션바에 타이틀을 둘것인지, 아니면 큰 글자로 바꿀 것인지를 선택 할 수 있는데, true 일 경우 큰 글자 타이틀이 적용된다.

**[ Navigation Bar Item 추가 ]**

```swift
lazy var barButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(pushViewController(_:)))

// let barButton으로 구성하면 버튼을 눌러도 사용되지 않는다. 왜냐하면 아직 self가 구성되어지기 전에 barButtonItem을 구성하기 때문이다. 따라서 lazy를 붙여서 self 구성 후 barButtonItem을 사용할 수 있도록 lazy을 붙여줘야 한다

//---------------------------------------------
// 1. 타이틀(문자열)로 추가하는 방법
let barButtonItem2 = UIBarButtonItem(title: "Next2", style: .plain, target: self, action: #selector(pushViewController(_:)))

// 2. 버튼 이미지로 추가하는 방법
let barButtonItem3 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushViewController(_:)))

// 최종 추가 방법
self.navigationItem.rightBarButtonItems = [barButtonItem, barButtonItem2, barButtonItem3]
```

**[ Navigation View Push ]**

```swift
// 1. push로 뷰 이동하는 방법
let secondVC = SecondViewController()
navigationController?.pushViewController(secondVC, animated: true)


// 2. show로 뷰 이동하는 방법
@objc private func pushViewController(_ sender: Any) {
  let secondVC = SecondViewController()
  show(secondVC, sender: sender)
}
```

**[ Navigation View Pop ]**

```swift
navigationController?.popViewController(animated: true)
```



***

## ContainerView(Tab Bar Controller)

- Tab Bar Controller는 여러 개의 뷰를 하나의 뷰로 모아서 하단의 Tab 아이템으로 이동 할 수 있다.
- 아래의 코드는 2개의 View Controller와 1개의 Navigation Controller를 Tab Bar Controller로 모은 것이다.

``` swift
// Tab bar Controller ---------------------------------------------
let avc = AViewController()
avc.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)

let bvc = BViewController()
bvc.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "person.circle"), tag: 1)

let cvc = CViewController()
let navi = UINavigationController(rootViewController: cvc)
navi.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)


let tabBarController = UITabBarController()
tabBarController.viewControllers = [avc, bvc, navi]
window?.rootViewController = tabBarController
```

***

## UserDefault

- iOS에서 데이터를 파일에 저장하기 위해 사용하는 **대표적인 클래스 중 하나**
- 간단한 정보를 저장하고 불러올 때 사용하며 내부적으로 **pList 파일**로 저장
- **UserDefaults**는 일반적으로 **싱글톤 형태**로 사용
  - **싱글톤**이란 인스턴스 한 개만 만들어서 모두가 공유해서 쓰는 것

* UserDefault 저장 값을 보고 싶을때 사용하는 코드

```swift
// UserDefault 저장 값을 모두 보고 싶을 때
print("\n---------- [ dictionaryRepresentation ] ----------\n")
print(userDefaults.dictionaryRepresentation())

// UserDefault 중 키만 보고 싶을 때
print("\n---------- [ keys ] ----------\n")
print(Array(UserDefaults.standard.dictionaryRepresentation().keys))

// UserDefault 중 값만 보고 싶을 때
print("\n---------- [ values ] ----------\n")
print(Array(UserDefaults.standard.dictionaryRepresentation().values))
```



- datePicker와 switch 값 저장하는 예제 코드

``` swift
import UIKit

final class ViewController: UIViewController {

  let myUserDefault = UserDefaults.standard

  @IBOutlet private weak var datePicker: UIDatePicker!
  @IBOutlet private weak var alertSwitch: UISwitch!

  private struct Key {
    static let today = "Today"
  }

  // MARK: Action Handler

  @IBAction func saveData(_ button: UIButton) {
    // UserDefaults를 이용해서 Alarm switch, DatePicker 값 저장

    myUserDefault.set(datePicker.date, forKey: "dateValue")
    myUserDefault.set(alertSwitch.isOn, forKey: "switchValue")
  }

  @IBAction func loadData(_ button: UIButton) {
    // Date는 Any 타입이므로 Date로 타입캐스팅이 필요함
    if let dateValue = myUserDefault.object(forKey: "dateValue") as? Date {
      datePicker.setDate(dateValue, animated: true)
    }

    alertSwitch.setOn(myUserDefault.bool(forKey: "switchValue"), animated: true)
  }
}
```

- imageView와 switch 예제

``` swift
import UIKit

class SecondViewController: UIViewController {

    let myDB = UserDefaults.standard
    
    @IBOutlet private var image: UIImageView!
    @IBOutlet private var swit: UISwitch!
    
    private struct Key {
        static var animal = "animal"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swit.addTarget(self, action: #selector(changedValue(_:)), for: .valueChanged)
        
        image.image = UIImage(named: myDB.string(forKey: Key.animal) ?? "cat")
        swit.isOn = myDB.bool(forKey: "switch")
    }
    
    @objc private func changedValue(_ sender: UISwitch) {
        if sender.isOn {
            image.image = UIImage(named: "dog")
            myDB.set("dog", forKey: Key.animal)
        } else {
            image.image = UIImage(named: "cat")
            myDB.set("cat", forKey: Key.animal)
        }
        myDB.set(sender.isOn, forKey: "switch")
    }
}
```

***

## Singleton(Swift-Design Pattern)

- 특정 클래스의 인스턴스에 접근할 때 항상 동일한 인스턴스만을 반환하도록 하는 설계 패턴
- 한 번 생성된 이후에는 프로그램이 종료될 때까지 항상 메모리에 상주
- 애플리케이션에서 유일하게 하나만 필요한 객체에 사용
- UIApplication, AppDelegate 등
- 메모리 낭비를 방지 할 수 있음
- 데이터를 공유 할 수 있음

- 간단하게 싱글톤을 정의하자면 앱의 생명 주기 동안 하나의 인스턴스만 생성을 보장하는 클래스를 의미한다. 이는 단순히 하나의 인스턴스 생성을 보장하는 것이 아니라 앱 전체에서 공유될 수 있는 자원들을 캡슐화한 객체라고 할 수 있다. 다음과 같이 클래스를 정의한다면 외부에서는 해당 클래스의 인스턴스는 생성할 수 없고 오직 `shared` 변수를 통해서만 접근할 수 있다.
- **They are global mutable shared state**
  - 어디서든 접근이 가능하고 누구든지 상태를 변경할 수 있기 때문에 사용하는 시점에 우리는 싱글톤 객체의 상태를 예측하기 힘들 수 있다. 이렇게 예측이 불가능하기 때문에 싱글톤 객체의 생명 주기를 관리하는 것도 어려워진다. 만일 싱글톤 객체가 옵셔널한 프로퍼티를 갖게 된다면 사용하는 시점에 더욱이 그 상태를 예측하기 힘들 것이다.
- **Singletons hinder unit testing**
  - 싱글톤 객체를 사용하는 객체들은 싱글톤 객체에 강한 의존성을 갖고 있기 때문에 이 둘은 강하게 묶여있고 그렇기 때문에 싱글톤 객체를 포함하는 객체를 테스트하기 위해선 싱글톤 객체를 온전히 구현해주어야 한다.

#### iOS 싱글톤 사용 예

``` swift
let screen = UIScreen.main
let userDefaults = UserDefaults.standard
let application = UIApplication.shared
let fileManager = FileManager.default
let notification = NotificationCenter.default
```

```swift
/*
 static 전역 변수로 선언한 것은 지연(lazy) 생성되므로
 처음 Singleton을 생성하기 전까지 메모리에 올라가지 않음
 */
class SingletonClass {
  static let shared = SingletonClass()
  var x = 0
}

let singleton1 = SingletonClass.shared
singleton1.x = 10

let singleton2 = SingletonClass.shared
singleton2.x = 20

singleton1.x   // 20
singleton2.x   // 20

SingletonClass.shared.x = 30

SingletonClass.shared.x  // 30
singleton1.x  // 30
singleton2.x  // 30


//-----------------------------------------
/*
 외부에서 인스턴스를 직접 생성하지 못하도록 강제해야 할 경우 생성자를 private 으로 선언
 단, 일부러 새로운 것을 만들어서 쓸 수 있는 여지를 주고 싶은 경우는 무관
 */

class PrivateSingleton {
  static let shared = PrivateSingleton()
  private init() {}
  var x = 1
}

let privateVar = PrivateSingleton() // X 에러

//-----------------------------
// 싱글톤을 사용하는 것과 같은 개념
let someVar1 = NormalClass()
someVar1.x = 10
let someVar2 = someVar1
someVar2.x = 20

someVar1.x // 20
someVar2.x // 20
```

***

#### 1. 문제

``` swift
/*
 Q.
 항상 하나의 객체만을 사용하는 것을 보장해야 하는 상황에서
 아래와 같은 싱글톤 클래스를 만들었는데, 현재 상태에서 생길 수 있는 문제점은?
 */

class MySingleton {
  static let shared = MySingleton()
//  private init() {}
  var x = 0
}

let object1 = MySingleton.shared
//let object2 = MySingleton()
```

#### 2. 문제: 싱글톤 클래스를 이용한 방법으로 친구 추가, 삭제 구현

``` swift
class User {
  static let shared = User()
  var friends: [Friends] = []
  var blocks: [Friends] = []
}

struct Friends: Equatable {
  let name: String
}


class FriendList {
  func addFriend(name: String) {
    let user = User.shared
    let friend = Friends(name: name)
    user.friends.append(friend)
  }
  
  
  func blockFriend(name: String) {
    let friend = Friends(name: name)
    
    if let index = User.shared.friends.firstIndex(of: friend) {
      User.shared.friends.remove(at: index)
    }
    if !User.shared.blocks.contains(friend) {
      User.shared.blocks.append(friend)
    }
  }
}


var friendList = FriendList()
friendList.addFriend(name: "원빈")
friendList.addFriend(name: "장동건")
friendList.addFriend(name: "정우성")
User.shared.friends


friendList.blockFriend(name: "원빈")
User.shared.friends
User.shared.blocks
```

***

[도움 사이트 - 부스트코스](https://www.edwith.org/boostcourse-ios/lecture/16857/)

[애플 공식 문서 - Navigation - App Architecture](https://developer.apple.com/ios/human-interface-guidelines/app-architecture/navigation/)

[애플 공식 문서 - Navigation Controllers](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewControllerCatalog/Chapters/NavigationControllers.html)

[애플 공식 문서 - UINavigationBar - UIKit](https://developer.apple.com/documentation/uikit/uinavigationbar)

[애플 공식 문서 - UINavigationController - UIKit](https://developer.apple.com/documentation/uikit/uinavigationcontroller)



