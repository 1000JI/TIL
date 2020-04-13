
# 구조체
## 1. 구조체란?
- Swift 대부분 타입은 구조체로 이루어져 있다.
- 구조체는 **값(value) 타입**이다.
- 타입 이름은 대문자 카멜케이스를 사용하여 정의한다.
- **Stack Memory** 영역에 할당(**속도가 빠름**)
    + **Scope Based Lifetime**: 컴파일 타임에 complier가 언제 메모리를 할당/해제 할지 정확히 알고 있다.
    + Data Locality: **CPU 캐시 히트율이 높다.**
- 항상 새로운 변수로 복사 되기 때문에 **Multi-thread 환경에서 공유변수로 인해 문제가 발생할 확률이 높다**.

## 2. 구조체 문법
- 구조체 정의: ```struct``` 키워드 사용
- 구조체 프로퍼티 및 메서드 구현
``` Swift
struct Sample {
    // 가변 프로퍼티(값 변경 가능)
    var mutableProperty: Int = 100 
    
    // 불변 프로퍼티(값 변경 불가능)
    let immutableProperty: Int = 100 
    
    // 타입 프로퍼티(static 키워드 사용 : 타입 자체가 사용하는 프로퍼티)
    static var typeProperty: Int = 100  // Sample.typeProperty
    
    // 인스턴스 메서드(인스턴스가 사용하는 메서드)
    func instanceMethod() {
        print("instance method")
    }
    
    // 타입 메서드(static 키워드 사용 : 타입 자체가 사용하는 메서드)
    static func typeMethod() {  // Sample.typeMethod()
        print("type method")
    }
}
```

- 구조체 사용

``` Swift
// 가변 인스턴스 생성
var mutable: Sample = Sample()

mutable.mutableProperty = 200

// 불변 프로퍼티는 인스턴스 생성 후 수정할 수 없습니다
// 컴파일 오류 발생
//mutable.immutableProperty = 200

// 불변 인스턴스
let immutable: Sample = Sample()

// 불변 인스턴스는 아무리 가변 프로퍼티라도
// 인스턴스 생성 후에 수정할 수 없습니다
// 컴파일 오류 발생
//immutable.mutableProperty = 200
//immutable.immutableProperty = 200


// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

// 인스턴스에서는 타입 프로퍼티나 타입 메서드를
// 사용할 수 없습니다
// 컴파일 오류 발생
//mutable.typeProperty = 400
//mutable.typeMethod()
```

  * 키워드도 `로 묶어주면 이름으로 사용할 수 있습니다
    + ```var `class`: String = "Swift"```


***
# 클래스
## 1. 클래스란?
- 클래스는 참조(reference) 타입(메모리 주소 값이 복사 됨)이다.
- 타입 이름은 대문자 카멜케이스를 사용하여 정의한다.
- Swift의 클래스는 다중 상속이 되지 않는다.
- **Heap Memory** 영역에 할당(속도가 느림)
    + Runtime에 직접 alloc하며 reference counting을 통해 dealloc이 필요하다.
    + Memory fragmentation(메모리 분열) 등의 **overhead가 존재**하다.
- Runtime에 타입 캐스팅을 통해서 클래스 인스턴스에 따라 여러 


## 2. 클래스 문법
- 정의: ```class``` 키워드 사용
- 프로퍼티 및 메서드 구현
``` Swift
class Sample {
    // 가변 프로퍼티
    var mutableProperty: Int = 100 

    // 불변 프로퍼티
    let immutableProperty: Int = 100 
    
    // 타입 프로퍼티
    static var typeProperty: Int = 100 
    
    // 인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }
    

    // 타입 메서드
    // 상속시 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    
    // 상속시 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
}
```

- 클래스 사용
``` Swift
// 인스턴스 생성 - 참조정보 수정 가능
var mutableReference: Sample = Sample()

mutableReference.mutableProperty = 200

// 불변 프로퍼티는 인스턴스 생성 후 수정할 수 없습니다
// 컴파일 오류 발생
//mutableReference.immutableProperty = 200


// 인스턴스 생성 - 참조정보 수정 불가
let immutableReference: Sample = Sample()

// 클래스의 인스턴스는 참조 타입이므로 let으로 선언되었더라도 인스턴스 프로퍼티의 값 변경이 가능합니다
immutableReference.mutableProperty = 200

// 다만 참조정보를 변경할 수는 없습니다
// 컴파일 오류 발생
//immutableReference = mutableReference

// 참조 타입이라도 불변 인스턴스는 
// 인스턴스 생성 후에 수정할 수 없습니다
// 컴파일 오류 발생
//immutableReference.immutableProperty = 200


// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

// 인스턴스에서는 타입 프로퍼티나 타입 메서드를
// 사용할 수 없습니다
// 컴파일 오류 발생
//mutableReference.typeProperty = 400
//mutableReference.typeMethod()
```

***
# 열거형
## 1. 열거형이란?
- 유사한 종류의 값들을 한 곳에 모아 정의한 것이다.(요일, 월, 계절 등)
- enum 자체가 하나의 데이터 타입으로, 타입의 이름은 대문자 카멜케이스를 써서 정의한다.
- 각 case의 이름들은 소문자 카멜케이스를 써서 정의한다.
- 각 case는 그 자체가 고유의 값이므로, C언어처럼 자동으로 정수 값이 할당되지 않는다.
- 각 case는 한 줄에 개별로 하거나 여러 개도 정의 할 수 있다.

``` Swift
enum InputMode {
  case insertMode
  case editMode
  case removeMode
}
```


## 2. 열거형 사용
- 주로 ```switch``` 구문에서 사용
``` Swift
enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

// 열거형 타입과 케이스를 모두 사용하여도 됩니다
var day: Weekday = Weekday.mon

// 타입이 명확하다면 .케이스 처럼 표현해도 무방합니다
day = .tue

print(day) // tue

// switch의 비교값에 열거형 타입이 위치할 때
// 모든 열거형 케이스를 포함한다면
// default를 작성할 필요가 없습니다
switch day {
case .mon, .tue, .wed, .thu:
    print("평일입니다")
case Weekday.fri:
    print("불금 파티!!")
case .sat, .sun:
    print("신나는 주말!!")
}
```

## 3. 원시값(rawValue)
- C언어의 enum처럼 정수 값을 가질 수 있다.
- rawValue는 case 별로 각각 다른 값이 할당되어야 한다.
- 자동으로 1이 증가된 값이 할당된다.
- rawValue는 필수 값은 아니다.

``` Swift
enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach  // 2
}
    
enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university // "university"
}
```

## 4. 원시값을 통한 초기화
- rawValue가 case에 해당하지 않을 수 있으므로, rawValue를 통해 초기화 한 인스턴스는 옵셔널 타입이다.
``` Swift
// rawValue를 통해 초기화 한 열거형 값은 옵셔널 타입이므로 Fruit 타입이 아닙니다
//let apple: Fruit = Fruit(rawValue: 0)
let apple: Fruit? = Fruit(rawValue: 0)

// if let 구문을 사용하면 rawValue에 해당하는 케이스를 곧바로 사용할 수 있습니다
if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange)입니다")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다")
} // rawValue 5에 해당하는 케이스가 없습니다
```

## 5. 열거형의 메서드
``` Swift
enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage() {
        switch self {
        case .mar, .apr, .may:
            print("따스한 봄~")
        case .jun, .jul, .aug:
            print("여름 더워요~")
        case .sep, .oct, .nov:
            print("가을은 독서의 계절!")
        case .dec, .jan, .feb:
            print("추운 겨울입니다")
        }
    }
}
```

***
# 클래스 vs 구조체/열거형
- 클래스는 **참조 타입**, 열거형과 구조체는 **값 타입**이라는 것이 가장 큰 차이다.
- 클래스는 **상속이 가능**하지만, 열거형과 구조체는 **상속이 불가능**하다.
- 상속이 필요하지 않고 모델의 사이즈가 크지 않다면 ```struct```를 사용한다.
- JSON와 1:1 매핑되는 간단한 모델이 필요하다면 ```struct```를 사용한다.
- 해당 모델을 serialize하여 전송하거나 파일로 저장할 일이 있다면 ```class```를 사용한다.
- 해당 모델이 ```Obj-C```에서도 사용되어야 한다면 ```class```를 사용한다.

## 1. 참조 타입과 값 타입의 비교
- 참조 타입(Reference Type): 데이터를 전달 할 때, 값의 메모리 위치를 전달한다.
- 값 타입(Value Type): 데이터를 전달 할 때, 값을 복사하여 전달한다.

``` Swift
struct ValueType {
    var property = 1
}

class ReferenceType {
    var property = 1
}

// 첫 번째 구조체 인스턴스
let firstStructInstance = ValueType()

// 두 번째 구조체 인스턴스에 첫 번째 인스턴스 값 복사
var secondStructInstance = firstStructInstance

// 두 번째 구조체 인스턴스 프로퍼티 값 수정
secondStructInstance.property = 2

// 두 번째 구조체 인스턴스는 첫 번째 구조체를 똑같이 복사한 
// 별도의 인스턴스이기 때문에 
// 두 번째 구조체 인스턴스의 프로퍼티 값을 변경해도
// 첫 번째 구조체 인스턴스의 프로퍼티 값에는 영향이 없음
print("first struct instance property : \(firstStructInstance.property)")    // 1
print("second struct instance property : \(secondStructInstance.property)")  // 2


// 클래스 인스턴스 생성 후 첫 번째 참조 생성
let firstClassReference = ReferenceType()
// 두 번째 참조 변수에 첫 번째 참조 할당
let secondClassReference = firstClassReference
secondClassReference.property = 2

// 두 번째 클래스 참조는 첫 번째 클래스 인스턴스를 참조하기 때문에
// 두 번째 참조를 통해 인스턴스의 프로퍼티 값을 변경하면
// 첫 번째 클래스 인스턴스의 프로퍼티 값을 변경하게 됨
print("first class reference property : \(firstClassReference.property)")    // 2
print("second class reference property : \(secondClassReference.property)")  // 2
```

## 2. 값 타입을 사용하는 이유
1. 비슷한 또는 연관된 값들을 하나로 모아 하나의 **데이터 타입**으로 만들고 싶을 경우
2. 상속 할 필요나 상속 받을 필요가 없을 경우
3. 다른 함수나 객체에 전달 할 때, 참조 말고 복사가 필요 할 경우

## 3. Swift에서는 뭘더 사용할까?
1. Swift의 기본 데이터 타입은 모두 구조체로 되어있다.
2. Swift는 구조체와 열거형을 선호한다.
3. Apple Framework는 대부분 클래스를 사용한다.
4. 어찌됐든~ 클래스, 또는 열거형 & 구조체 사용은 개발자 마음 ^*^

## 4. Apple 예제
### 1) Struct ```var```
``` Swift
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeItems.firstValue = 6
rangeOfThreeItems.length = 10 //error!, 상수이기 때문에 에러 발생!!!
```

### 2) Struct ```let```
``` Swift
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

let rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeItems.firstValue = 6 // error!, rangeOfThreeItems가 let으로 선언됐기에 
                                 // 모든 프로퍼티가 let으로 선언된 것 같이 된다.
rangeOfThreeItems.length = 10 // error!
```

### 3) Class ```var```
``` Swift
class FixedLengthRange {
    var firstValue: Int
    let length: Int

    init(firstValue : Int, length:Int) {
        self.firstValue = firstValue
        self.length = length
    }
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeItems.firstValue = 3
rangeOfThreeItems.length = 10// error!, 원본에 접근하더라도 상수로 선언되어 있기 때문에 에러 발생
```

### 4) Class ```let```
``` Swift
class FixedLengthRange {
    var firstValue: Int
    let length: Int

    init(firstValue : Int, length:Int) {
        self.firstValue = firstValue
        self.length = length
    }
}

let rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeItems.firstValue = 3 // 클래스는 Reference 타입이기 때문에 원본에 바로 접근한다.
                                 // 따라서 원본의 firstValue는 var 형식이기 때문에 값의 변경이 가능하다.
rangeOfThreeItems.length = 10 // error!
```

***
###### 참조&강의내용: [커넥트재단](https://www.edwith.org/boostcamp_ios/), [저장 프로퍼티 블로그](https://zeddios.tistory.com/243)
***
