# 2020년 05월 06일(수)

## Autolayout(오토레이아웃)

- 아이폰 기종이 다양한 사이즈와 화면 비율로 출시되면서 사이즈에 구애 받지 않고 **시각적으로 동일한 화면을 구현** 해야하는데, 이를 위한 가장 편리하고 권장되는 방법이 **오토레이아웃**이다.

### 오토레이아웃

- 뷰의 제약 사항을 바탕으로 뷰 체계 내의 모든 뷰의 크기와 위치를 동적으로 계산
- 애플리케이션을 사용 할 때 발생하는 외부 변경과 내부 변경에 동적으로 반응하는 사용자 인터페이스를 가능하게 한다.

#### [ 외부 변경(External Changes) ]

- 슈퍼 뷰의 크기나 모양이 변경될 때 발생한다. 각각의 변화와 함께 사용 가능한 공간을 가장 잘 사용할 수 있도록 뷰 체계의 레이아웃을 업데이트 해야 한다.
  - 사용자가 아이패드의 분할뷰(Split View)를 사용하거나 사용하지 않는 경우(iOS)
  - 장치를 회전 하는 경우(iOS)
  - 활성화콜(active call)과 오디오 녹음 바가 보여지거나 사라지는 경우(iOS)
  - 다른 크기의 클래스를 지원하기 원하는 경우
  - 다른 크기의 스크린을 지원하기 원하는 경우

#### [ 내부 변경(Internal Changes) ]

- 사용자 인터페이스의 뷰의 크기 또는 설정이 변경되었을 때 발생한다.
  - 애플리케이션 변경에 의해 콘텐츠가 보여지는 경우
  - 애플리케이션이 국제화를 지원하는 경우
  - 애플리케이션이 동적 타입을 지원하는 경우

#### [ 오토레이아웃 속성 ]

- 오토레이아웃의 속성은 정렬 사각형을 기반으로 한다.

![Autolayout Image](https://cphinf.pstatic.net/mooc/20180131_23/1517382343431DS66c_PNG/99_0.png)

- Width: 정렬 사각형의 너비
- Height: 정렬 사각형의 높이
- Top: 정렬 사격형의 상단
- Bottom: 정렬 사각형의 하단
- Baseline: 텍스트의 하단
- Horizontal: 수평
- Vertical: 수직
- Leading: 리딩, 텍스트를 읽을 때 시작 방향
- Trailing: 트레일링: 텍스트를 읽을 때 끝 방향
- CenterX: 수평 중심
- CenterY: 수직 중심

#### [ 안전 영역(Safe Area) ]

- 안전 영역은 콘텐츠가 **상대바, 네비게이션바, 툴바, 탭바**를 가리는 것을 방지하는 영역이다. 표준 시스템이 제공하는 뷰들은 **자동으로 안전 영역 레이아웃 가이드를 준수**하게 되어 있다.
- 기존의 상/하단 레이아웃 가이드(Top/Bottom Layout Guide)를 대체하며, 하위 버전에도 호환하여 작동한다.
  - 안전 영역은 iOS 11부터 사용 할 수 있다.
  - iOS 11 미만의 버전에서는 상/하단 레이아웃 가이드를 사용한다.

![Safe Area](https://cphinf.pstatic.net/mooc/20180131_279/1517382425613u4b3S_PNG/99_1.png)

- 안전 영역 레이아웃 가이드는 UIView 클래스의 ```var safeAreaLayoutGuide: UILayoutGuide```로 접근 할 수 있다.

#### [ 제약(Constraint) ]

제약은 뷰 스스로 또는 뷰 사이의 관계를 속성을 통하여 정의한다. 제약은 방정식으로 나타낼 수 있다.

![autolayout constraint](https://cphinf.pstatic.net/mooc/20180131_215/1517382467433FzU1i_PNG/99_2.png)

- Item1: 방정식에 있는 첫 번째 아이템(B View)이다. 첫 번째 아이템은 반드시 뷰 또는 레이아웃 가이드여야 한다.
- Atrribute1: 첫 번째 아이템에 대한 속성이다. 이 경우, B View의 리딩이다.
- Multiplier: 속성 2에 곱해지는 값이다.
- Item2: 방정식에 있는 두 번째 아이템(A View)이다.
- Atrribute2: 두 번째 아이템에 대한 속성이다.
- Constant: 두 번째 아이템의 속성에 더해지는 상수 값이다.

> B View의 리딩은 A View의 트레일링의 1.0배에 8.0을 더한 위치



#### [ 고유 콘텐츠 크기(Intrinsic Content Size) ]

뷰의 고유 콘텐츠 크기는 뷰가 갖는 원래의 크기로 생각할 수 있다. 예를 들어 레이블의 고유 콘텐츠 크기는 레이블의 텍스트의 크기고, 이미지의 고유 콘텐츠 크기는 이미지 자체의 크기이다.



#### [ 졔약 우선도(Constraint Priorities) ]

오토레이아웃은 뷰의 고유 콘텐츠 크기를 각 크기에 대한 한 쌍의 제약을 사용하여 나타낸다. 우선도가 높을 수록 다른 제약보다 우선적으로 레이아웃에 적용하며, 같은 속성의 다른 제약과 경합하는 경우, 우선도가 낮은 제약은 무시된다.

1. 콘텐츠 허깅 우선도(Content hugging priority): 콘텐츠 고유 사이즈보다 뷰가 커지지 않도록 제한한다. 다른 제약사항보다 우선도가 높으면 뷰가 콘텐츠 사이즈보다 커지지 않는다.
2. 콘텐츠 축소 방지 우선도(Content compression resistance priority): 콘텐츠 고유 사이즈보다 뷰가 작아지지 않도록 제한한다. 다른 제약사항보다 우선도가 높으면 뷰가 콘텐츠 사이즈보다 작아지지 않는다.

![Constraint Priorities](https://cphinf.pstatic.net/mooc/20180131_230/15173826015792mxXH_PNG/99_8.png)



#### [ 레이아웃 마진 ]

뷰에 콘텐츠 내용을 레이아웃할 때 사용하는 기본 간격(default spacing)이다.

- 레이아웃 마진 가이드(Layout Margins Guide): 레이아웃 마진에 따라 형성되는 시각의 프레임 영역



#### [ 영역(Anchor) ]

오토레이아웃을 코딩으로 구현하여 제약(Constraint)을 만들기 위해 앵커(Anchor)를 사용 할 수 있다.

- 앵커와 관련된 **프로퍼티**

``` swift
var constraints: [NSLayoutConstraint]
// 뷰에 부여한 제약사항들은 담은 배열

var bottomAnchor: NSLayoutYAxisAnchor { get }
// 뷰 프레임의 하단부 레이아웃 앵커

var centerXAnchor: NSLayoutXAxisAnchor { get }
// 뷰 프레임의 수평 중심부 레이아웃 앵커

var centerYAnchor: NSLayoutYAxisAnchor { get }
// 뷰 프레임의 수직 중심부 레이아웃 앵커

var heightAnchor: NSLayoutDimension { get }
// 뷰 프레임의 높이를 가리키는 레이아웃 앵커

var leadingAnchor: NSLayoutXAxisAnchor { get }
// 뷰 프레임의 리딩을 가리키는 레이아웃 앵커

var topAnchor: NSLayoutYAxisAnchor { get }
// 뷰 프레임의 상단부 레이아웃 앵커

var trailingAnchor: NSLayoutXAxisAnchor { get }
// 뷰 프레임의 트레일링을 가리키는 레이아웃 앵커

var widthAnchor: NSLayoutDimension { get }
// 뷰 프레임의 넓이를 가리키는 레이아웃 앵커
```

* 중앙에 버튼을 배치하고 버튼의 top anchor를 사용하여 레이블을 버튼의 상단으로부터 10만큼 떨어지도록 배치해보는 예제

``` swift
import UIKit

class LayoutAnchorViewController: UIViewController {

  /*
  중앙에 버튼을 배치하고 버튼의 top anchor를 사용하여 레이블을 버튼의 상단으로부터 10만큼 떨어지도록 배치해봅시다.
  */

  @IBOutlet var button: UIButton!
  @IBOutlet var label: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    /*
    오토레이아웃이 도입되기 전 뷰를 유연하게 표현 할 수 있도록 오토리사이징 마스크를 사용한다.
    오토레이아웃을 사용하게 되면 기존의 오토리사이징 마스크가 가지고 있던 제약 조건이 자동으로 추가되기 때문에 충돌하게 될 가능성이 발생한다.
    따라서 button.translatesAutoresizingMaskIntoConstraints = false로 지정 뒤 오토레이아웃을 적용해준다.
    참고로 인터페이스 빌더에서 오토레이아웃을 적용한 경우에는 자동으로 값이 false로 설정된다.
    참조: https://developer.apple.com/documentation/uikit/uiview/1622572-translatesautoresizingmaskintoco

    */
    button.translatesAutoresizingMaskIntoConstraints = false

    var constraintX: NSLayoutConstraint
    constraintX = button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)

    var constraintY: NSLayoutConstraint
    constraintY = button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)

    constraintX.isActive = true
    constraintY.isActive = true


    //<------ Label ------>//
    label.translatesAutoresizingMaskIntoConstraints = false

    /*
    레이블의 수평 중앙을 버튼의 수평 중앙 앵커를 기준으로 제약을 생성 후 레이블의 하단 앵커를 버튼의 상단 앵커로부터 10 만큼의 거리를 두도록 한다.
    생성된 제약을 적용하기 위해서 .isActive = true로 설정해야한다. 안하면 동작 안함....
    */

    var buttonConstraintX: NSLayoutConstraint
    buttonConstraintX = label.centerXAnchor.constraint(equalTo: button.centerXAnchor)

    var topConstraint: NSLayoutConstraint
    topConstraint = label.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -10)

    buttonConstraintX.isActive = true
    topConstraint.isActive = true


    // 앵커를 활용하여 레이블의 너비가 버튼의 너비의 2배가 되도록 제약 만들기
    var widthConstraint: NSLayoutConstraint
    widthConstraint = label.widthAnchor.constraint(equalTo: button.widthAnchor, multiplier: 2.0)

    label.backgroundColor = .systemRed
    button.backgroundColor = .systemFill

    widthConstraint.isActive = true
  }

}
```

***

## NSLayoutConstraint

- NSLayoutConstraint 인스턴스 생성 제약 조건의 설명이다.
  - view1.attr1 = view2.attr2 * multiplier + constant
  - item.attribute = toltem.attribute * multiplier + constant

![NSLayoutConstraint](https://cphinf.pstatic.net/mooc/20171231_155/1514711859720YUbNR_PNG/Screen_Shot_2017-12-31_at_6.15.17_PM.png)

- button과 textField에 기본간격(Standard Space, iOS 11 현재 8포인트)에 제약을 주기 위해 `NSLayoutConstraint` 인스턴스를 생성하는 코드

```swift
NSLayoutConstraint(item: button, 
 			  attribute: .right,
 			  relatedBy: .equal,
 			  toItem: textField,
 			  attribute: .left,
 			  multiplier: 1.0,
 			  constant: 8.0)
```

![Exam1](https://cphinf.pstatic.net/mooc/20171231_38/1514710901056YUfvc_PNG/64_0.png)



- button의 너비가 50보다 크거나 같도록 넓이 제약(Width Constraint)을 줄 수 있는 `NSLayoutConstraint` 인스턴스 생성 코드

``` swift
 NSLayoutConstraint(item: button,
 			  attribute: .width,
 			  relatedBy: .greaterThanOrEqual,
 			  toItem: nil,
 			  attribute: .notAnAttribute,
 			  multiplier: 1.0,
 			  constant: 50.0)
```

![Exam2](https://cphinf.pstatic.net/mooc/20171231_191/1514710969724CwLfb_PNG/64_1.png)

- purpleBox가 superView를 기준으로 왼쪽(Leading) 간격은 50포인트, 오른쪽(Trailing) 간격은 50포인트로 설정(Connection to Superview)

``` swift
 NSLayoutConstraint(item: purpleBox,
 			  attribute: .left,
 			  relatedBy: .equal,
 			  toItem: self.view,
 			  attribute: .left,
 			  multiplier: 1.0,
 			  constant: 50.0)
 
 NSLayoutConstraint(item: purpleBox,
 			  attribute: .right,
 			  relatedBy: .equal,
 			  toItem: self.view,
 			  attribute: .right,
 			  multiplier: 1.0,
 			  constant: -50.0)
```

![Exam3](https://cphinf.pstatic.net/mooc/20171231_294/1514711010279xxKdW_PNG/64_2.png)

- topField와 bottomField의 세로 사이의 간격을 10포인트로 설정(Vertical Layout)

```swift
NSLayoutConstraint(item: topField,
 			  attribute: .bottom,
 			  relatedBy: .equal,
 			  toItem: bottomField,
 			  attribute: .top,
 			  multiplier: 1.0,
 			  constant: -10.0)
```

![Exam4](https://cphinf.pstatic.net/mooc/20171231_137/1514711065904CfO8g_PNG/64_3.png)

- maroonView와 blueView의 간격이 없음(Flush Views)

``` swift
 NSLayoutConstraint(item: maroonView,
 			  attribute: .right,
 			  relatedBy: .equal,
 			  toItem: blueView,
 			  attribute: .left,
 			  multiplier: 1.0,
 			  constant: 0.0)
```

![Exam5](https://cphinf.pstatic.net/mooc/20171231_18/1514711107480b9Kk1_PNG/64_4.png)

- button의 너비는 100포인트이고 우선도는 20으로 설정 (Priority)

``` swift
 NSLayoutConstraint(item: button,
 			  attribute: .width,
 			  relatedBy: .equal,
 			  toItem: nil,
 			  attribute: .notAnAttribute,
 			  multiplier: 1.0,
 			  constant: 100.0).priority = UILayoutPriority(rawValue: 20)
```

![Exam6](https://cphinf.pstatic.net/mooc/20171231_200/1514711159398x0XyC_PNG/64_5.png)

> 오토레이아웃에서는 뷰에 제약을 적용할 때, 어던 제약을 우선시 해야 하는지 우선도로 결정한다. 만약, 하나의 속성(attribute)에 적용 할 수 있는 두 개 이상의 제약이 있다면 그 중 우선도가 높은 제약이 적용된다. 우선도는 1부터 1000까지의 정수로 표현할 수 있다.

- button1과 button2의 너비 값이 같도록 제약을 생성 (Equal Widths)

``` swift
 NSLayoutConstraint(item: button1,
 			  attribute: .width,
 			  relatedBy: .equal,
 			  toItem: button2,
 			  attribute: .width,
 			  multiplier: 1.0,
 			  constant: 0.0)
```

![Exam7](https://cphinf.pstatic.net/mooc/20171231_36/1514711195741VbJ6N_PNG/64_6.png)

- flexibleButton의 너비 값이 70포인트보다 크거나 같고 100포인트보다 작거나 같도록 제약을 생성 (Multiple Predicates)

``` swift
 NSLayoutConstraint(item: flexibleButton,
 			  attribute: .width,
 			  relatedBy: .greaterThanOrEqual,
 			  toItem: nil,
 			  attribute: .notAnAttribute,
 			  multiplier: 1.0,
 			  constant: 70.0)
 			  
 NSLayoutConstraint(item: flexibleButton,
 			  attribute: .width,
 			  relatedBy: .lessThanOrEqual,
 			  toItem: nil,
 			  attribute: .notAnAttribute,
 			  multiplier: 1.0,
 			  constant: 100.0)
```

![Exam8](https://cphinf.pstatic.net/mooc/20171231_197/1514711251753MhaMG_PNG/64_7.png)

- button1, button2, textField와 superView의 간격은 표준 간격(8포인트)이며 textField의 너비 값은 20포인트보다 크거나 같도록 제약을 생성 (A Complete Line of Layout)

``` swift
 // button1
 NSLayoutConstraint(item: button1,
 			  attribute: .left,
 			  relatedBy: .equal,
 			  toItem: self.view,
 			  attribute: .left,
 			  multiplier: 1.0,
 			  constant: 8.0)

 // button2
 NSLayoutConstraint(item: button2,
 			  attribute: .left,
 			  relatedBy: .equal,
 			  toItem: button1,
 			  attribute: .right,
 			  multiplier: 1.0,
 			  constant: 8.0)

 // textField
 NSLayoutConstraint(item: textField,
 			  attribute: .left,
 			  relatedBy: .equal,
 			  toItem: button2,
 			  attribute: .right,
 			  multiplier: 1.0,
 			  constant: 8.0)

// textField width
 NSLayoutConstraint(item: textField,
 			  attribute: .width,
 			  relatedBy: .greaterThanOrEqual,
 			  toItem: nil,
 			  attribute: .notAnAttribute,
 			  multiplier: 1.0,
 			  constant: 20.0)

// textField right
 NSLayoutConstraint(item: textField,
 			  attribute: .right,
 			  relatedBy: .equal,
 			  toItem: self.view,
 			  attribute: .right,
 			  multiplier: 1.0,
 			  constant: -8.0)
```

![Exam9](https://cphinf.pstatic.net/mooc/20171231_242/1514711291414Qm81l_PNG/64_8.png)



***

## Visual Format Language

- "Visual Format Language"에서 사용 가능한 기호와 문자열

![Visual Format Language](https://cphinf.pstatic.net/mooc/20180101_108/15147824035030x96r_PNG/Screen_Shot_2017-12-31_at_6.15.28_PM.png)

- button과 textField에 기본간격(Standard Space, iOS 11 현재 8포인트)의 제약

```swift
 H:[button]-8-[textField] 또는 H:[button]-[textField]
```

* button의 너비가 50포인트보다 크거나 같도록 넓이 제약(Width Constraint) (Width Constraint)

```swift
 H:[button(>=50)]
```

* purpleBox가 superView를 기준으로 왼쪽(Leading) 간격은 50포인트, 오른쪽(Trailing) 간격은 50포인트로 설정 (Connection to Superview)

```swift
 H:|-50-[purpleBox]-50-|
```

* topField와 bottomField의 세로 사이의 간격을 10포인트로 설정 (Vertical Layout)

``` swift
V:[topField]-10-[bottomField]
```

- maroonView와 blueView의 간격이 없음 (Flush Views)

``` swift
H:[maroonView][blueView]
```

- button의 너비는 100포인트이고 우선도는 20으로 설정 (Priority)

``` swift
H:[button(100@20)]
```

- button1과 button2의 너비 값이 같도록 제약을 생성(Equal Widths)

```swift
H:[button1(==button2)]
```

* flexibleButton의 너비 값이 70포인트보다 크거나 같고 100포인트보다 작거나 같도록 제약을 생성 (Multiple Predicates)

``` swift
H:[flexibleButton(>=70,<=100)]
```

* find, findNext, findField와 superView의 간격은 표준 간격(8포인트)이며 findField의 너비 값은 20포인트보다 크거나 같도록 제약을 생성 (A Complete Line of Layout)

```swift
H:|-[find]-[findNext]-[findField(>=20)]-|
```



***

[애플 공식 문서 - Auto Layout Guide](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/index.html#//apple_ref/doc/uid/TP40010853-CH7-SW1)

[애플 공식 문서 - iOS H.I.G, Adaptivity and Layout](https://developer.apple.com/ios/human-interface-guidelines/visual-design/adaptivity-and-layout/)

[애플 공식 문서 - Auto Layout Guide(Code)](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/ProgrammaticallyCreatingConstraints.html#//apple_ref/doc/uid/TP40010853-CH16-SW1)

[애플 공식 문서 - Visual Format Language](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/VisualFormatLanguage.html#//apple_ref/doc/uid/TP40010853-CH27-SW1)

[출처 - 부스트코스](https://www.edwith.org/boostcourse-ios/lecture/16848/)









