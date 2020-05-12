# 2020년 05월 05일(화)

## 컨트롤 이벤트와 액션과의 관계

- UIKit에는 UIButton, UITextField, UISwtich 등 UIControl을 상속 받은 다양한 클래스가 존재한다. 그런 컨트롤 객체에 발생한 다양한 이벤트들을 액션 메서드에 연결하여 사용 할 수 있다.

***

## 컨트롤 이벤트의 종류

[ **touchDown** ]

- 컨트롤을 터치했을 때 발생하는 이벤트(UIControl.Event.touchDown)

[ **touchDownRepeat** ]

- 컨트롤을 연속 터치 할 때 발생하는 이벤트
  (UIControl.Event.touchDownRepeat)

 [ **touchDragInside** ]

- 컨트롤 범위 내에서 터치한 영역을 드래그 할 때 발생하는 이벤트
  (UIControl.Event.touchDragInside)

[ **touchDragOutside** ]

- 터치 영역이 컨트롤의 바깥쪽에서 드래그 할 때 발생하는 이벤트 (UIControl.Event.touchDragOutside)

[ **touchDragEnter** ]

- 터치 영역이 컨트롤의 일정 영역 바깥쪽으로 나갔다가 다시 들어왔을 때 발생하는 이벤트 (UIControl.Event.touchDragEnter)

[ **touchDragExit** ]

- 터치 영역이 컨트롤의 일정 영역 바깥쪽으로 나갔을 때 발생하는 이벤트 (UIControl.Event.touchDragExit)

[ **touchUpInside** ]

- 컨트롤 영역 안쪽에서 터치 후 뗐을때 발생하는 이벤트 (UIControl.Event.touchUpInside)

[ **touchUpOutside** ]

- 컨트롤 영역 안쪽에서 터치 후 컨트롤 밖에서 뗐을때 이벤트 (UIControl.Event.touchUpOutside)

[ **touchCancel** ]

- 터치를 취소하는 이벤트 (touchUp 이벤트가 발생되지 않음) (UIControl.Event.touchCancel)

[ **valueChanged** ]

- 터치를 드래그 및 다른 방법으로 조작하여 값이 변경되었을때 발생하는 이벤트 (UIControl.Event.valueChanged)

[ **primaryActionTriggered** ]

- 버튼이 눌릴때 발생하는 이벤트 (iOS보다는 tvOS에서 사용) (UIControl.Event.primaryActionTriggered)

[ **editingDidBegin** ]

- UITextField에서 편집이 시작될 때 호출되는 이벤트 (UIControl.Event.editingDidBegin)

[ **editingChanged** ]

- UITextField에서 값이 바뀔 때마다 호출되는 이벤트 (UIControl.Event.editingChanged)

[ **editingDidEnd** ]

- UITextField에서 외부객체와의 상호작용으로 인해 편집이 종료되었을 때 발생하는 이벤트
  UIControl.Event.editingDidEnd

[ **editingDidEndOnExit** ]

- UITextField의 편집상태에서 키보드의 return 키를 터치했을 때 발생하는 이벤트
UIControl.Event.editingDidEndOnExit

[ **allTouchEvents**]

- 모든 터치 이벤트 (UIControl.Event.allTouchEvents)

[ **allEditingEvents** ]

- UITextField에서 편집작업의 이벤트 (UIControl.Event.allEditingEvents)

[ **applicationReserved** ]

- 각각의 애플리케이션에서 프로그래머가 임의로 지정할 수 있는 이벤트 값의 범위 (UIControl.Event.applicationReserved)

[ **systemReserved** ]

- 프레임워크 내에서 사용하는 예약된 이벤트 값의 범위 (UIControl.Event.systemReserved)

[ **allEvents** ]

- 시스템 이벤트를 포함한 모든 이벤트 (UIControl.Event.allEvents)

***

## Target-Action Design Pattern

- Target-Action 디자인 패턴은 iOS 환경에서 많이 사용하는 디자인 패턴 중 하나이다.
- 객체는 이벤트가 발생할 때 다른 객체에 메시지를 보내는 데 필요한 정보를 포함한다.
- 액션은 특정 이벤트가 발생했을 때 호출할 메서드를 의미한다. 그리고 타켓은 액션이 호출될 객체를 의미한다.
- 이벤트 발생 시 전송된 메시지를 액션 메시지라고 하고, 타겟은 프레임워크 객체를 포함한 모든 객체가 될 수 있으나, 보통 컨트롤러가 되는 경우가 일반적이다.

### 액션 메서드

``` swift
// 프로그래밍 방식
@objc func doSomething(_ sender: Any) {
	// @objc는 Swift 클래스를 사용하는 Objective-C 코드가 있거나 Objective-C유형의 메서드를 사용하는 경우 필요
}

// 인터페이스 빌더
@IBAction func doSomething(_ sender: Any) { 

}

/*
  아직까지 애플의 프레임워크는 Objective-C 언어로 작성된 코드가 많기 때문에 스위프트 언어로 작성한 코드에서는 Objective-C 코드와 호환하기 위해서 @objc라고 표시해주어야 합니다. 스위프트 언어 4버전 이전의 컴파일러는 @objc를 자동으로 만들어 주었습니다. 하지만 이러한 방식은 자원 비용이 많이 들어 스위프트 4에서는 명시적으로 작성해야 합니다.
*/
```

[애플 공식 문서 - Target-Action](https://developer.apple.com/library/content/documentation/General/Conceptual/Devpedia-CocoaApp/TargetAction.html)

[도움 사이트 - 부스트코스](https://www.edwith.org/boostcourse-ios/lecture/16854/)

