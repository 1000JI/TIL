# 2020년 05월 11일(월)

## ARC(Automatic Reference Counting)

- RC 자동 관리 방식(WWDC 2011 발표)
- 컴파일러가 개발자를 대신하여 메모리 관리 코드를 적절한 위치에 자동으로 삽입
- GC 처럼 런타임이 아닌 컴파일 단에서 처리 (Heap 에 대한 스캔 불필요 / 앱 일시 정지 현상 없음) 
- 메모리 관리 이슈를 줄이고 개발자가 코딩 자체에 집중할 수 있도록 함

- **ARC는 클래스의 인스턴스에만 적용** (**Class** - Reference 타입 , Struct / Enum - Value 타입)
- 활성화된 참조카운트가 하나라도 있을 경우 메모리에서 해제 되지 않음
- 참조 타입
  - 강한 참조 (Strong) : 기본값. 참조될 때마다 참조 카운트 1 증가
  - 약한 참조 (Weak), 미소유 참조 (Unowned) : 참조 카운트를 증가시키지 않음
- ``retain`` 을 해주면 refCount가 1이 증가함 

> strong : 기본값. 강한 참조. Reference Count 1 증가
>
> unowned : 미소유 참조. Count 증가하지 않음. 참조 객체 해제 시에도 기존 포인터 주소 유지
>
> weak : 약한 참조. Count 증가하지 않음. 참조하던 객체 해제 시 nil 값으로 변경

### Struct in ARC



### Strong Reference Cycle

- 객체에 접근 가능한 모든 연결을 끊었음에도 순환 참조로 인해 활성화된 참조 카운트가 남아 있어 메모리 누수가 발생하는 현상
- 앱의 실행이 느려지거나 오동작 또는 오류를 발생시키는 원인이 됨(메모리 누수)

```swift
class Person {
  var pet: Dog?
  func doSomething() {}
  deinit {
    print("Person is being deinitialized")
  }
}

class Dog {
  var owner: Person?
  func doSomething() {}
  deinit {
    print("Dog is being deinitialized")
  }
}



var giftbot: Person? = Person() // count 1
var tory: Dog? = Dog() // count 1

giftbot?.pet = tory // Dog - count 2
tory?.owner = giftbot // Person - count 2

//-------------------------------------------//
// Q) 두 객체를 메모리에서 할당 해제하려면 어떻게 해야 할까요?
giftbot?.pet = nil // Dog - count 1
tory?.owner = nil // Person - count 1

giftbot = nil // Person - count 0
tory = nil // Dog - count 0
```



### Weak Reference



### ARC Reference Code

#### 참조 카운트 증가

``` swift
var obj2: Person? = Person(testCase: "case2") // count 1
var countUp = obj2 // count 2


obj2 = nil // count 1
countUp = nil // count 0
```

#### Collection에 의한 참조 카운트

``` swift
var obj3: Person? = Person(testCase: "case3") // count 1
var array = [obj3, obj3] // count 3

obj3 = nil // count 2
array.remove(at: 0) // count 1
array.remove(at: 0) // count 0
```

#### 강한 참조, 약한 참조

``` swift
var strongObj4 = Person(testCase: "case4") // count 1
print(strongObj4)

weak var weakObj4 = Person(testCase: "case4") // count 0
print(weakObj4)

//unowned var unownedObj4 = Person(testCase: "case4") // error 발생 -> count 0 이면서, 주소를 유지하고 있으나 데이터는 유지하고 있지 않고 있다
//print(unownedObj4)
```

> Q1) 다음 4줄의 코드 중 사용 불가능한 것은?
>
> ``` swift
> unowned let unownedLet = strongObj4
> unowned var unownedVar = strongObj4
> //weak let weakLet = strongObj4 // weak은 값이 있을수도 있고 없을 수도 있기 때문에 let인 경우 nil이 들어갈 수 없다. 따라서 weak일 경우에는 var로 해줘야 한다.
> weak var weakVar = strongObj4
> 
> 
> // unowned 와 weak 의 타입은?
> print("Unowned type: ", type(of: unownedVar))
> print("Weak type: ", type(of: weakVar)) // Optional
> ```
>
> Q2) unowned 와 weak 의 타입은?
>
> ``` swift
> print("Unowned type: ", type(of: unownedVar))
> print("Weak type: ", type(of: weakVar)) // Optional
> ```

#### 스코프 범위에 의한 할당 및 해제

``` swift
class LocalScope {
  func doSomething() {}
  deinit {
    print("LocalScope is being deinitialized")
  }
}

class ClassProperty {
  func doSomething() {}
  deinit {
    print("ClassProperty is being deinitialized")
  }
}

class Application {
  var prop = ClassProperty()
  
  func allocateInstance() {
    let local = LocalScope()
    local.doSomething()
  }
  
  deinit {
    print("Application is being deinitialized")
  }
}


// Q. 아래의 코드 실행 시 출력되는 메시지는?

var app: Application? = Application()
app?.prop.doSomething()
app?.allocateInstance()


// Q. ClassProperty 객체의 deinit 메서드가 호출되려면 어떻게 할까요?
app = nil // 첫 번째 방법

//app?.prop = nil // ClassProperty를 Optional로 설정
```

#### Strong, Unowned, Weak

```swift
class Teacher {
  var student: Student?
  deinit {
    print("Teacher is being deinitialized")
  }
}

class Student {
  // strong, unowned, weak
//  let teacher: Teacher
//  unowned let teacher: Teacher
  weak var teacher: Teacher?
  
  init(teacher: Teacher) {
    self.teacher = teacher
  }
  deinit {
    print("Student is being deinitialized")
  }
}

var teacher: Teacher? = Teacher() // U-T-count 1
var student: Student? = Student(teacher: teacher!) // U-S-count 1, U-T-count 1
teacher?.student = student // U-S-count 2


print("\n---------- [ teacher release ] ----------\n")
//teacher?.student = nil // Strong
teacher = nil // U-T-count 0, U-S-count 1

print("\n---------- [ student release ] ----------\n")
student = nil // U-S-count 0



/***************************************************
 1) strong  : 명시적으로 nil 대입 필요. teacher?.student = nil
 2) unowned : 자동으로 deinit. nil 처리 된 속성에 접근하면 런타임 에러 발생
 3) weak    : 자동으로 deinit. nil 처리 된 속성에 접근하면 nil 반환
 ***************************************************/
```

#### 다음 코드를 보고 문제가 있는지 없는지 확인

``` swift
final class MemoryViewController: UIViewController {
  
  final class Person {
    var apartment: Apartment?
    let name: String
    
    init(name: String) {
      self.name = name
    }
    deinit {
      print("\(name) is being deinitialized")
    }
  }
  
  final class Apartment {
    var tenant: Person?
    let unit: String
    
    init(unit: String) {
      self.unit = unit
    }
    deinit {
      print("Apartment \(unit) is being deinitialized")
    }
  }
  
  var person: Person? = Person(name: "James")
  var apartment: Apartment? = Apartment(unit: "3A")
  
  func loadClass() {
    person?.apartment = apartment
    apartment?.tenant = person
  }
  
  deinit {
    print("MemoryViewController is being deinitialized")
  }
}


var memoryVC: MemoryViewController? = MemoryViewController()
memoryVC?.loadClass()

//memoryVC?.person?.apartment = nil
//memoryVC?.apartment?.tenant = nil
/*
 둘 중에 하나를 하거나 weak을 넣어주거나
 person?.apartment에 weak으로 선언하거나
 apartment?.tenant에 weak으로 선언하거나
 둘 중 하나에 weak으로 선언하면 된다.(그림 그려보면 쉬움)
 */

memoryVC = nil// memoryVC가 nil되면 person, apartment에 nil를 안 넣어줘도 해제가 된다
/*
 memoryVC(1) -> apartment(1) -> person(1)
 */

/***************************************************
 1. 문제가 있는지 없는지 확인
 2. 문제가 없다면 참조카운트가 어떻게 바뀌면서 잘 해결이 되었는지 정리하고
    문제가 있다면 어떤 부분이 그런지 알아보고 직접 해결해 볼 것
 ***************************************************/
```



---

## Struct

 **[ 클래스와 구조체 공통점 ]**
 - **값을 저장하기 위한** 프로퍼티
 - 기능을 제공하기 위한 메서드
 - **초기 상태를 설정하기 위한 생성자**
 - 기본 구현에서 기능을 추가하기 위한 확장(**Extension**)
 - 특정 값에 접근할 수 있는 첨자(**Subscript**)
 - 특정한 기능을 수행하기 위한 **프로토콜 채택**
 - **Upper Camel Case** 사용

 **[ 클래스만 제공하는 기능 ]**
 - 상속 (**Inheritance**)
 - 소멸자 (**Deinitializer**)
    - ``deinit{ }``
 - 참조 카운트 (**Reference counting**)
    - Heap에서만 사용하기 때문에 Struct에서는 사용하지 않음

### 생성자 비교

``` swift
// var로 선언된 변수
class UserClass1 {
  var name = "홍길동"
}
struct UserStruct1 {
  var name = "홍길동"
}

let userC1 = UserClass1()
//let userC2 = UserClass1(name: "깃봇") // error
let userS1_1 = UserStruct1()
let userS1_2 = UserStruct1(name: "깃봇")
userS1_1.name	// "홍길동"
userS1_2.name // "깃봇"

// 따라서 class에서는 init을 만들어줘야 한다.
```

``` swift
// 프로퍼티에 초기화 값이 없을 때
class UserClass2 {
  var name: String
  // 초기화 메서드 없으면 오류
  init(name: String) { self.name = name }
}

struct UserStruct2 {
  var name: String
  var age: Int
  
  // 초기화 메서드 자동 생성
  // 단, 생성자를 별도로 구현했을 경우 자동 생성하지 않음
//  init(name: String) {
//    self.name = name
//    self.age = 10
//  }
}

let userC2 = UserClass2(name: "홍길동")
let userS2 = UserStruct2(name: "홍길동", age: 10)
```

``` swift
// 저장 프로퍼티 중 일부에만 초기화 값이 있을 때
class UserClass3 {
  let name: String = "홍길동"
  // 저장 프로퍼티 중 하나라도 초기화 값이 없는 경우 생성자를 구현해야 함
//  let age: Int
}

struct UserStruct3 {
  let name: String = "홍길동"
  let age: Int
}
// 초기화 값이 없는 저장 프로퍼티에 대해서만 생성자로 전달
let userS3 = UserStruct3(age: 10)
```

``` swift
// 지정(Designated) 생성자, 편의(Convenience) 생성자
class UserClass4 {
  let name: String
  let age: Int
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
  convenience init(age: Int) {
    self.init(name: "홍길동", age: age)
  }
}

// error
//extension UserClass4 {
//  init() {
//    self.name = "홍길동"
//    self.age = 20
//  }
//}

struct UserStruct4 {
  let name: String
  let age: Int
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
  
  // Convenience 키워드 사용 X, 지정과 편의 생성자 별도 구분 없음
//  convenience init(age: Int) {
  init(age: Int) {
    self.init(name: "홍길동", age: age)
  }
}

// 따라서 extension에서도 생성자 추가 가능
extension UserStruct4 {
  init(name: String) {
    self.name = name
    self.age = 10
  }
}

let userS4_1 = UserStruct4(name: "홍길동")
let userS4_2 = UserStruct4(age: 20)
```

### 프로퍼티 변경

``` swift
struct PointStruct {
  var x = 0
  
  mutating func updateX() { // mutating을 붙여줘야함
    self.x = 5
  }

  var updateProperty: Int {
    get { x }
    set { x = newValue } // 연산 프로퍼티의 setter는 기본적으로 mutating
  }
}


var p2 = PointStruct()
p2.updateX()
p2.updateProperty = 3
p2.updateProperty
```



***

### 애플 권장사항

- 구조체를 기본으로 사용
- 클래스를 사용해야 할 때
  - Objective-C와 호환성이 필요할 때
  - equality(동등성) 외에 identity(정체성, 동일성)를 제어해야 할 때
  - RC(Reference Counting)와 소멸자(deinitialization)가 필요할 때
  - 값이 중앙에서 관리되고 공유되어야 할 때

---

