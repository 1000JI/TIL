# 2020년 04월 20일(월)

## OOP(**Object-Oriented Programming**)

- 에츠허르 데이크스트라
- 앨런 케이



### Swift

#### Objective-C: OOP(Object-Oriented Programming) 언어

#### Swift: POP(Protocol-Oriented Programming)을 지향하는 멀티 패러다임 언어

- 객체지향 프로그래밍이란 캡슐화, 다형성, 상속을 이용하여 코드 재사용을 증가시키고, 유지보수를 감소시키는 장점을 얻기위해서 객체들을 연결시켜 프로그래밍 하는 것
  - 추상화: 클래스나 객체를 제공
  - 상속: 이미 존재하는 것으로부터 새로운 추상화를 만들어 낼 능력을 제공
  - 런타임 다형성: 수행 시간에 바인딩 할 수 있는 어떠한 폼을 제공
- OOP
  - 단순한 데이터 처리 흐름에서 벗어나 각 역할을 지닌 객체들의 상호작용으로 동작
  - 객체: 데이터(상태) + 메서드(행위)
  - 최초의 OOP 언어: Smalltalk / Smalltalk + C -> Objective-C

Q1) 함수? 메서드? : 클래스 내부에 들어가는 것은 메서드, 외부는 함수(간단)



#### Class

- 추상(Abstract), 표현 대상에 대한 이데아(형상)
- 이상적인 존재(이미지, **설계도**, 틀, 설명서)
- 공통의 특징

#### Object

- 실체(Instance), 추상을 실체화한 대상
- 이데아의 모사
- 개별 속성

***



1. Class

``` swift
/*
 class <#ClassName#>: <#SuperClassName#>, <#ProtocolName...#> {
   <#PropertyList#>
   <#MethodList#>
 }
 
 let <#objectName#> = <#ClassName()#>
 objectName.<#propertyName#>
 objectName.<#functionName()#>
 */

class Dog {
  var color: String = "black"
  var eyeColor: String = "black"
  var height: Double = 40.0
  var weight: Double = 6.0
  
  func sit() {}
  func layDown() {}
  func shake() {}
}

let bobby: Dog = Dog()
bobby.color = "white"
bobbdy.sit()

let tory = Dog()
tory.color = "brown"
tory.layDown()

/*
Stack Memory에는 Heap의 주소를 가르키고 있음
예를 들어, Dog의 Class의 경우 Stack 공간에는
Dog의 프로퍼티, 메소드를 가지고 있는 Heap 주소 값을 가지고 있음(0x1234)
bobby => 0x1234, bobby는 인스턴스화 한 것
*/
```

Q1) 자동차 클래스 정의 및 객체 생성하기

``` swift
class Car_ {
    var model: String = "SELTOS"
    var modelYear: String = "2020"
    var color: String = "Gravity Gray"
    
    func drive() { print("drive~~") }
    func reverse() { print("reverse~~") }
}

let seltos = Car_()
print(seltos.model)
seltos.model = "seeeeeltos"
seltos.modelYear = "2000020"
print(seltos.model)
```

### Class Initialize

- 초기화(init)가 불필요한 경우 : 모든 저장 프로퍼티에 초기값이 설정되어 있음
- 초기화(init)가 필요한 경우 : 저장 프로퍼티 중 하나 이상이 초기값 미설정됨

``` swift
class Dog1 {
    let name = "Tory"
    let color = "Brown"
    
    func bowwow() {
        print("Dog1 Bowwow!")
    }
}

let tory = Dog1()
// let tory = Dog1.init()
tory.bowwow()

// AND-----------------------------

/*
 초기화 메서드가 필요한 경우 - 저장 프로퍼티 중 하나 이상이 초기값 미설정
 ==> init 메서드를 통해 설정
 */

// 파라미터 없는 경우

class Dog2 {
    let name: String
    let color: String
    
    init() {
        name = "Tory"
        color = "Brown"
    }
    
    func bowwow() {
        print("Dog2 Bowwow!")
    }
}

let tory2 = Dog2()
tory2.bowwow()

// AND ------------------------------

// 파라미터를 통해 설정하는 경우

class Dog3 {
    let name: String
    let color: String
    
    init(name: String) {
        self.name = name
        color = "Brown"
    }
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    
    func bowwow() {
        print("Dog3 Bowwow!")
    }
}

var tory3 = Dog3(name: "Tory")
var tory4 = Dog3(name: "Tory", color: "White")

tory3.name
tory3.color

tory4.name
tory4.color
```

***

### Property

- Property: **Class(O)**, **Structure(O)**, **Enumeration(X)**

``` swift
class StoredProperty {
    var width = 0.0
    var height = 0.0
}

let stored = StoredProperty()
stored.width = 123
stored.height = 456
stored.width
stored.height
```

***

### Lazy Stored Property

- 초기값이 인스턴스의 생성이 완료 될 때까지도 알 수 없는 외부 요인에 의존 할 때
- 초기값이 복잡하거나 계산 비용이 많이 드는 설정을 필요로 할 때
- 필요한 경우가 제한적일 때
- Property: **Class(O)**, **Structure(O)**, **Enumeration(X)**

``` swift
class BasicStoredProperty {
    var width = 10.0
    var height = 20.0
    
    var area = 200.0
    //  var area = self.width * self.height
  	// 이처럼 self. 사용이 불가능하다.
}

let basicStored = BasicStoredProperty()

// --------------------------------

class LazyStoredProperty {
    var width = 10.0
    var height = 20.0
    
    // 1. 외부 요인이나 다른 설정에 기반
    //  var area = self.width * self.height
    lazy var area = width * height
    
    // 2. 계산 비용이 많이 드는 상황
    //  var hardWork = "실행하면 약 10초 이상 걸려야 하는 작업"
    
    // 3. 필요한 경우가 제한적인 상황
    //  func ifStatement() {
    //    if true {   // 5%
    //      print(area)
    //    } else {    // 95%
    //      print(width)
    //    }
    //  }
}

let lazyStored = LazyStoredProperty()
lazyStored.width = 30
lazyStored.area

// 순서 주의
let lazyStored1 = LazyStoredProperty()
lazyStored1.area	// 200
lazyStored1.width = 30
lazyStored1.area	// 200, 최초에 한번 실행하고 나면 그 값으로 저장되기 때문에, 처음 200이 저장되고 나서 그 이후로 바꿔서도 200으로 유지되어있음
```

***

### Computed Property

- 자료를 저장하지 않고 매번 호출할 때마다 새로 계산
- Property: **Class(O)**, **Structure(O)**, **Enumeration(O)**

``` swift
/*
var <#variable name#>: <#type#> {
    get {
        <#statements#>
    }
    set {
        <#variable name#> = newValue
    }
}
 */

class ComputedProperty {
    var width = 5.0
    var height = 5.0
    
    lazy var lazyArea = width * height
    var area: Double {	// Computed Property
        width * height
//        get {
//            width * height
//        }
    }
    
    // Stored + Computed get(read), set(write)
    private var _koreanWon = 0.0
    var wonToDollar: Double {
        get {
            return _koreanWon / 1136.5
        }
        set {
            // newValue: 새로 들어오는 값
            _koreanWon = newValue
        }
    }
}

var computed = ComputedProperty()
computed.area
computed.lazyArea

computed.width = 10
computed.area
computed.lazyArea

computed.lazyArea = 50.0
computed.lazyArea

computed.width = 20
computed.height = 20
computed.area
computed.lazyArea

computed.wonToDollar
computed.wonToDollar = 10000
computed.wonToDollar
```

### Property Observer

- Property: **Class(O)**, **Structure(O)**, **Enumeration(X)**

``` swift
/*
var <#variable name#>: <#type#> = <#value#> {
    willSet {
        <#statements#>
    }
    didSet {
        <#statements#>
    }
}
 */
 

print("\n---------- [ Property Observer ] ----------\n")

class PropertyObserver {
    var height = 0.0
    
    var width = 0.0 {
        willSet {
            print("willSet :", width, "->", newValue)
            // width = 0.0,  newValue = 50.0
        }
        
        // 변경되는 시점  willSet <-> didSet 중간
        
        didSet {
            height = width / 2
            print("didSet :", oldValue, "->", width)
            // oldValue = 0.0,  width = 50.0
        }
    }
}

var obs = PropertyObserver()
obs.height = 50
obs.width = 50
```

### Type Property

- Shared
- Lazily Initialized
- Property: **Class(O)**, **Structure(O)**, **Enumeration(O)**

``` swift
/*
 선언 - static let(var) <#propertyName#>: <#Type#>
 class var <#propertyName#>: <#Type#> { return <#code#> }
 사용 - <#TypeName#>.<#propertyName#>
 
 static: override 불가
 class: 클래스에서만 사용 가능하고 computed property 형태로 사용. 서브클래스에서 override 가능
 */

print("\n---------- [ Type Property ] ----------\n")

class TypeProperty {
    static var unit: String = "cm"
    var width = 5.0
}

let square = TypeProperty()
square.width

let square1 = TypeProperty()
square1.width = 10.0
square1.width

TypeProperty.unit
print("\(square.width) \(TypeProperty.unit)")
print("\(square1.width) \(TypeProperty.unit)")

TypeProperty.unit = "m"
print("\(square.width) \(TypeProperty.unit)")
print("\(square1.width) \(TypeProperty.unit)")
```

***

### Equatable, Identical

``` swift
class Person {
  let name = "이순신"
  let age = 30
}

let person1 = Person()
let person2 = Person()

//person1 == "이순신"    // error
//person1 == person2   // error, 뭘 비교해야할지 안알려줌
```

***

### Equatable Protocol

``` swift
class User: Equatable {
    var name = "이순신"
    let age = 30
    
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.name == rhs.name
    }
}

let user1 = User()
var user2 = User()
user1 == user2
```

***

### Identical

```swift
user1.name	// 이순신
user2.name	// 이순신
user1 == user2	// true
user1 === user2	// false, 메모리 주소 값 비교

/*
 Value Type => struct, enum  (Stack 에 저장)
 Reference Type => class  (Heap 에 저장)
 */

/*
 let x = 5
 let y = User()
 let z = User()
 
           x   y        z
 [ Stack ] | 5 | 0x5F17 | 0x2C90 |
                   |        |
                   ---------|----------
           ------------------         |
           |                          |
         0x2C90          0x5F16     0x5F17
 [ Heap ]  | z's user data | SomeData | y's user data |
 
 --- in Memory ---
 값 타입(Value Type) - Stack
 참조 타입(Reference Type) - Stack -> Heap
 */

/*
 Identity Operators
 === : 두 상수 또는 변수가 동일한 인스턴스를 가르키는 경우 true 반환
 */

//1 === 1
//"A" === "A"

// 5 == 5
```

***

### ARC -> Automatic Reference Counting

``` swift
user2 = user1

// user1 -> 0x00001  <- user2       0x00002
// user2는 0x00001을 가르키게 되고, user2가 가르키고 있었던
// 0x00002는 더이상 사용하지 않게 되어 자동 삭제 된다.
// ARC -> Automatic Reference Counting

let humen = User() // count 1
// count가 0이되면 메모리에서 할당 해제가 됨
// count를 통해서 이 메모리에서 사용하고 있는지 확인할 수 있음

//user1.name
//user2.name
//user1 == user2    //
//user1 === user2   //
//
//user2.name = "세종대왕"
//user2.name
//user1.name
```

