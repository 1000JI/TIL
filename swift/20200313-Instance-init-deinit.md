
# 인스턴스 생성(init, 이니셜라이저)과 소멸(deinit, 디이니셜라이저)

## 1. 프로퍼티 초기 값
- Swift의 **모든 인스턴스**는 초기화와 **모든 프로퍼티**에 유효한 값이 할당되어 있어야 한다.
- 프로퍼티에 미리 기본 값을 할당해두면 인스턴스가 생성되면서 초기 값이 설정된다.

``` Swift
class TestProperty {
    // 모든 저장 프로퍼티에 기본값 할당
    var name: String = "nothing"
    var age: Int = 0
    var nickName: String = "nothing"
}

// 인스턴스 생성
let jiwoon: TestProperty = TestProperty()

// 기본값이 인스턴스가 지녀야 할 값과 맞지 않다면
// 생성된 인스턴스의 프로퍼티에 각각 값 할당
jason.name = "jiwoon"
jason.age = 29
jason.nickName = "jude"
```

## 2. 이니셜라이저(initializer)
- 이니셜라이저(**init**)를 통해 인스턴스의 초기 값을 전달 할 수 있다.
``` Swift
class TestProperty {
    var name: String
    var age: Int
    var nickName: String
    
    // 이니셜라이저
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let jiwoon: TestProperty = TestProperty(name: "jiwooni", age: 29, nickName: "jude")
```

- 초기 값이 필수가 아닐 때는 옵셔널(?)을 사용하거나 ```convenience``` 키워드 사용
    * ```convenience```는 **보조이니셜라이저** 역할이다.
      > 같은 클래스에서 다른 이니셜라이저를 호출 해야한다.   
      > 지정 생성자를 뿌리로 해서 재사용에서 용이한 이점을 살리기 위해 사용한다.
    * ```convenience``` => 편의 생성자
        1. 편의 생성자는 먼저 지정 생성자 호출 후 나머지 프로퍼티를 초기화 한다.
        2. 자신의 클래스 내의 생성자를 다시 부르는 것이 가능하다(**생성자의 재사용**).
        3. 지정 생성자 호출 후 파라미터 초기화한다.
    
``` Swift
class TestProperty {
    var name: String
    var age: Int
    var nickName: String?

    // 이니셜라이저
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
    
    // 위와 동일한 기능 수행
//    convenience init(name: String, age: Int, nickName: String?) {
//        init(name: name, age: age)
//        self.nickName = nickName
//    }
    
    // 이니셜라이저
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let sojung: TestProperty = TestProperty(name: "sojung", age: 26, nickName: "stacy")
let jiwoon: TestProperty = TestProperty(name: "jiwoon", age: 29)
```

****** 추가 예시
``` Swift
class TestProperty {
    var name: String
    var age: Int
    var gender: String
    
    init(name: String, age: Int, gender: String) {
        self.name = name
        self.age = age
        self.gender = gender
    }
    
    convenience init(age: Int, gender: String) {
        self.init(name: "jiwoon", age: age, gender: gender)
    }
}
```

## 3. 실패 가능한 이니셜라이저(Failable initializer)
- 매개변수로 전달되는 **초기 값**이 잘못된 경우 ```nil```이 ```return``` 될 수 있다.
- 따라서, 반환타입은 **옵셔널(Optional) 타입**이다.
- ```init?```을 사용한다.
``` Swift
class TestProperty {
    var name: String
    var age: Int
    var gender: String?
    
    init?(name: String, age: Int) {
        if name.characters.count == 0 {
            return nil
        }
        
        if age < 20 {
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

//let pTest1: TestProperty = TestProperty(name: "jiwoon", age: 23) // error, 옵셔널으로 선언
let pTest1: TestProperty? = TestProperty(name: "jiwoon", age: 23)
let pTest2: TestProperty? = TestProperty(name: "gildong", age: 18)
let pTest3: TestProperty? = TestProperty(name: "", age: 27)

print(pTest2)   // nil
```

## 4. 디이니셜라이저(deinitializer)
- **deinit**는 클래스의 인스턴스가 **메모리에서 해제 되는 시점**에 호출되며, 해당 부분을 구현한다.
- 인스턴스가 **메모리에서 해제되는 시점**은 [ARC(Automatic Reference Counting)](https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html)의 규칙에 따라 결정된다.
- **deinit**는 매개변수를 지닐 수 없고, 자동 호출 되므로 직접 호출 하지 않는다.
- **deinit**는 **클래스 타입**에만 구현 할 수 있다.

> ###### 추후 다시 공부 필요!!!!


***
###### 참조&강의내용: [커넥트재단](https://www.edwith.org/boostcamp_ios/), [ZeddiOS](https://zeddios.tistory.com/141)
###### [애플 공식문서 - 생성](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)
###### [애플 공식문서 - 소멸](https://docs.swift.org/swift-book/LanguageGuide/Deinitialization.html)
***


