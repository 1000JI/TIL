# 2020년 05월 08일(금)

## Model-View-Controller

- **MVC(Model-View-Controller)** 디자인 패턴은 애플리케이션의 객체를 모델, 뷰, 컨트롤러의 세 가지 역할 중 하나의 역할로 할당한다.
- 이 패턴은 애플리케이션 내에서 **객체가 수행하는 역할 뿐만 아니라 객체가 서로 통신하는 방식을 정의**한다.
- **세 가지 유형의 객체**는 **각각 추상적인 경계에 의해 다른 객체와 구분**되며, 그 경계를 넘어 **다른 유형의 객체와 통신**한다. 애플리케이션 내의 특정 MVC 유형을 한데 모아 **레이어**라고도 한다.

![MVC](https://cphinf.pstatic.net/mooc/20180102_176/1514820609255BQ1m8_PNG/67_0.png)

***

## 모델 객체(Model Objects)

- 애플리케이션과 관련된 데이터를 캡슐화하고, 해당 데이터를 조작하고 처리하는 로직과 계산을 정의한다.
- 하나의 모델 객체는 다른 모델 객체와 1:1 또는 1:N의 관계를 맺을 수 있다.
- 모델 객체는 데이터를 사용자에게 제공하거나 사용자가 이를 편집할 수 있는 뷰 객체에 명시적으로 연결되어서는 안된다(즉, 사용자 인터페이스나 표시 문제와 관련이 있어서는 안됨).

### 모델 서브클래스를 구현할 때, 클래스 디자인에서 고려할 사항

- 인스턴스 변수
  - 캡슐화 된 데이터를 유지하기 위한 인스턴스 변수를 선언하며 객체형을 사용하는 데에는 장단점이 있으므로, 객체 상호 관계(object mutuality)를 고려해야 한다.
- 접근자 메서드(Accessor methods)와 프로퍼티
  - 일반적으로 인스턴스 변숫값을 획득 및 설정하며, 흔히 획득자 및 설정자 메서드(getter and setter methods)라고도 알려져 있다.
- 키-값(Key-Value) 코딩
  - 클라이언트가 프로퍼티 이름을 키로 사용하여 객체의 프로퍼티에 접근할 수 있게 하는 메커니즘이다.
  - Core Data에서 사용하고 있으며 Cocoa의 다른 곳에서도 사용하고 있다.
- 초기화 및 할당 해제(Initialization and deallocation)
  - 대부분 모델 클래스는 인스턴스 변수를 적절한 초깃값으로 설정하는 이니셜라이저 메서드를 구현한다.
  - deinit 메서드에서 객체 값을 가지는 모든 인스턴스 변수를 해제해야하 한다.
- 객체 인코딩
  - 모델 클래스의 객체를 보관하려는 경우, 해당 객체의 인스턴스 변수를 인코딩 및 디코딩할 수 있어야 한다.
- 객체 복제
  - 클라이언트가 모델 객체를 복제할 것으로 예상하는 겨우, 클래스에서 객체 복제를 구현해야 한다.

***

## 뷰 객체(View objects)

- 뷰 객체는 애플리케이션 내에서 사용자가 볼 수 있는 객체를 말한다. 사용자 동작에 응답할 수 있으며, 주된 목적은 애플리케이션의 모델 객체의 데이터를 보여주고 해당 데이터를 편집할 수 있도록 하는 것 이다.

***

## 컨트롤러 객체(Controller Objects)

- 하나 이상의 애플리케이션 뷰 객체와 하나 이상의 모델 객체 사이의 코디네이터 또는 중개자 역할을 한다.
- 뷰 객체에서 이루어진 사용자 동작 및 의도를 해석하며, 신규 혹은 변경된 데이터를 모델 객체에 전달한다. 따라서 컨트롤러 객체는 뷰 객체로 하여금 모델 객체의 변경사항을 인지하거나, 그 반대의 경우가 가능하도록 하는 매개체가 된다.
- 다른 객체들의 생애주기(Life Cycle)를 관리하기도 한다.
- iOS 환경의 **Cocoa Touch 프레임워크는 코디네이팅 컨트롤러, 뷰 컨트롤러의 두 가지 기본 컨트롤러 유형을 제공**한다.

**[ 코디네이팅 컨트롤러(Coordinating Controllers) ]**

- 델리게이션(delegation) 메시지에 응답하고 알림(notifications)을 관리
- 사용자가 버튼과 같은 컨트롤을 탭 하거나 클릭함에 따라 전송되는 동작 메시지(action message)에 응답
- 객체 간의 연결을 확립하거나 기타 설정 작업을 수행. (예: 애플리케이션을 시작하는 경우)
- 소유한(owned) 객체의 생명 주기 관리.

**[ 뷰 컨트롤러(View Controller) ]**

- 콘텐츠를 화면에 표시하는 뷰를 관리하며, 해당 뷰에 대한 참조(reference)를 유지하고, 뷰 컨트롤러는 이 뷰의 프레젠테이션(presentation) 및 후속 뷰로의 전환(transition)을 관리

***

[애플 공식 문서 - Model-View-Controller](https://developer.apple.com/library/content/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html)

[출처 - 부스트코스](https://www.edwith.org/boostcourse-ios/lecture/16877/)

[Music Player에서의 MVC 패턴](https://www.edwith.org/boostcourse-ios/lecture/16878/)











