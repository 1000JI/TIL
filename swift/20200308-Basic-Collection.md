
## 용어
  - **Any**: Swift의 모든 타입을 지칭하는 키워드
  - **AnyObject**: 모든 클래스 타입을 지칭하는 프로토콜
    > AnyObject는 클래스의 인스턴스만 수용 가능하기 때문에 클래스의 인스턴스가 아니면 할당할 수 없습니다.
  - **nil**: '없음'을 의미하는 키워드 ```== NULL```
  
***
## 컬렉션 타입
  - **Array**: 순서가 있는 리스트 컬렉션
  ```Swift
  // Array 선언 및 생성
  var integers: Array<Int> = Array<Int>()

  // 위와 동일한 표현
  // var integers: Array<Int> = [Int]()
  // var integers: Array<Int> = []
  // var integers: [Int] = Array<Int>()
  // var integers: [Int] = [Int]()
  // var integers: [Int] = []
  // var integers = [Int]()
  ```
  
  - **Dictionary**: '키'와 '값'의 쌍으로 이루어진 컬렉션
  ``` Swift
  // Key가 String 타입이고 Value가 Any인 빈 Dictionary 생성
  var anyDictionary: Dictionary<String, Any> = [String: Any]()

  // 위와 동일한 표현
  // var anyDictionary: Dictionary <String, Any> = Dictionary<String, Any>()
  // var anyDictionary: Dictionary <String, Any> = [:]
  // var anyDictionary: [String: Any] = Dictionary<String, Any>()
  // var anyDictionary: [String: Any] = [String: Any]()
  // var anyDictionary: [String: Any] = [:]
  // var anyDictionary = [String: Any]()
  ```
  
    > 키에 해당하는 값 제거 할 때 유사한 표현   
    > anyDictionary.removeValue(forKey: "anotherKey")
    > anyDictionary["someKey"] = nil
    
  
  - **Set**: 순서가 없고, 멤버가 유일한 컬렉션
  ``` Swift
  // Set 생성 및 선언
  var integerSet: Set<Int> = Set<Int>()

  // 합집합
  let union: Set<Int> = setA.union(setB)

  // 합집합 오름차순 정렬
  let sortedUnion: [Int] = union.sorted()

  // 교집합
  let intersection: Set<Int> = setA.intersection(setB)

  // 차집합
  let subtracting: Set<Int> = setA.subtracting(setB)
  ```
    > 동일한 값은 여러번 insert해도 한번만 저장됩니다.**(중복 X)**
    
  #### 문제) 어떤 컬력센 타입이 어울릴까요?
    1. 영어 알파벳 소문자를 모아두는 컬렉션
      > 겹치는 부분도 없기 때문에, Set 컬렉션이 괜찮아보임.
    2. 책의 제목과 저자 정리를 위한 컬렉션
      > 책의 제목(Key), 저자(Value)하여 Dictionary가 맞음.
    3. Boostcamp iOS 수강생 명부 작성을 위한 컬렉션
      > Set이랑 헷갈렸지만 수강생 중 이름이 겹치는 인원이 있을 수 있어 Array가 좋아보임.
  
***
###### 참조&강의내용: [커넥트재단](https://www.edwith.org/boostcamp_ios/)
***
