# 2020년 05월 06일

## Cocoa Touch Framework란?

### [ 코코아 터치 프레임워크 ]

- iOS 애플리케이션 개발 환경 토대인 코코아 터치 프레임 워크는 애플리케이션의 **다양한 기능 구현에 필요한 여러 프레임워크를 포함** 하는 **최상위 레벨의 프레임워크** 다.
- 코코아 프레임 워크는 macOS 애플리케이션 제작에 사용하는 프레임 워크이다.
  - '코코아'라는 단어는 **Objective-C 런타임을 기반**으로 하고, NSObject를 상속 받는 모든 클래스 또는 객체를 가리킬 때 사용한다.
  - '코코아' 또는 '코코아 터치'는 iOS 또는 macOS의 전반적인 기능을 활용해 애플리케이션을 제작할 때 사용하는 프레임 워크
  - '코코아 터치'는 핵심 프레임워크인 **UIKit**과 **Foundation**을 포함한다.

![Cocoa Touch](https://cphinf.pstatic.net/mooc/20171228_88/1514432728403yHa58_PNG/111_0.png)

***

## UIKit Framework

### UIKit 소개

UIKit은 iOS 애플리케이션의 **사용자 인터페이스를 구현하고 이벤트를 관리**하는 프레임워크

- UIKit Framework는 **제스처 처리, 애니메이션, 그림 그리기, 이미지 처리, 텍스트 처리 등** 사용자 이벤트 처리를 위한 클래스를 포함한다.

- 또한 **테이블뷰, 슬라이더, 버튼, 텍스트 필드, 얼럿 창 등** 애플리케이션의 화면을 구성하는 요소를 포함한다.
- UIKit 클래스 중 **UIResponder에서 파생된 클래스**나 사용자 인터페이스에 관련된 클래스는 애플리케이션의 **메인 스레드**(혹은 **메인 디스패치 큐**)에서만 사용해야 한다.
- UIKit은 iOS와 tvOS 플랫폼에서 사용한다.

### UIKit 기능 별 요소

#### [ 사용자 인터페이스 ]

- View and Control: 화면에 콘텐츠 표시
- View Controller: 사용자 인터페이스 관리
- Animation and Haptics: 애니메이션과 햅틱을 통한 피드백 제공
- Window and Screen: 뷰 계층을 위한 윈도우 제공

#### [ 사용자 액션 ]

- Touch, Press, Gesture: 제스처 인식기를 통한 이벤트 처리 로직
- Drag and Drop: 화면 위에서 드래그 앤 드롭 기능
- Peek and Pop: 3D 터치에 대응한 미리 보기 기능
- Keyboard and Menu: 키보드 입력을 처리 및 사용자 정의 메뉴 표시

***

## Foundation Framework

Foundation은 iOS 애플리케이션의 **운영체제 서비스와 기본 기능**을 포함하는 Framework이다.

### Foundation 소개

Foundation은 **원시 데이터 타입(String, Int, Double)**, **컬렉션(Set, Array, Dictionary)** 및 **운영체제 서비스**를 사용해 **애플리케이션의 기본적인 기능을 관리**하는 framework이다.

- Foundation Framework는 **데이터 타입, 날짜 및 시간 계산, 필터 및 정렬, 네트워킹 등의 기본 기능을 제공**한다.
- Foundation Framework에서 **정의한 클래스, 프로토콜 및 데이터 타입**은 iOS 뿐만 아니라 macOS, watchOS, tvOS 등 **모든 애플 SDK에서 사용**된다.

*Foundation에서 제공하는 데이터 타입 및 컬렉션 타입의 대부분은 Objective-C 언어의 기능에서 지원하지 않는 것이기 때문에 언어기능을 보완하기 위한 구현이며, Swift에서는 이에 해당하는 데이터 타입과 기능 대부분을 [Swift 표준 라이브러리](https://developer.apple.com/documentation/swift)에서 제공합니다.*

### Foundation 기능 별 요소

#### [ 기본 ]

- Number, Data, String: 원시 데이터 타입 사용
- Collection: Array, Dictionary, Set 등과 같은 컬렉션 타입 사용
- Date and Time: 날짜와 시간을 계산하거나 비교하는 작업
- Unit and Measurement: 물리적 차원을 숫자로 표현 및 관련 단위 간 변환 기능
- Data Formatting: 숫자, 날짜, 측정 값 등을 문자열로 변환 또는 반대 작업
- Filter and Sorting: 컬렉션 요소를 검사하거나 정렬하는 작업

#### [ 애플리케이션 지원 ]

- Resources: 애플리케이션의 에셋과 번들 데이터에 접근 지원
- Notification: 정보를 퍼뜨리거나 받아들이는 기능 지원
- App Extension: 확장 애플리케이션과의 상호작용 지원
- Error and Exceptions: API와의 상호작용에서 발생할 수 있는 문제 상황에 대처할 수 있는 기능

#### [ 파일 및 데이터 관리 ]

- File System: 파일 또는 폴더를 생성하고 읽고 쓰는 기능 관리
- Archives and Serialization: 속성 목록, JSON, 바이너리 파일들을 객체로 변환 또는 반대 작업 관리
- iCould: 사용자의 iCould 계정을 이용해 데이터를 동기화 하는 작업 관리

#### [ 네트워킹 ]

- URL Loading System: 표준 인터넷 프로토콜을 통해 URL과 상호작용하고 서버와 통신하는 작업
- Bonjour: 로컬 네트워크를 위한 작업

***

[애플 공식 문서 - Cocoa (Touch)](https://developer.apple.com/library/content/documentation/General/Conceptual/DevPedia-CocoaCore/Cocoa.html)

[애플 공식 문서 - UIKit](https://developer.apple.com/documentation/uikit)

[출처 - 부스트코스](https://www.edwith.org/boostcourse-ios/lecture/17994/)

