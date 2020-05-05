# 2020년 05월 05일

## UI Button의 상태

- default, highlighted, focused, selected, disabled
- 버튼의 상태는 조합된 상태 일 수 있다.
- [default + highlighted], [selected + disabled] 등등

## UI Button의 주요 메서드

``` swift
// 특정 상태의 버튼의 문자열 설정
func setTitle(String?, for: UIControlState)
// 특정 상태의 버튼의 문자열 반환
func title(for: UIControlState) -> String?
// 특정 상태의 버튼 이미지 설정
func setImage(UIImage?, for: UIControlState)
// 특정 상태의 버튼 이미지 반환
func image(for: UIControlState) -> UIImage?
// 특정 상태의 백그라운드 이미지 설정
func setBackgroundImage(UIImage?, for: UIControlState)
// 특정 상태의 백그라운드 이미지 반환
func backgroundImage(for: UIControlState) -> UIImage?
// 특정 상태의 문자열 색상 설정
func setTitleColor(UIColor?, for: UIControlState)
// 특정 상태의 attributed 문자열 설정
func setAttributedTitle(NSAttributedString?, for: UIControlState)
```

***

## UI Label의 주요 프로퍼티

- var attributedText: NSAttributedString? : 레이블이 표시할 속성 문자열
  - [NSAttributed 클래스](https://developer.apple.com/documentation/foundation/nsattributedstring)를 사용한 속성 문자열 중 특정 부분의 속성을 변경할 수 있다. (일부 글자 색상 변경/일부 글자 폰트 변경)
  - attributedText 프로퍼티에 값을 할당하면 text 프로퍼티에도 똑같은 내용의 문자열이 할당됩니다.

- var numberOfLines: Int: 문자를 나타내는 최대 라인 수
  - 문자열을 모두 표시하는 데 필요한 만큼 행을 사용하려면 0으로 설정하십시오. 기본 값은 1입니다.
  - 설정한 문자열이 최대 라인 수를 초과하면 lineBreakMode 프로퍼티의 값에 따라 적절히 잘라서 표현합니다
  - adjustsFontSizeToFitWidth 프로퍼티를 활용하면 폰트 사이즈를 레이블의 넓이에 따라 자동으로 조절해줍니다.

- var baselineAdjustment: UIBaselineAdjustment: 문자열이 Autoshrink 되었을 때의 수직 정렬 방식
  - Align Baseline: 문자가 작아졌을 때 기존 문자열의 기준선에 맞춤
  - Align Center: 문자가 작아졌을 때 작아진 문자의 중앙선에 맞춤
  - None: 문자가 작아졌을 때 기존 문자열의 위쪽 선에 맞춤

- var lineBreakMode: NSLineBreakMode: 레이블의 경계선을 벗어나는 문자열에 대응하는 방식
  - Character wrap: 여러 줄 레이블에 주로 적용되며, 글자 단위로 줄 바꿈을 결정합니다.
  - Word wrap: 여러 줄 레이블에 주로 적용되며, 단어 단위로 줄 바꿈을 결정합니다.
  - Truncate head: 한 줄 레이블에 주로 적용되며, 앞쪽 텍스트를 자르고 ...으로 표시합니다.
  - Truncate middle: 한 줄 레이블에 주로 적용되며, 중간 텍스트를 자르고 ...으로 표시합니다.
  - Truncate tail: 한 줄 레이블에 주로 적용되며, 끝쪽 텍스트를 자르고 ...으로 표시합니다. 기본 설정 값입니다.

***

## UI Slider 주요 프로퍼티

- 사용자가 슬라이더의 값을 변경하면 슬라이더에 연결된 메서드가 호출되어 원하는 작업이 실행된다. 기본적으로는 사용자가 슬라이더의 *Thumb*를 이동시키면 연속적으로 이벤트를 호출하지만, `isContinous` 프로퍼티값을 `false`로 설정하면 슬라이더의 *Thumb*에서 손을 떼는 동시에 이벤트를 호출합니다.

- var minimumValue: Float, var maximumValue: Float: 슬라이더 양끝단의 값
- var value: Float: 슬라이더의 현재 값
- var isContinuous: Bool: 슬라이더의 연속적인 값 변화에 따라 이벤트 역시 연속적으로 호출할 것인지의 여부
- var minimumValueImage: UIImage?, var maximumValueImage: UIImage?: 슬라이더 양끝단의 이미지
- var thumbTintColor: UIColor?: thumb의 틴트 색상
- var minimumTrackTintColor: UIColor?, var 
- maximumTrackTintColor: UIColor?: thumb를 기준으로 앞쪽 트랙과 뒤쪽 트랙의 틴트 색상

## UI Slider 주요 메서드

``` swift
//  슬라이더의 현재 값 설정
func setValue(Float, animated: Bool)

//  특정 상태의 minimumTrackImage 반환
func minimumTrackImage(for: UIControlState) -> UIImage?

// 특정 상태의 minimumTrackImage 설정
func setMinimumTrackImage(UIImage?, for: UIControlState)

// 특정 상태의 maximumTrackImage 반환
func maximumTrackImage(for: UIControlState) -> UIImage?

// 특정 상태의 minimumTrackImage 설정
func setMaximumTrackImage(UIImage?, for: UIControlState)

//  특정 상태의 thumbImage 반환
func thumbImage(for: UIControlState) -> UIImage?

//특정 상태의 thumbImage 설정
func setThumbImage(UIImage?, for: UIControlState)
```

