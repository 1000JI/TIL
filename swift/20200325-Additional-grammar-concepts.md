
# 추가 문법 및 개념

1. 제네릭(Generics) - [애플 공식문서 - Generic](https://docs.swift.org/swift-book/LanguageGuide/Generics.html#//apple_ref/doc/uid/TP40014097-CH26-XID_283)
    - Swift의 가장 강력한 도구 중 하나다.
    - 유연하고 재사용성이 높은 코드를 작성 할 수 있다.
    - **Array(배열)** 과 **Dictionary(사전)** 은 **Generic 콜렉션** 이다.
    - 참고사이트: [Zedd - Generic](https://zeddios.tistory.com/226)
    
***
2. 서브스크립트(Subscript) - [애플 공식문서 - Subscript](https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html)
    - 컬렉션, 리스트, 시퀀스 타입의 **개별 요소에 접근할 수 있는 지름길**을 제공한다.
    - [참고 사이트 - Subscript](https://the-brain-of-sic2.tistory.com/37)
    - ```subscript``` 키워드를 사용하며, 연산 프로퍼티에서 사용했던 ```get```, ```set```을 사용한다.
    - **예제 코드**
    ``` Swift
    subscript(index: Int) -> Int {
        get {
            // return an appropriate subscript value here
        }
        set(newValue) {
            // perform a suitable setting action here
        }
    }
    ```
    
    - **실행 코드**
    ``` Swift
    struct GugudanTable {
        let multiNumber: Int
        subscript(index: Int) -> Int {
            return multiNumber * index  // get만 쓸 경우 get 키워드 생략 가능
        }
    }
    let testGugudan = GugudanTable(multiNumber: 5)  // 구구단 5단
    print(testGugudan[6])   // 5*6 => "30"
    
    // 또는~~~
    
    struct StudentList {
        private var list = ["Hong GilDong", "Cheon JiWoon"]
        subscript(student: Int) -> String {
            get {
                return self.list[student]
            }
            set {
                self.list[student] = newValue
            }
        }
    }
    ```
  
***
3. 접근수준(Access Control)
    - Swift는 5가지의 **Access Level** 을 제공한다.
        * ```open```, ```public```, ```internal```, ```fileprivate```, ```private```
        * 왼쪽으로 갈 수록 **Access Level** 이 높으며 제한이 가장 없다.
        * 반대로 오른쪽으로 갈 수록 **Access Level** 이 낮으며 제한이 강하다.
    - [참고 사이트](https://m.blog.naver.com/PostView.nhn?blogId=jdub7138&logNo=220934201798&proxyReferer=https%3A%2F%2Fwww.google.com%2F)
    - 주로 ```public```과 ```private```가 많이 쓰인다.
    - **5가지의 Access Level**
        1. **open** : 가장 열린 Access Level로, 외부의 다른 모듈이 import하여 접근 가능 하다. 외부 모듈 안에서 ```subclass```와 ```override```도 가능하기 때문에 위험하다. **OPEN API** 및 **Framework** 구성시 활용한다.
        2. **public** : *open* 과 마찬가지로 외부 모듈이 import하여 접근이 가능하지만 ```subclass```와 ```override```는 오직 자신의 모듈 안에서만 가능하다. public 또한 **OPEN API** 및 **Framework** 구성시 활용한다.
        3. **internal** : 자신의 모듈에서만 접근이 가능하고 외부 모듈에서는 접근이 불가하다. 모든 객체는 별도의 지정이 없다면 기본적으로 internal 로 지정된다. 다만, 애매한 부분이 있어 다른 Source File이나 Declaration 에서의 접근이 없다면 **private** 로 두는 것이 좋다.
        4. **fileprivate** : 같은 Source File 안에서만 접근이 가능하다. 예를 들어, 같은 프로젝트의 ```a.swift```에 fileprivate로 선언된 ```HelloWorld```라는 함수가 있다고 가정했을 때, ```b.swift```에서는 ```HelloWorld``` 함수에 접근이 불가하다.
        5. **private** : 가장 폐쇠적인 Access Level로, **같은 Declaration 공간({})에서만 접근이 가능** 하다. 즉, 함수 안에서 선언된 private 변수는 해당 함수 안에서, class 안에서 선언된 private 변수는 해당 class 안에서만 접근이 가능하다.
   
***
4. ARC(Automatic Reference Counting) - [애플 공식문서](https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html)
    - **참조 메모리 관리**를 자동으로 해주는 기능이다.
    - 인스턴스의 **참조 횟수**를 추적하여 더 이상 참조되지 않는 인스턴스를 메모리에서 해제한다.
    - **값 타입(struct, enum, literal 등)** 은 할당 될 때, 값을 복사해서 사용되기 때문에 할당된 값을 변경해도 본래의 값은 변경되지 않는다.
    - 하지만, **참조 타입(class, closer 등)** 은 할당 될 때, 본래의 값이 있는 메모리를 전달하여 참조할 수 있기에 값을 변경하면 본래의 값도 변경된다.
    > 따라서, 참조가 발생되면서 메모리를 차지하게 되는데 **효과적인 메모리 관리를 위해 ARC를 사용** 한다.   
    > **ARC**는 메모리에서 일찍 해제시켜 잘못된 메모리 접근 오류가 발생하거나 반대로 메모리에서 해제하지 않아 메모리를 낭비하는 문제를 관리 할 수 있다.
    
    - 그럼 어떻게 동작하는가?
        1. 인스턴스가 참조되거나 참도가 해제 될때의 횟수를 카운팅한다.
        2. 참조 횟수가 0이 되면 메모리에서 해제한다.
        3. ARC는 대략적인 참조 흐름을 예상하여 참조 횟수가 증가하고 감소하는 규칙들을 이해하고 있어야 한다.
    
    - Counting Up 또는 Counting Down은 어떨때 동작하는가?
        1. 변수, 상수, 프로퍼티에 참조 값이 **할당 될때 증가** 한다.
        2. 변수, 상수, 프로퍼티의 **생명 주기가 끝나는 시점에 감소** 하는데, ```nil``` 값을 할당하면 해제된다.
        3. 또한, 지역 변수 같은 경우 함수가 끝날 때 메모리에서 해제된다고 보면 된다.
        
    - Strong, Weak, Unowned: 참조 횟수 추적 옵션 설정 키워드
        + 강한 참조( **Strong** ) : 인스턴스 할당 시 기본 옵션이다.
        + 약한 참조( **Weak** ) : 인스턴스 할당 시 참조 횟수를 증가시키지 않으며, 반드시 **옵셔널** 타입이다.
            * 메모리에서 해제되면 자동으로 ```nil```을 할당한다.
        + 미소유 참조( **Unowned** ) : Weak와 같은 기능이지만, 옵셔널이 아니여도 된다.
            * 참조 횟수를 증가시키지 않지만, 인스턴스가 메모리에서 해제되기 전 참조가 해제 될 것임이 분명 할 때 weak 대신 사용 할 수 있다.
        
    - [참고사이트 - ARC](https://velog.io/@cskim/ARCAutomatic-Reference-Counting)
    
***
5. 중첩타입(Nested Types) - [애플 공식문서 - Nested Types](https://jusung.gitbook.io/the-swift-language-guide/language-guide/19-nested-types)
    - 열거형은 특정 구조체나 클래스의 기능을 처리하기 위해 자주 사용된다.
    - 이와 비슷하게 좀 더 복잡한 타입을 위해 유틸리티 클래스나 구조체를 정의할 수 있다(**중첩 타입을 지원**).
    - **열거형, 클래스, 구조체를 그 타입 안에서 다시 정의할 수 있다.**
    ###### 추후 다시 공부~!!!
    
***
6. 사용자정의 연산자(Custom Operators)
    - Swift는 사용자가 원하는 동작을 하는 연산자를 생성 할 수 있다. 연산자는 부호로 표현하는 함수라고 할 수 있다.
    - 연산자의 종류
        1. 전위 연산자: 연산자가 피연산자 앞에 위치하는 연산자 **prefix** 키워드 사용
        ``` Swift
        a = !a
        
        // 연산자를 구현하기 위해 미리 선언
        prefix operator **

        // 제곱을 수행하는 연산자를 정의
        prefix func ** (num: Int) -> Int{
            return num * num
        }
        print(**100)
        // 10000
        
        
        // 연산자를 재정의 하지 않고 기능만 추가하려면 연산자를 선언하지 않고 함수를 overload
        //논리 부정 연산자를 String에서도 사용 가능하도록 기능을 추가
        prefix func ! (str: String) -> Bool{
            return str.isEmpty()
        }
        // !을 통해 String의 값이 비었는지 확인 가능
        print(!"")
        // true
        ```
        
        2. 중위 연산자: 연산자가 두 피연산자 사이에 위치하는 연산자
            - 중위 연산자의 종류는 다양하다. 그래서 우선순위를 가지는데, 우선순위를 명시하지 않으면 ```DefalutPrecedence``` 그룹이 할당 된다.
        ``` Swift
        a + b
        a += b
        a - b
        
        infix operator <=
        // 연산자를 미리 선언

        // 서로의 문자의 수를 비교하는 연산자
        func <= (str1: String, str2: String) -> Bool{
            return str1.size <= str2.size
        }
        print( "hello" <= "nice" )
        // false
        ```
        
        3. 후휘 연산자: 연산자가 피연산자 뒤에 위치하는 연산자 **postfix** 키워드 사용
        ``` Swift
        a?
        a!
        
        postfix operator ++
        // 전위와 같이 연산자를 구현하기 위해 미리 선언

        // 값에 1을 더하는 연산자를 만든다
        postfix func ++ (num: Int) -> Int{
            return num + 1
        }
        print(1++)
        // 2
        
        // 하나의 피연산자에 전위, 후위 연산자가 한줄에 있다면 후위 연산자부터 실행
        print(**10++)
        // (11) * (11)
        // 121
        ```
    - 연산자 종류: ```/, =, -, +, _, %, <, >, &, |, ^, ?, ~```
    
***
7. 불명확 타입(Opaque Types) - [참고사이트 Opaque Types](https://wlaxhrl.tistory.com/82)
    - 불명확한(Opaque) 리턴 타입을 가지는 함수/메소드는 **자신의 리턴 타입에 대한 정보를 드러내지 않는다.**
    ###### 추후 다시 공부~!!!

***
8. 프로토콜 지향 프로그래밍(Protocol Oriented Programming, POP) - [참고사이트](https://blog.yagom.net/531/)
    - Swift의 표준 라이브러리에서 타입과 관련된 것을 살펴보면 대부분 구조체로 구현되어 있다. 그런데, 상속도 되지 않는 구조체로 어떻게 다양한 기능을 가질 수 있을까? 해답은 **프로토콜**과 **익스텐션**에 있다.
    - 프로토콜을 채택한 타입의 정의부에 프로토콜의 요구사항을 구현하지 않더라도 **프로토콜의 익스텐션에 미리 프로토콜의 요구사항을 구현** 해둘 수 있는데 이것을 바로 **프로토콜 초기구현**이라고 한다.
    - 프로토콜 지향 프로그래밍을 추구하는 이유?
        1. **구조체, 클래스, 열거형 등 구조화된 타입** 중에 *상속은 클래스 타입에서만 가능*하다.
            * 클래스는 참조 타입이므로 참조 추적에 비용이 많이 발생한다.
            * 상속을 할 수 없어 기능을 다시 구현해 주어야 했지만, 프로토콜 지향 프로그래밍은 그런 불편한 점들을 해소했다.
        2. 기등의 모듈화가 더욱 명확해진다.
            * **프로토콜 지향 프로그래밍은 기능을 프로토콜이라는 단위로 묶어 표현하고 초기 구현**을 해둘 수 있으니 상속이라는 한계점을 탈피 할 수 있다.

***
###### 참조&강의내용: [커넥트재단](https://www.edwith.org/boostcamp_ios/)
***
