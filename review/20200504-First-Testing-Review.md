# 2020년 05월 04일(월)



## First Testing Review

1. 네이밍 컨벤션의 종류를 나열하고 그것이 언제 사용되는지, 그리고 그 특징에 대해 설명

[ Pascal Case(Upper Camel Case) ]

- 파일명, 프로젝트명과 클래스명, 프로토콜명 같이 각 타입 이름 등에 사용
- 첫 알파벳을 대문자로 시작하고 이후 각 단어의 첫 알파벳만을 대문자로 하여 구분
- e.g. ViewController, Int, String

[ Camel Case(Lower Camel Case) ]

- 변수명, 메서드명, enum의 각 케이스 네이밍 등에 사용
- 첫 알파벳을 소문자로 시작하고 이후 각 단어의 첫 알파벳만을 대문자로 하여 구분
- e.g. viewWillAppear(), viewDidLoad()

***

2. Array, Set, Dictionary의 차이점에 대해 설명하고 예시 코드 작성

- 간단히 비교
  - Array - ordered collections of value.
  - Set - unordered collections of unique values.
  - Dictionary - unordered collections of key-value associations.

- 개별 내용
  - Array
    1. 인덱스를 기반으로, 값이 저장된 순서가 있음(Zero-based Integer Index)
    2. 중복 허용
  - Set
    1. Array처럼 같은 타입을 가진 연관된 값들의 모음
    2. 단, 순서가 없으며 **중복 비허용**
  - Dictionary
    1. Key - Value 쌍으로 이루어져 있으며, 둘 중 하나만 존재하지 않음
    2. Key는 중복 비허용, Value는 중복 허용
    3. 순서 없음

***

3. Value Type, Reference Type에 대한 예시와 그 차이점에 대해 설명

[ Value Types(값 타입) ]

- struct, enum, tuple
- Each instance keeps a unique copy of its data
- 메모리의 **Stack 영역**에 데이터가 저장
- Copy on Write
- 멀티 스레드 환경에서 유용

``` swift
struct S { var number = 10 }
var a = S()
var b = a
a.number = 20
print("\(a.number), \(b.number)")  // "10, 20"
```



[ Reference Types(참조 타입) ]

- usually defined as a class(반드시 클래스에만 해당하지는 않음)
- Instances share a single copy of the data
- 메모리의 **Stack 영역에 데이터가 담긴 주소를 가르키는 포인터가 저장** 되고, **Heap 영역에 실제 데이터가 저장**

``` swift
class C { var number = 10 }
var x = C()
var y = x
x.number = 20
print("\(x.number), \(y.number)")  // "20, 20"
```

***

4. Application의 LifeCycle의 각 상태에 대해 설명

[ Not runnig( = Terminated) ]

- The app has not been launched or was running but was terminated by the system.
- 아직 실행하지 않은 상태
- 시스템 또는 유저에 의해 앱이 종료된 상태

[ Active ]

- The app is running in the foreground and currently receiving events. This is the normal mode for foreground apps.
- 포그라운드에서 앱이 실행 중이며, 이벤트를 정상적으로 수신 받을 수 있는 상태

[ Background ]

- The app is in the background and executing code. Most apps enter this state briefly on their way to being suspended. However, an app that requests extra execution time may remain in this state for a period of time.
- 백그라운드에서 앱이 실행 중인 상태 또는 Suspended 상태로 넘어가기 직전 잠시 머무는 단계

[ Suspended ]

- The app is in the background but is not executing code. The system moves apps to this state automatically and does not notify them before doing so. While suspended, an app remains in memory but does not execute any code. When a low-memory condition occurs, the system may purge suspended apps without notice to make more space for the foreground app.
- 앱이 백그라운드에 있으며 메모리에는 남아있지만 어떤 코드도 수행하지 않고 있는 상태
- 메모리가 부족해지면 시스템에 의해 강제 종료될 수 있음

***

5. ViewController LifeCycle의 각 상태에 대해 설명

[ viewDidLoad ]

- view에 대한 로드가 완료된 시점(메모리 상에 저장 됨)에 호출

[ viewWillAppear ]

- view를 화면에 나타내기 직전 호출

[ viewDidAppear ]

- view를 화면에 나타낸 직후 호출

[ viewWillDisappear ]

- view가 화면에서 사라지기 직전 호출

[ viewDidDisappear ]

- view가 화면에서 사라진 직후 호출

[ loadView ]

- viewController의 rootView로 사용할 view를 로드할 때 사용

[ deinit ]

- viewController가 더 이상 필요하지 않아 메모리상에서 제거하기 직전에 호출

***

6. 다음 4개의 키워드(continue, break, return, fallthrough)가 쓰이는 위치와 역할에 대해 각각 설명

[continue ]

- The continue statement tells a loop to stop what it is doing and start again at the beginning of the next iteration through the loop
- **반복문** 내에서 사용
- 현재 수행하던 작업을 중단하고 반복문의 다음 반복자를 수행

[ break ]

- The break statement ends execution of an entire control flow statement immediately. The break statement can be used inside a switch or loop statement when you want to terminate the execution of the switch or loop statement earlier than would otherwise be the case.
- **반복문** 또는 **switch문** 내에서 사용
- 현재 반복문 또는 switch에서 수행하던 작업을 중단하고 즉시 해당 제어문에서 빠져나옴

[ return ]

- **함수** 내에서 사용
- 해당 함수의 작업을 즉각 중단하며 동시에 그 함수의 return type에 맞는 값을 반환
- 함수가 실행되었을 때 기대되는 어떤 결과값(Output)을 함수를 호출한 곳으로 반환해주는 역할

[ fallthrough ]

- The fallthrough keyword simply causes code execution to move directly to the statements inside the next case (or default case) block, as in C’s standard switch statement behavior.
- **switch문** 내에서 사용
- swtich문 내에서 첫 번째로 매칭된 케이스 수행된 후 바로 종료하는 대신 그 다음의 케이스까지 수행하게 하는 역할

***

7. Init 메서드가 필요한 경우와 그렇지 않은 경우의 차이점에 대해 설명

- 모든 저장 프로퍼티(stored property)에 초기화 값이 설정되어 있으면 Init 메서드 불필요하나, 하나라도 그렇지 않은 것이 있으면 Init 메서드 필요

***

8. Access Level을 각 단계별로 나열하고 그 차이점에 대해 설명

* [ open ] - 외부 모듈에서도 접근 가능하며 오버라이드 가능

* [ public ] - 외부 모듈에서도 접근 가능하도록 하되 오버라이드 불가

* [ internal ] - 해당 모듈 내에서만 접근 가능하도록 제한

* [ fileprivate ] - 해당 파일 내에서만 접근 가능하도록 제한

- [ private ] - 해당 스코프({ }) 내에서만 접근 가능하도록 제한

***

9. OOP 4대 특성에 대해 나열하고 각 특성에 대해 아는 만큼 설명 및 예시 코드 작성([playground]([https://github.com/1000JI/TIL/edit/master/review/20200501-First-Testing/firstTest_morning.playground/Pages/%EC%9D%B4%EB%A1%A0(9%EB%AC%B8%EC%A0%9C).xcplaygroundpage/Contents.swift](https://github.com/1000JI/TIL/edit/master/review/20200501-First-Testing/firstTest_morning.playground/Pages/이론(9문제).xcplaygroundpage/Contents.swift)) 참고)

***

10. Frame과 Bounds의 차이점에 대해 설명

[ Frame ]

- The frame rectangle, which describes the view’s location and size in its superview’s coordinate system.
- superView의 좌표계를 기반으로 해당 view에 대한 위치(좌표)와 사이즈를 나타내는 사각형
- 원점(0, 0)은 부모뷰(superView)의 시작 지점이며, 원점을 변경하면 자신의 위치가 이동하고 이에 따라 자신의 하위 뷰도 함께 움직임
- 상위(부모뷰) 뷰에서의 좌표를 나타내며 selfView.frame.origin = CGPoint(0, 0)을 하면 부모뷰의 0,0 좌표로 selfView가 이동한다.

[ Bounds ]

- The bounds rectangle, which describes the view’s location and size in its own coordinate system.
- 자기 자신의 좌표계를 기반으로 그 뷰의 위치와 사이즈를 표현하는 사각형
- 원점(0, 0)은 자체 뷰의 시작 지점이며, 원점을 변경하면 자신의 하위 뷰에만 영향을 줌
- 자기 자신의 좌표를 나타내며 selfView.bounds.origin = CGPoint(5, 5)를 하면 자식 뷰들이 -5, -5 만큼 이동한다.

***

11. 다음의 클로저를 FullSyntax로 부터 Optimized Syntax로 차근차근 줄여보세요. 그리고 그 과정에 일어나는 변화를 주석으로 설명하세요.

```` swift
func performClosure(param: (String) -> Int) {
  param("Swift")
}

performClosure(param: { (str: String) -> Int in
  return str.count
})

performClosure(param: { (str: String) in
  return str.count
})

performClosure(param: { str in
  return str.count
})

performClosure(param: {
  return $0.count
})

performClosure(param: {
  $0.count
})

performClosure(param: ) {
  $0.count
}

performClosure() {
  $0.count
}

performClosure { $0.count }
````

***

12. Enum 문제

``` swift
/*
 구글(google), 카카오(kakao), 네이버(naver) 로그인을 위해 Site라는 이름의 Enum 타입을 만들고자 합니다.
 각 case는 사용자의 아이디(String)와 비밀번호(String)를 위한 연관 값(associated value)을  가집니다.
 그리고 Site 타입 내부에는 signIn()이라는 이름의 메서드를 만들어 다음과 같이 문자열을 출력하는 기능을 구현해보세요.
 
 e.g.
 enum Site {}
 > Input
 let google = Site.google("google@gmail.com", "0000")
 google.signIn()
 
 > Output
 구글에 로그인하였습니다. (아이디 - google@gmail.com, 비밀번호 - 0000)
 */

// 내가 푼 Source
enum Site {
  case google(_ loginID: String, _ loginPW: String)
  case kakao(_ loginID: String, _ loginPW: String)
  case naver(_ loginID: String, _ loginPW: String)

  func signIn() {
    switch self {
      case .google(let loginID, let loginPW):
      print("구글에 로그인하였습니다. (아이디 - \(loginID), 비밀번호 - \(loginPW))")
      case .kakao(let loginID, let loginPW):
      print("카카오에 로그인하였습니다. (아이디 - \(loginID), 비밀번호 - \(loginPW))")
      case .naver(let loginID, let loginPW):
      print("네이버에 로그인하였습니다. (아이디 - \(loginID), 비밀번호 - \(loginPW))")
    }
  }
}

let google = Site.google("google@gmail.com", "0000")
google.signIn()


//----------------------------------------------//
//----------------------------------------------//
//----------------------------------------------//
// 강사님 Source
enum Site {
  case google(String, String)
  case kakao(String, String)
  case naver(String, String)
  
  func signIn() {
    switch self {
    case let .google(id, pw):
      print("구글에 로그인하였습니다. (아이디 : \(id), 비밀번호 : \(pw)")
    case let .kakao(id, pw):
      print("카카오에 로그인하였습니다. (아이디 : \(id), 비밀번호 : \(pw)")
    case let .naver(id, pw):
      print("카카오에 로그인하였습니다. (아이디 : \(id), 비밀번호 : \(pw)")
    }
  }
}

let google = Site.google("google@gmail.com", "1234")
google.signIn()
```





















