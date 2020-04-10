
###### 최초 작성일: 2020. 03. 06.

## 사전 숙지사항
- [Apple Swift Programming Language Guide](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Swift 가이드 문서 변경 내역](https://docs.swift.org/swift-book/RevisionHistory/RevisionHistory.html)
- [Swift API 가이드라인](https://swift.org/documentation/api-design-guidelines/)
    * [번역링크](https://github.com/connect-boostcamp/SwiftAPIDesignGuidelines/blob/master/README.md)

***
# 기초
   * 사용하는 시점에서의 **명확함** 이 가장 중요하다.
   * 명확함이 **간결함** 보다 중요하다.
   * 모든 선언에 **주석** 을 단다(가능한).
      - [스위프트 마크다운](https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_markup_formatting_ref/) 표현을 사용하라.
      - ***추후 다시 공부해보는 걸로(2020. 03. 06)***
   * 선언된 개체를 설명할 때 **요약(Summary)** 과 함께 시작한다.
   ``` Swift
   /// Returns a "view" of `self` containing the same 	elements in
   /// reverse order.
   func reversed() -> ReverseCollection
   ```
   * 함수 또는 메소드가 **무엇을 하는지 무엇을 반환**하는지 설명한다.
   * [명령문 블릿을 알고 사용하자](https://github.com/connect-boostcamp/SwiftAPIDesignGuidelines/blob/master/README.md#%EC%9D%B4%EB%A6%84%EC%A7%93%EA%B8%B0)
      > 링크에서 바로 위(참고 필요)
   
***
# 이름 짓기(Naming)
   * 코드의 이름을 사람이 **모호하지 않도록** 구체적으로 단어 표현 하는 것이 좋다.
   * **불필요한 단어**는 쓰지 않는다.
   * 변수, 매개변수, 관련 타입의 이름을 지을 때 어떤 역할을 하는지에 의거하여 짓는다.
   * 인자의 역할을 명확하게 하기 위해 **약타입 정보**를 보완한다.
   ``` Swift
   func add(_ observer: NSObject, for keyPath: String)
   grid.add(self, for: graphics) // vague
   
   // ==============>>>
   
   func addObserver(_ observer: NSObject, forKeyPath path: String)
   grid.addObserver(self, forKeyPath: graphics) // clear
   ```
   
***
# 자연스러운 이름 짓기
   * 영어 문장을 만드는 방식으로 메소드와 함수이름을 만든다.
   ``` Swift
    // Not Preferred:
    x.insert(y, at: z)          “x, insert y at z”
    x.subViews(havingColor: y)  “x's subviews having color y”
    x.capitalizingNouns()       “x, capitalizing nouns”

    // Preferred:
    x.insert(y, position: z)
    x.subViews(color: y)
    x.nounCapitalize()
   ```
   
   * 팩토리 메소드 이름은 **"make"**로 시작한다. ```x.makeIterator()```
   * ***사이드 이펙트*** ????
   
***
# 용어 잘 사용하기
   * 알기 힘든 용어는 웬만하면 쓰지 않고, 쉬운 단어로 구성한다.
   * 전문 용어를 사용할 때는 **정해진 의미**를 지킨다.
   * 약어를 피하는게 좋다.
   
***
# 일반적인 약속
   * **대소문자 규칙**을 지킨다.
      - fuction, method, variable, constant => ```UpperCamelCase```
         > someVariableName
      - type(class, struct, enum, extension…) => ```lowerCamelCase```
         > Person, Point, Week
      ``` Swift
      var utf8Bytes: [UTF8.CodeUnit]  
      var isRepresentableAsASCII = true  
      var userSMTPServer: SecureSMTPServer
      ```
   * 구분된 영역에서 사용되는 메소드들은 이름을 공유 할 수 있다. ~~~오버로딩..?~~~
   ``` Swift
   extension Shape {
      /// Returns `true` iff `other` is within the area of `self`.
      func contains(_ other: Point) -> Bool { ... }

      /// Returns `true` iff `other` is entirely within the area of `self`.
      func contains(_ other: Shape) -> Bool { ... }

      /// Returns `true` iff `other` is within the area of `self`.
      func contains(_ other: LineSegment) -> Bool { ... }
   }
   ```
   
***
# 매개변수
   * **문서 역할을 할 수 있는 매개변수 이름**을 선택한다.
   ```Swift
   /// Return an `Array` containing the elements of `self`
   /// that satisfy `predicate`.
   func filter(_ predicate: (Element) -> Bool) -> [Generator.Element]

   /// Replace the given `subRange` of elements with `newElements`.
   mutating func replaceRange(_ subRange: Range, with newElements: [E])
   ```
   
   * 매개 변수의 초기값 설정은 API 사용을 단순화 한다.
      > 자주 사용되는 값이 매개변수 초기값으로 사용하는 방법
      
   * **매개변수 목록의 끝 부분에 초기 값이 있는 매개변수**를 쓰자
      > 초기 값이 없는 매개 변수들이 보통 핵심 기능 담당
      
***
# 전달인자 레이블
   * 인자 레이블이 특별한 의미를 가지지 않는다면 **생략**한다.
   
***
