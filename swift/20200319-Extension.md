
# 익스텐션(Extension)
## 1. 익스텐션이란?
- **익스텐션(Extension)** 은 스위프트의 **강력한 기능 중 하나** 이다.
- **구조체** , **클래스** , **열거형** , **프로토콜** 타입에 새로운 기능을 추가 할 수 있는 기능이다.
- 기능을 추가하려는 타입의 구현된 소스 코드를 알지 못하거나 볼 수 없어도, **타입**만 알고 있어도 해당 타입의 기능을 확장 할 수 있다.

### <익스텐션(Extension)>
1. 연산 타입 프로퍼티 / 연산 인스턴스 프로퍼티
2. 타입 메서드 / 인스턴스 메서드
3. 이니셜라이저
4. 서브스크립트
5. 중첩 타입
6. 특정 프로토콜 준수 할 수 있도록 기능 추가
> 기존에 존재하는 기능을 **재정의 할 수 없다.**

### <클래스의 상속과 익스텐션 비교>
|             | 상속          | 익스텐션                                    |
| :---------: | :-----------: | :-----------------------------------------: |
| **확장**    | 수직 확장      | 수평 확장                                   |
| **사용**    | 클래스 타입	  | 클래스, 구조체, 프로토콜, 제네릭 등 모든 타입 |
| **재정의**  | 가능          | 불가능                                      |
> 익스텐션으로 **연산 프로퍼티**, **메서드**, **이니셜라이저**, **서브스크립트**, **중첩 데이터 타입** 등 추가 가능하다.   
> **프로토콜** 과 사용하면 굉장히 강력한 기능을 보여준다.


## 2. 정의
- **extension** 키워드 사용하여 정의한다.
``` Swift
// 다른 프로토콜을 채택하면서 확장할 수 있음
extension 확장할 타입 이름: 프로토콜1, 프로토콜2, 프로토콜3... {
    /* 프로토콜 요구사항 구현 */
}
```
- Swift 표준 라이브러리 타입의 기능은 대부분 익스텐션으로 구현되어 있다.


## 3. 구현
### <연산 프로퍼티 추가>
- 익스텐션으로 Int 타입에 추가해준 연산 프로퍼티는 Int 타입의 어떤 인스턴스에도 사용 가능하다.
- ```static``` 키워드를 사용하여 타입 연산 프로퍼티도 추가 할 수 있다.
``` Swift
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isEven) // false
print(2.isEven) // true
print(1.isOdd)  // true
print(2.isOdd)  // false

var number: Int = 3
print(number.isEven) // false
print(number.isOdd) // true

number = 2
print(number.isEven) // true
print(number.isOdd) // false
```

### <메서드 추가>
- 여러 기능을 여러 익스텐션 블록으로 나눠서 구현 가능하다.
- 하지만, 관련된 기능 별로 익스텐션 블록에 묶어주는 것이 좋다.
``` Swift
extension Int {
    func multiply(by n: Int) -> Int {
        return self * n
    }
}
print(3.multiply(by: 2))  // 6
print(4.multiply(by: 5))  // 20

number = 3
print(number.multiply(by: 2))   // 6
print(number.multiply(by: 3))   // 9
```

### <이니셜라이저 추가>
-  익스텐션을 통해 **이니셜라이저** 를 추가 할 수 있다.
    > 인스턴스 초기화에 필요한 다양한 데이터를 전달 받을 수 있도록 **여러 종류의 이니셜라이저** 를 만들 수 있다.
- 클래스 타입에 **편의 이니셜라이저** 는 추가 할 수 있지만, **지정 이니셜라이저** 는 추가 할 수 없다.
- **지정 이니셜라이저** 와 **디이니셜라이저** 는 반드시 클래스 타입의 구현부에 위치해야 한다.
``` Swift
extension String {
    init(int: Int) {
        self = "\(int)"
    }
    
    init(double: Double) {
        self = "\(double)"
    }
}

let stringFromInt: String = String(int: 100) 
// "100"

let stringFromDouble: String = String(double: 100.0)    
// "100.0"
```

***
###### 참조&강의내용: [커넥트재단](https://www.edwith.org/boostcamp_ios/)
###### [애플 공식문서 - Extension](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)
***
