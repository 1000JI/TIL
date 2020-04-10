
# 함수 고급(!?)

## 1. 매개변수 기본 값
  * 매개변수에 기본적으로 값을 미리 지정 할 수 있다.
  * 기본 값을 가지는 매개변수는 매개변수 목록 뒤쪽에 위치하는 것이 좋다(권고).
  
  ``` Swift
  func speaking(me: String, talk: String = "yaho!") {
    print(...)
  }
  ```
  
## 2. 전달인자 레이블(Argument Label)
  * 함수를 호출 할 때 매개변수의 역할을 좀 더 명확하게 표현하고자 사용한다.
  
  ``` Swift
  func speaking(from me: String, to talk: String = "yaho!") {
    print(...)
  }
  speaking(from: "jiwoon", to: "yaho!")
  ```

## 3. 가변 매개변수
  * 전달 받을 값의 갯수를 알기 어려울 때 사용한다.
  * 가변 매개변수는 함수당 1개만!!
  * 가변 매개변수 또한 매개변수 목록에서 뒤쪽에 배치하는게 좋다.
  
  ``` Swift
  func speaking(me: String, talk: String...) {
    print(...)
  }
  speaking(me: "jiwoon", talk: "yaho!", "good", "Yes!!")  // ["yaho!", "good", "Yes!!"]
  ```
  
## 4. 데이터 타입으로서의 함수★
  * Swift는 함수형 프로그래밍 패러다임을 포함하는 언어이므로, Swift의 함수는 일급객체이다.
  * **함수의 타입 표현**은 반환 타입을 생략 할 수 없다.
  
  ``` Swift
  var someFunction: (String, String) -> Void = greeting(to:from:)
  someFunction("jiyun", "jiwoon")

  someFunction = greeting(friend:me:)
  someFunction("jiyun", "jiwoon")


  // 타입이 다른 함수는 할당할 수 없습니다 - 컴파일 오류 발생
  //someFunction = sayHelloToFriends(me: friends:)


  func runAnother(function: (String, String) -> Void) {
    function("jiyun", "jiwoon")
  }

  runAnother(function: greeting(friend:me:))

  runAnother(function: someFunction)
  ```
   > 함수 내용만 복사되는건지 아니면 someFunction == greeting 아예 같아지는지?   
   > 언제 이걸 쓰는지...?
  

***
###### 참조&강의내용: [커넥트재단](https://www.edwith.org/boostcamp_ios/)
***
