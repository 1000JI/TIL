
# 2020년 04월 16일(목)

## Optionals
- Optional 은 값이 없을 수 있는(absent) 상황에 사용
- Objective-C 에는 없는 개념
- 옵셔널 타입은 2가지 가능성을 지님
	* 값을 전혀 가지고 있지 않음
	* 값이 있으며, 그 값에 접근하기 위해 옵셔널을 벗겨(unwrap)낼 수 있음

### Optional Type Declaration
``` Swift
let possibleNumber = "123"
var convertedNumber = Int(possibleNumber)
print(convertedNumber)
// Optional은 Int(possibleNumber)가
// 숫자로 변경된 것일 수도 nil일수도 있기 때문이다. 
type(of: convertedNumber)

//type(of: Int("123"))	// Optional<Int>
//type(of: Int(3.14))	// Int
//type(of: Int(3))		// Int

// 선언 방법
var optionalType1: String?   // 자동 초기화 nil
var optionalType2: Optional<Int> = nil   // 수동 초기화. (값 또는 nil)


// Valueless state - nil
var optionalIntInit = Optional<Int>(0)
var optionalInt: Int? = 0
type(of: optionalInt)

optionalInt = nil
optionalInt
```

#### Optional 특징
``` Swift
// Optional -> NonOptional (X)
// Optional <- NonOptional (O)

// 각 타입이 가질 수 있는 값의 범위
var nonOptionalNumber: Int    // 정수
var optionalNumber: Int?      // 정수 or nil
```


### Optional Biding and Forced Unwrapping
- Optional Binding
``` Swift
/*
if let <#nonOptional#> = <#OptionalExpression#> {
	<#Code#>
}
while let <#nonOptional#> = <#OptionalExpression#> {
	<#Code#>
}
guard let <#nonOptional#> = <#OptionalExpression#> else {
	<#Code#>
}
*/

let someValue = "100"

if let number = Int(someValue) {
	print("\"\(someValue)\" has an integer value of \(number)")
} else {
	print("Could not be converted to an integer")
}

//----------------

// 여러 개의 옵셔널 바인딩과 불리언 조건을 함께 사용 가능
if let firstNumber = Int("4"),
	let secondNumber = Int("42"),
	firstNumber < secondNumber,
	secondNumber < 100 {
		print("\(firstNumber) < \(secondNumber) < 100")
}

// if문에서 "," 는 and(&&) 의미
```


### Forced Unwrapping
``` Swift
if convertedNumber != nil {
//	print("convertedNumber has an integer value of \(convertedNumber).")
	print("convertedNumber has an integer value of \(convertedNumber!).")
}
```

### IUO(Implicitly Unwrapped Optionals)
``` Swift
// Optional
let possibleString: String? = "An optional string."
//let forcedString: String = possibleString  // Error
let forcedString: String = possibleString!
type(of: possibleString)
type(of: forcedString)


// Implicitly Unwrapped Optional
// Non Optional 타입인 것처럼 함께 사용 가능
var assumedString: String! = "An implicitly unwrapped optional string."
let stillOptionalString = assumedString
type(of: assumedString)
type(of: stillOptionalString)
print(assumedString)
print(assumedString!)


// Optional -> NonOptional (X)
// String? -> String(X)
// String! -> String(O)
let implicitString: String = assumedString
type(of: implicitString)
```
- 추후 어느 순간에서라도 nil 이 될 수 있는 경우에는 이 것을 사용하지 말아야 함
- nil value 를 체크해야 할 일이 생길 경우는 일반적인 옵셔널 타입 사용
- 프로퍼티 지연 초기화에 많이 사용



### Nil-coalescing Operator
``` Swift
let anotherExpression = optionalStr ?? "This is a nil value"
print(optionalStr)
print(anotherExpression)


let optionalInteger: Int? = 100
let anotherExpression2 = optionalInteger ?? -1
print(anotherExpression2)
```

Q1. isTrue? a : b 와의 차이

Q2. optionalStr ?? "This is a nil value" 를 3항 연산자로 바꿔보기
``` Swift
let answer = optionalStr == nil ?  "Ths is a nil value" : optionalStr!
```


### Optional Chaining
``` Swift
let greeting: [String: String] = [
	"John": "Wassup",
	"Jane": "Morning",
	"Edward": "Yo",
	"Tom": "Howdy",
	"James": "Sup"
]

print(greeting["John"]) // Optional("Wassup")
print(greeting["John"]?.count) // Optional(6)
print(greeting["NoName"]) / nil

// Optional Binding
if let greetingValue = greeting["John"] {
	print(greetingValue.lowercased().uppercased())
}
```

``` Swift
var optionalArr1: [Int]? = [1,2,3]
// Int 값을 가지고 있는 Optional Array

var optionalArr2: [Int?] = [1,2,3]
// Int? 값을 가지고 있는 Array

```

### Optional Function Types
``` Swift
func voidFunction() {
  print("voidFunction is called")
}

//var functionVariable: () -> () = voidFunction
var functionVariable: (() -> ())? = voidFunction
functionVariable?()

functionVariable = nil
functionVariable?()

func sum(a: Int, b: Int) -> Int {
	a + b
}
sum(a: 2, b: 3)

//var sumFunction: (Int, Int) -> Int = sum(a:b:)
var sumFunction: ((Int, Int) -> Int)? = sum(a:b:)
type(of: sumFunction)

//print(sumFunction?(1, 2))
//print(sumFunction!(1, 2))

//sumFunction = nil
//sumFunction?(1, 2)
//sumFunction!(1, 2)
```

Q1) 아래 내용 참고하여 함수 정의
``` Swift
/*
2개의 정수를 입력받아 Modulo 연산(%)의 결과를 반환하는 함수를 만들되
2번째 파라미터와 결과값의 타입은 옵셔널로 정의.
	 두 번째 파라미터 입력값으로 nil 이나 0이 들어오면 결과로 nil을 반환하고, 그 외에는 계산 결과 반환

func calculateModulo(op1: Int, op2: Int?) -> Int? { }
*/

func calculateModulo2(op1: Int, op2: Int?) -> Int? {
	if let value = op2, value != 0 {
		return op1 % value
	} else {
		return nil
	}
  
  // OR
  
  guard let op2 = op2, op2 != 0 else { return nil }
  return op1 % op2
}
calculateModulo2(op1: 5, op2: 2)
```

***
## Enumerations

- 연관된 값의 그룹에 대해 공통 타입을 정의한 뒤 type-safe 하게 해당 값들을 사용 가능

``` swift
enum CompassPoint {
  case north
  case south
  case east
  case west
}

// 열거형 타입의 이름은 Pascal Case
// 각각의 case는 Camel Case

var directionToHead1 = CompassPoint.west
directionToHead1 = .east

var directionToHead2: CompassPoint = .north


enum Planet {
  case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto
}
```

### Matching Enumeration Values

``` swift
let directionToHead = CompassPoint.south

switch directionToHead {
case .north:
  print("Lots of planets have a north")
case .south:
  print("Watch out for penguins")
case .east:
  print("Where the sun rises")
case .west:
  print("Where the skies are blue")
}


let enumTypeAnnotation: Planet = .mars
let somePlanet = Planet.earth

switch somePlanet {
case .earth:
  print("Mostly harmless")
default:
  print("Not a safe place for humans")
}
```



### Associated Values

``` swift
enum OddOrEven {
  case odd(Int)
  case even(Int)
}

var number = OddOrEven.even(20)
number = OddOrEven.odd(13)

number
type(of: number)


switch number {	// 변수가 많이 없을 때
case .odd(let x): print("홀수 :", x)
case .even(let x): print("짝수 :", x)
}

switch number {	// 변수가 여러개 일 때
case let .odd(x): print("홀수 :", x)
case let .even(x): print("짝수 :", x)
}
```

``` swift
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

productBarcode
type(of: productBarcode)


switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
```

Q1) enum Month { case jan, feb } 정의하되 2월은 윤년인지 아닌지 정보를 저장할 수 있도록 구현

``` swift
enum Month {
    case jan, feb(Bool)
}

let february = Month.feb(false)

switch february {
case .jan: break
case .feb(let isLeafYear): print(isLeafYear)
}
```



### Raw Value

- Strings, Characters, or any of the Integer or Floating-point number types
- raw value 는 해당 Enumeration 내에서 반드시 고유한 값이어야 함.

``` swift
enum Weekday: Int {
    case sunday, monday, tuesday, wednesday, thursday, friday, saturday
  // 0, 1, 2, 3, ...
}

Weekday.wednesday
Weekday.wednesday.rawValue


enum WeekdayName: String {
    case sunday, monday, tuesday, wednesday, thursday, friday, saturday
  // "sunday", "monday", "tuesday", ...
}

WeekdayName.monday
WeekdayName.monday.rawValue


enum Gender: String {
    case male = "남자", female = "여자", other = "기타"
}

Gender.male
Gender.male.rawValue
```

Q1) 학점(A, B, C, D, F)을 enum 으로 표현하고 각 케이스에 알맞은 0.0 ~ 4.0 까지의 값 부여

``` swift
enum GradeScore: Double {
    case A = 4.0, B = 3.0, C = 2.0, D = 1.0, F = 0.0
}
GradeScore.A.rawValue
```



### Implicitly Assigned Raw Values

``` swift
enum WeekdayAgain: Int {
  case sunday = 5, monday, tuesday, wednesday, thursday, friday, saturday
//  case sunday, monday = 100, tuesday = 101, wednesday, thursday, friday, saturday
//  case sunday = 1, monday = 1, tuesday = 2, wednesday, thursday, friday, saturday
}

WeekdayAgain.sunday
WeekdayAgain.sunday.rawValue // 5

WeekdayAgain.wednesday
WeekdayAgain.wednesday.rawValue // 8



enum WeekdayNameAgain: String {
  case sunday, monday = "mon", tuesday = "tue", wednesday, thursday, friday, saturday
}

WeekdayNameAgain.tuesday
WeekdayNameAgain.tuesday.rawValue // tue

WeekdayNameAgain.wednesday
WeekdayNameAgain.wednesday.rawValue // wednesday
```

### Initializing from a Raw Value

``` swift
enum PlanetIntRaw: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto
}

PlanetIntRaw.venus
PlanetIntRaw.venus.rawValue

PlanetIntRaw(rawValue: 5) // jupiter
PlanetIntRaw(rawValue: 7) // uranus

//PlanetIntRaw(rawValue: 0) // nil
//PlanetIntRaw(rawValue: 15) // nil

//----------------------

let positionToFind = 7
//let positionToFind = 11

if let somePlanet = PlanetIntRaw(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}
```

### Nested

``` swift
enum Device: String {
    case iPhone, iPad, tv, watch
    
    func printType() {
        switch self {
        case .iPad, .iPhone, .tv:
            print("device :", self)
        case .watch:
            print("apple Watch")
        }
    }
}

let iPhone = Device.iPhone
iPhone.printType()



enum Wearable {
    enum Weight: Int {
        case light = 1
        case heavy = 3
    }
    
    case helmet(weight: Weight)
    case boots
    
    func info() -> Int {
        switch self {
        case .helmet(let weight):
            return weight.rawValue * 2
        case .boots:
            return 3
        }
    }
}


let boots = Wearable.boots
boots.info()

var woodenHelmet = Wearable.helmet(weight: .light)
woodenHelmet.info()

var ironHelmet = Wearable.helmet(weight: .heavy)
ironHelmet.info()
```

### Mutating

- enum 타입 내부 함수에서 자기 자신의 값을 변경해야 할 경우 **mutating** 키워드 필요

``` swift
enum Location {
    case seoul, tokyo, london, newyork
    
    mutating func travelToLondon() {
        self = .london
    }
    
    mutating func travelToTokyo() {
        self = .tokyo
    }
    
    mutating func travel(to location: Location) {
        self = location
    }
    
    mutating func travelToNextCity() {
        switch self {
        case .seoul: self = .tokyo
        case .tokyo: self = .newyork
        case .newyork: self = .london
        case .london: self = .seoul
        }
    }
}

var location = Location.seoul
location	// seoul

location.travelToTokyo()
location	// tokyo

location.travel(to: .london)
location	// london

location.travelToNextCity()	// seoul
location.travelToNextCity()	// tokyo
location.travelToNextCity() // newyork
location	// newyork
```

Q1) on 과 off 값을 가진 enum 타입 RemoteControl 을 정의하고, 그 내부에 호출 시마다 on, off 값을 바꿔주는 함수 구현

``` swift
enum RemoteControl {
    case switchON, switchOFF
    
    mutating func turnSwitch() {
        if self == .switchON {
            self = .switchOFF
        } else {
            self = .switchON
        }
    }
}

var remote: RemoteControl = .switchON
remote.turnSwitch()
remote
remote.turnSwitch()
remote
```







