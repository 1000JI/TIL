
# 프로퍼티(Property)
## 1. 프로퍼티란?
- 클래스(Class)나 구조체(Struct) 혹은 열거체(enum 타입)의 객체 인스턴스가 가지고 있는 객체의 상태에 관한 정보

## 2. 프로퍼티 종류
- 인스턴스 저장 프로퍼티
- 인스턴스 연산 프로퍼티
- 타입 저장 프로퍼티
- 타입 연산 프로퍼티
- Lazy 저장 프로퍼티 ~~(추후 다시 공부)~~

## 3. 프로퍼티 정의 및 사용
- **클래스**, **구조체**, **열거형** 내부에 구현 할 수 있다.
- 연산 프로퍼티
  * **열거형**에는 연산 프로퍼티만 구현 할 수 있다.
  * ```var```로만 선언 할 수 있다.
  * 읽기 전용으로 구현 할 순 있지만, 쓰기 전용으로는 구현 할 수 없다.
- 읽기 전용으로 구현하려면 ```get 블럭```만 작성하면 된다.
  * 읽기 전용은 ```get 블럭```을 생략 할 수 있다.
- 읽기, 쓰기 전용으로 구현하고자 한다면 ```get 블럭```과 ```set 블럭```을 모두 구현 해야 한다.
- ```set 블럭```에서 암시적 매개 변수 ```newValue```를 사용 할 수 있다.

## 4. 프로퍼티 코드
``` Swift
struct Apwisdom {
  // 타입 저장 프로퍼티
  static var title: String = "에이피위즈덤"
  
  // 읽기전용 타입 연산 프로퍼티(get 생략)
  static var viewTitle: String {
    return "\(title)입니다."
  }
  
  // 인스턴스 저장 프로퍼티
  var age: Int = 29
  
  // 인스턴스 연산 프로퍼티
  var ageCalc: Int {
    get {
      return age
    }
    
    set {
      return age + newValue
    }
    
    /*
    set(setValue) {
      return age + setValue
    }
    */
  }
}
```
  
## 5. 프로퍼티 예제 & 응용
``` Swift
struct Point {
  var x = 0.0, y = 0.0 // 인스턴스 저장 프로퍼티 생성
}

struct Size {
  var width = 0.0, height = 0.0 // 인스턴스 저장 프로퍼티 생성
}

struct Rect {
  var origin = Point() // 좌표 인스턴스 생성
  var size = Size() // 사이즈 인스턴스 생성

  var center: Point { // 인스턴스 연산 프로퍼티 생성
    get {
      let centerX = origin.x + (size.width / 2)
      let centerY = origin.y + (size.height / 2)
      return Point(x: centerX, y: centerY)
    }
    
    set(newCenter) {
      origin.x = newCenter.x - (size.width / 2)
      origin.y = newCenter.y - (size.height / 2)
    }
  }
}

// Rect 인스턴스 생성 및 초기 값 설정
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center // get 블럭 실행
print(initialSquareCenter)//(x: 5.0,y: 5.0)

square.center = Point(x: 15.0, y: 15.0) // set 블럭 실행
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
```

# 프로퍼티 감시자(Property Observer)
## 1. 프로퍼티 감시자란?
- **프로퍼티의 값이 변경 될 때** 원하는 동작을 구현 할 수 있다.
- 값이 변경 되기 전에는 ```willSet```, 값이 변경 된 후에는 ```didSet```이 호출 된다.
 > 둘 중 하나만 구현 해도 된다.   
 > 변경 되려는 값이 기존 값과 같더라도 프로퍼티 감시자는 항상 동작 한다.
- ```willSet```에서는 암시적 매개변수 **newValue**를, ```didSet```에서는 **oldValue** 사용한다.
- 프로퍼티 감시자는 **연산 프로퍼티**에 사용 할 수 없다.
* 프로퍼티 감시자는 함수, 메서드, 클로저, 타입 등의 지역/전역 변수에 모두 사용 가능하다.

## 2. 프로퍼티 사용
``` Swift
struct Money {
    // 프로퍼티 감시자 사용
    var currencyRate: Double = 1100 {
        willSet(newRate) {
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다")
        }
        
        didSet(oldRate) {
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다")
        }
    }

    // 프로퍼티 감시자 사용
    var dollar: Double = 0 {
        // willSet의 암시적 매개변수 이름 newValue
        willSet {
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다")
        }
        
        // didSet의 암시적 매개변수 이름 oldValue
        didSet {
            print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다")
        }
    }

    // 연산 프로퍼티
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
        
        /* 프로퍼티 감시자와 연산 프로퍼티 기능을 동시에 사용할 수 없습니다
        willSet {
            
        }
         */
    }    
}

var moneyInMyPocket: Money = Money()

// 환율이 1100.0에서 1150.0으로 변경될 예정입니다
moneyInMyPocket.currencyRate = 1150
// 환율이 1100.0에서 1150.0으로 변경되었습니다

// 0.0달러에서 10.0달러로 변경될 예정입니다
moneyInMyPocket.dollar = 10
// 0.0달러에서 10.0달러로 변경되었습니다

print(moneyInMyPocket.won)
// 11500.0
```



***
###### 참조&강의내용: [커넥트재단](https://www.edwith.org/boostcamp_ios/), [저장 프로퍼티 블로그](https://zeddios.tistory.com/243)
***
