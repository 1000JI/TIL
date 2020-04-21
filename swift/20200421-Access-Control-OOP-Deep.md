# 2020년 04월 21일(월)



## Access Control

* [Access Control 공식 문서](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)
* 다른 모듈의 코드 또는 다른 소스 파일 등으로부터 접근을 제한하는 것

- 세부 구현 내용을 숨기고 접근할 수 있는 인터페이스 지정 가능
- 모듈(Module)
  - import 를 통해 다른 모듈로부터 불러들일 수 있는 하나의 코드 배포 단위
  - Library / Framework / Application 등 



### Access Levels

1. Open(가장 개방적): Public + can subclass/override
2. Public: External modules have access to you
3. Internal(**Default**): within module
4. Fileprivate: within .swift file
5. Private(가장 제한적): Within enclosing scope



### Access Default

- Private -> Fileprivate

- Fileprivate -> Fileprivate

- Internal -> Internal

- Public -> Internal 

- Open -> Internal

``` swift
// 별도로 명시하지 않으면 someProperty는 Internal 레벨
// public도 동일
open class OClass {
    var someProperty: Int = 0
}

// 별도로 명시하지 않으면 someProperty는 Internal 레벨
// 더 높은 레벨을 설정할 수는 있지만,
// 애초에 클래스 자체에 접근할 수 있는 레벨이 낮으므로 의미 없음
internal class IClass {
    open var openProperty = 0
    public var publicProperty = 0
    var someProperty: Int = 0
}

// 별도로 명시하지 않으면 someProperty는 fileprivate 레벨
fileprivate class FClass {
    var someProperty: Int = 0
}

// 별도로 명시하지 않으면 someProperty는 fileprivate 레벨
private class PClass {
    var someProperty: Int = 0
}
```

### Getters and Setters

```` swift
/***************************************************
 Getter 와 Setter 는 그것이 속하는 변수, 상수 등에 대해 동일한 접근 레벨을 가짐
 이 때 Getter 와 Setter 에 대해서 각각 다른 접근 제한자 설정 가능
 ***************************************************/

/***************************************************
 Setter 설정
 ***************************************************/

class TrackedString {
//  var numberOfEdits = 0

//  private var numberOfEdits = 0
  private(set) var numberOfEdits = 0

  var value: String = "" {
    didSet {
      numberOfEdits += 1
    }
  }
}


let trackedString = TrackedString()
trackedString.numberOfEdits
trackedString.value = "This string will be tracked."
trackedString.numberOfEdits

trackedString.value += " This edit will increment numberOfEdits."
trackedString.numberOfEdits

trackedString.value = "value changed"
trackedString.numberOfEdits

//trackedString.numberOfEdits = 0
//trackedString.numberOfEdits
````

* Internal 모듈에서 .swift <-> .swift 간 접근 가능한 것
  1. Public
  2. Internal
  3. Default(Internal)
  4. Fileprivate(X) 단, 동일 파일 내에서는 fileprivate 클래스에 접근 가능

``` swift
// 동일 파일 내에서는 fileprivate 클래스에 접근 가능
class SameFileAnotherClass {
    private let someProperty = FileprivateClass()	// 기본 let 형은 Internal 이기에 private 또는 fileprivate로 선언해야함
    
    func someFunction() {
        let fileprivateClass = FileprivateClass()
        print(fileprivateClass.publicProperty)
        print(fileprivateClass.internalProperty)
        print(fileprivateClass.fileprivateProperty)
        //    print(fileprivateClass.privateProperty)  // 접근 불가
        
        print(fileprivateClass.defaultProperty)  // = fileprivate
    }
}
```



***



## OOP 4대 특징

- 추상화 (Abstraction)
  - 대상의 불필요한 부분을 무시하여 복잡성을 줄이고 목적에 집중할 수 있도록 단순화 시키는 것 (디자인 레벨)
    - 사물들 간의 공통점만 취하고 차이점을 버리는 일반화를 통한 단순화
    - 중요한 부분의 강조를 위해 불필요한 세부 사항을 제거하는 단순화
  - 관심영역=도메인=컨텍스트 / 추상화=모델링=설계
  - e.g. 지하철 노선도, 비상구 이미지, 이모지, 캐리커쳐 등
  - **추상화는 대상에 대한 관점과 사용 목적에 따라 달라질 수 있음**

```` swift
protocol Human {
    var name: String { get }
    var age: Int { get }
    var gender: String { get }
    var height: Double { get }
    
    func sleep()
    func eat()
    func walk()
}

class User: Human {
    var name: String    = ""
    var age: Int        = 0
    var gender: String  = ""
    var height: Double  = 0.0

    func sleep() { }
    func eat() { }
    func walk() { }
}

// ------------------

protocol Jumpable {
    var canJump: Bool { get set }	// 적어도 만족해야함
    var jumpHeight: Double { get } // 최소한의 조건
}

class Cat: Jumpable {
    //  let canJump = true  // get
    var canJump = true  // get set
    
    private var _jumpHeight = 30.0
    var jumpHeight: Double {	// get, set 모두 해줘야함
        get { _jumpHeight }
        //    set { _jumpHeight = newValue }
    }
}

let cat = Cat()
if cat.canJump {
    print(cat.jumpHeight)
}
````

- set 같은 경우 let은 안되고 var로 해주어 get, set을 모두 할 수 있도록 해줘야함
- { get } or { get set }을 만들어 줄 경우 let 말고 var로 선언해야함

Q1) 추상화 적용해보기 (Protocol 로 표현)

- 사람(Human)을 표현하는 속성과 동작 정의

``` swift
protocol Human1 {
    var name: String { get }
    var age: Int { get }
    var gender: String { get }
    var height: Double { get }
    
    func sleep()
    func eat()
    func walk()
}
```



- 레스토랑을 운영하는 오너(Owner)의 속성과 동작 정의

``` swift
protocol Owner1 {
    var name: String { get }
    
    func promote()
    func hire()
    func fire()
}
```



- 요리사(Chef)의 속성과 동작 정의

``` swift
protocol Chef1 {
    var position: String { get }
    
    func cook()
    func decorate()
    func buyFoodIngredients()
}
```



- 손님(Customer)의 속성과 동작 정의

``` swift
protocol Customer1 {
    var money: Int { get }
    
    func order()
    func eat()
    func rateRestaurant()
}
```



***

- 캡슐화 (Encapsulation) (은닉화 (Information Hiding) )
  - 추상화가 디자인 레벨에 해당하는 개념이라면 캡슐화는 구현 레벨에서의 개념
    - 데이터 캡슐화 (Data Encapsulation): 연관된 상태와 행동을 하나의 단위 (객체) 로 캡슐화
    - 정보 은닉화 (Information Hiding): 외부에 필요한 것만 알리고 불필요하거나 감출 정보는 숨김
  - 객체가 독립적으로 자신의 상태와 역할을 책임지고 수행할 수 있도록 자율성 부여
  - 접근 제한자(private)를 이용해 데이터를 외부로부터 보호하여 무결성을 강화하고 변화에 유연하게 대응
  - 자세히 몰라도 되는 내부 동작방법을 숨기고 사용하는 방법만을 외부로 노출
  - 외부에서 요청을 전달하면 수신 객체는 ‘어떻게’ 처리할 지를 결정. 외부에서 그 내용을 자세히 알 필요 없음
  -  [ 예 ] - 선풍기, 핸드폰, 리모콘, 카메라, 캡슐 등

```` swift
class 회사 {
    let 직원1: 직원 = 직원()
    let 직원2: 직원 = 직원()
}
class 직원 {
    private func 밤샘() {}
    private func 코피() {}
    
    func 결과물산출() {}
}

let company = 회사()
company.직원1.결과물산출()
company.직원2.결과물산출()
````

Q1) 캡슐화 적용해보기

- A가 서울에서 부산까지 여행을 가기로 함
 - A의 현재 위치는 currentLocation 이라는 메서드를 통해서만 확인 가능
 - 부산으로 이동하는 동작(메서드)을 구현하고 위치의 변경은 이 메서드를 통해서만 가능
 - 부산까지 이동하는 도중에 다른 일들을 할 수 있지만 A 클래스 외부에서는 자세한 내용은 알거나 직접 건드리지 못 함

```` swift
class A {
    private var presentLocation: String = "서울"
    
    private func doSomething1() {
        print("휴게소 들림!!!")
    }
    private func doSomething2() {
        print("바다 구경!!!")
    }
    
    func currentLocation() {
        print("현재 위치 => \(presentLocation)")
    }
    func goToBusan() {
        print("\(presentLocation)에서 출발~~~~")
        doSomething1()
        doSomething2()
        presentLocation = "부산"
        print("\(presentLocation)에 도착~~~~")
    }
}

let a = A()
a.currentLocation()
a.goToBusan()
a.currentLocation()
````



***



- 상속성 (Inheritance)
  - 하나의 클래스의 특징(부모 클래스)을 다른 클래스가 물려받아 그 속성과 기능을 동일하게 사용하는 것
  - 범용적인 클래스를 작성한 뒤 상속을 이용해 중복되는 속성과 기능을 쉽게 구현 가능
  - 주요 목적 : 재사용과 확장 (**상속은 수직 확장**, **Extension 은 수평 확장**)
  - 부모 클래스와 자식 클래스는 IS-A 관계. Bird is a Animal / Human is a Animal
  - 다이아몬드 상속 문제로 인해 언어에 따라 다중 상속을 허용하기도 하고 비허용 하기도 함
  - Swift 에서는 다중 상속을 비허용하고 대신 Protocol 을 이용하여 유사 기능 구현

Q1) Person, Student, University Student 클래스 구현하고 관련 속성 및 메서드 구현

``` swift
class Person {
    var name    : String    = "홍길동"
    var age     : Int       = 49
    
    func eat() {
        print("냠냠")
    }
}

class Student : Person {
    var school  : String    = "계원예고"
    
    func goToSchool() {
        print("학교를 간다")
    }
}

class UniversityStudent : Student {
    var grade   : Double    = 4.5
    
    func goToStudy() {
        print("공부를 하러 간다.")
    }
}

var jiWoon = UniversityStudent()
jiWoon.eat()
jiWoon.name
jiWoon.goToSchool()
jiWoon.goToStudy()
```



***



- 다형성 (Polymorphism)

  - 다양한 형태로 나타날 수 있는 능력 / 여러 형태(many shapes)를 가진다는 의미의 그리스어에서 유래
  - 동일한 요청에 대해 각각 다른 방식으로 응답할 수 있도록 만드는 것
  - 오버라이딩(상속과 관련)과 오버로딩(상속과 무관)이 있으며 언어에 따라 오버라이딩만 지원하기도 함
  - 오버라이딩 (Overriding) 
    - 상위 클래스에서 상속 받은 메서드를 하위 클래스에서 필요에 따라 재정의하는 것 
    - 동일 요청이 객체에 따라 다르게 응답

  ```` swift
  class Shape {
    func draw() { }
  }
  class Circle: Shape {
    override func draw() { print("draw circle") }
  }
  clas Triangle: Shape {
    override func draw() { print("draw triangle") }
  }
  ````

  

  - 오버로딩 (Overloading)
    - 동일한 이름의 메서드가 매개 변수의 이름, 타입, 개수 등의 차이에 따라 다르게 동작하는 것 
    - 동일 요청이 매개 변수에 따라 다르게 응답

  ```` swift
  func someFunction(param: Int) {
    print(param)
  }
  func someFunction(param: String) {
    print(param)
  }
  
  someFunction(param: 10)
  someFunction(param: "10")
  ````



* Addition

``` swift
print("\n---------- [ Overloading ] ----------\n")

/***************************************************
 1. 다른 파라미터 이름
 2. 다른 파라미터 타입
 3. 다른 파라미터 개수
 ***************************************************/

func printParameter() {
    print("No param")
}

//func printParameter() -> String {   // Error
//  "No param"
//}	// 인자값이 없기 때문에 구분 할 수 없음

func printParameter(param: Int) {
    print("Input :", param)
}

func printParameter(_ param: Int) {
    print("Input :", param)
}

// OR

func printParameter(param: String) {
    print("Input :", param)
}

func printParameter(_ param: String) {
    print("Input :", param)
}

func printParameter(name param: String) {
    print("Input :", param)
}

//func printParameter(param name: String) {   // Error
//  print("Input :", name)
//}
```

``` swift
print("\n---------- [ Overriding ] ----------\n")

class Shape {
    var title = "Shape"
    var color: UIColor
    // 오버라이딩 불가
    final var lineWidth = 3
    
    init(color: UIColor) {
        self.color = color
    }
    func draw() {
        print("draw shape")
    }
}

let shape = Shape(color: .cyan)
shape.color
shape.draw()

print("\n---------- [ Rectangle ] ----------\n")

class Rectangle: Shape {
    var cornerRadius: Double // 저장 프로퍼티
    
    // 상속 시 저장 프로퍼티 X
    //  override var color: UIColor  = .green
    
    // 상속 시 계산 프로퍼티 O
    override var color: UIColor {
        get { super.color }
        set { super.color = newValue }
    }
    override var title: String {
        //    get { "Rectangle" }
        get { super.title + " => Rectangle" }
        set { super.title = newValue }
    }
    
    init(color: UIColor, cornerRadius: Double = 10.0) {
      // 먼저 자기가 가지고 있는 프로퍼티를 초기화 해줘야함
        self.cornerRadius = cornerRadius
        super.init(color: color)
    }
}

// init 에 default 값이 있어서~~
let rect1 = Rectangle(color: .black)
let rect2 = Rectangle(color: .black, cornerRadius: 20)

let rect = Rectangle(color: UIColor.blue)
rect.color
rect.color = .yellow
rect.color

rect.cornerRadius
rect.lineWidth	// final 때문에 그대로 써야함
rect.draw()

shape.title
rect.title


print("\n---------- [ Triangle ] ----------\n")

class Triangle: Shape {
    override func draw() {
        super.draw()   // <- 부모가 가진 메서드 호출
        print("draw triangle")
    }
}

let triangle = Triangle(color: .gray)
triangle.title
triangle.lineWidth
triangle.color

triangle.draw()
```

Q1) bark() 메서드를 가진 Dog 클래스를 상속받아 Poodle, Husky, Bulldog 이 서로 다르게 짖도록 구현

``` swift
class Dog {
    func bark() {
        print("멍멍")
    }
}

class Poodle: Dog {
    override func bark() {
        print("꺙꺙")
    }
}

class Husky: Dog {
    override func bark() {
        print("훠우훠우")
    }
}

class Bulldog: Dog {
    override func bark() {
        super.bark()
        print("으르르르")
    }
}

let dog = Dog()
dog.bark()

let poodle = Poodle()
poodle.bark()

let husky = Husky()
husky.bark()

let bulldog = Bulldog()
bulldog.bark()
```

