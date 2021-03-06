# 2020년 05월 07일(목)

## Autolayout Interface Builder

### 1. 뷰와 뷰 사이에 ctr키 누르고 드래그 하는 방식

- 컨트롤-드래그 제약(Control-Dragging Constraints)
  - 두 뷰 사이의 제약을 생성하기 위해, 뷰 중 하나를 클릭 한 뒤 컨트롤(ctr) 키를 누른 상태에서 다른 뷰로 드래그한다.

![Control-Dragging](https://cphinf.pstatic.net/mooc/20180101_233/1514785516318nuv7l_PNG/Screen_Shot_2018-01-01_at_2.43.12_PM.png)

- 마우스를 원하는 뷰 위에서 놓을 때, 인터페이스 빌더는 HUD 메뉴를 통해 생성 가능한 제약을 보여줌

![Pic2](https://cphinf.pstatic.net/mooc/20180101_166/1514785533145dvKip_PNG/Screen_Shot_2018-01-01_at_2.43.18_PM.png)

- 인터페이스 빌더는 오토레이아웃을 적용하려는 아이템과 **드래그 방향에 기반해 선택 가능한 제약 조건을 지능적으로 제공** 한다.
- 만약 **수평으로 드래그 했다면**, **뷰 사이에 수평적인 공간을 설정할 선택권과 수직적으로 뷰를 정렬할 선택권**을 얻을 수 있다.
- **수직적으로 드래그 했다면, 수직적인 공간을 설정할 선택권과 수평적으로 뷰를 정렬한 선택권**을 얻게 된다.
- 두 제스처 모두 뷰의 상대적 크기와 같은 다른 옵션도 포함한다.

***

### 2. 스택, 정렬, 핀 그리고 리졸브를 사용하는 방식

- 스택, 정렬, 핀 그리고 리졸브 툴 사용(Using the Stack, Align, Pin, and Resolve Tools)

![pic3](https://cphinf.pstatic.net/mooc/20180101_286/1514785726884NYNmT_PNG/Screen_Shot_2018-01-01_at_2.43.24_PM.png)

**[ 스택 툴(Stack Tool) ]**

- **스택툴**은 **스택뷰를 재빠르게 생성**할 수 있게 해준다. 레이아웃에서 하나 혹은 그 이상의 아이템을 선택한 후, 스택 툴을 클릭하면 된다. 인터페이스 빌더는 **스택뷰에 선택된 아이템을 추가하고, 스택을 콘텐츠의 최근 피팅 사이즈에 맞게 크기를 재설정**한다.

**[ 정렬 툴(Align) ]**

- 정렬하려는 뷰를 선택한 뒤, 정렬 툴을 선택하면 아래와 같은 팝오버 창이 뜬다.

![Pic5](https://cphinf.pstatic.net/mooc/20180101_53/15147858940076WFeo_PNG/Screen_Shot_2018-01-01_at_2.43.30_PM.png)

- 제약을 걸고 싶은 부분은 체크 후 값을 설정하면 된다. 정렬을 확실하게 하는데 필요한 제약을 생성한다.
- 일반적으로, 제약은 어떠한 오프셋(서로에 맞게 정렬되어 있는 엣지 또는 센터)도 갖지 않으며 제약이 추가 될 때, 어떠한 프레임도 업데이트 되지 않는다.
- 제약을 생성하기 전에 모든 설정을 변경할 수 있다.
- 보통 두 개 혹은 그 이상의 뷰를 정렬 툴을 사용하기 전에 선택한다. 하지만 수평적 혹은 수직적으로 컨테이너 내에 있는 제약은 하나의 뷰에 추가될 수 있다.
- 동시에 하나 혹은 두 개 이상을 생성하는 것은 거의 힘들지만, 한 번에 제약을 생성하기 위한 팝오버를 사용할 수 있다.

**[ 핀 툴(Pin Tool) ]**

- **뷰의 이웃과 연관된 뷰의 위치 또는 그 크기를 재빠르게 정의**하도록 한다. 고정되기 원하는 아이템의 위치나 크기를 선택하고 핀 툴을 클릭한다.

![Pic6](https://cphinf.pstatic.net/mooc/20180101_205/1514787434436qGzJM_PNG/Screen_Shot_2018-01-01_at_2.43.36_PM.png)

- 리딩, 위, 트레일링, 아래에 있는 엣지 값을 고정할 수 있으며, 가장 가까운 곳에 고정된다. 또한 설정하는 숫자는 아이템 사이의 공간을 나타낸다.
- 커스텀 공간에 입력해줄 수 도 있고 어떤 뷰가 제약되어야 하는지를 설정하거나 기본 공간을 선택하기 위해 더보기 삼각형을 클릭할 수 있다.
- **여백 제약하기(Constrain to margins)** 의 체크박스는 **슈퍼 뷰가 슈퍼 뷰의 여백 또는 엣지를 사용하는 것을 제약할 것인지의 여부** 를 체크할 수 있다.

![Pic8](https://cphinf.pstatic.net/mooc/20180101_104/1514787460137cFPWq_PNG/Screen_Shot_2018-01-01_at_2.43.42_PM.png)

- 너비와 높이를 설정 할 수 있으며, 화면 비율 제약은 아이템의 현재 화면 비율을 사용하지만, 이 값을 변경해주고 싶다면 일단 생성 후 제약을 다시 살펴보고 수정해야 한다.
- 일반적으로, 고정할 하나의 뷰를 선택한다. 하지만, 두 개 혹은 그 이상의 뷰를 선택할 수 있고 뷰에 모두 같은 너비 또는 높이를 줄 수 있다.

**[ 리졸브 툴(Resolve Tool) ]**

- 오토레이아웃 문제 해결을 위한 도구로, 문제를 고치는 몇 가지 옵션을 제공한다.
- 메뉴 절반 위의 옵션은 현재 선택된 뷰에 한해 영향을 주며, 절반 아래의 옵션은 씬(scene)에 있는 모든 뷰에 영향을 준다.

![Pic9](https://cphinf.pstatic.net/mooc/20180101_252/1514787751973R0Bcw_PNG/Screen_Shot_2018-01-01_at_2.43.59_PM.png)



***

### 3. 인터페이스 빌더가 제약 설정하는 방식

- 인터페이스 빌더의 제약 생성(Letting Interface Builder Create Constraints)
- 인터페이스 빌더 **스스로 제약을 생성** 할 수 있다. **캔버스에 있는 뷰의 현재 크기와 위치에 맞는 최선의 제약을 추론**한다.
- 모든 제약을 생성하기 위해, **오토레이아웃 문제 해결 툴(Resolve Auto Layout Issues tool) > 추천 제약으로 재설정(Reset to Suggested Constraints) 클릭** 하는 방법이 있다. 모든 제약을 생성한다.
- 다른 방법으로는, 몇 가지 제약을 직접 추가해준 다음 **오토레이아웃 문제 해결 툴 > 빠진 제약 추가하기(Add Missing Constraints)** 을 클릭하는 방법이 있다. 해당 선택지는 모호하지 않은 레이아웃을 필요로 하는 제약을 추가해준다.
- 또한, 선택된 뷰나 씬(scene)에 있는 모든 뷰에 제약을 추가해줄 수 있다.

***

## 생성된 제약 찾기

### 1. 캔버스에 있는 제약 보기(Viewing Constraints in the Canvas)

- 편집기는 현재 선택된 뷰에 영향을 주는 모든 뷰를 색이 있는 선으로 나타낸다. 모양, 선 유형, 그리고 선 색은 제약의 현재 상태에 대해 나타낸다.   

![Pic10](https://cphinf.pstatic.net/mooc/20180101_166/1514788145807yPVAo_PNG/Screen_Shot_2018-01-01_at_2.44.35_PM.png)

- **I-bars (양 끝에 T모양이 있는 선)** l-bars는 공간의 크기를 나타낸다. 이 공간은 두 아이템 사이의 거리, 아이템의 높이와 너비를 나타낼 수 있다.

- **일반선(양 끝에 아무것도 없는 직선)** 일반 선은 엣지가 정렬된 부분을 나타낸다. 인터페이스 빌더는 두 개 혹은 그 이상의 뷰의 리딩 엣지를 정렬하는 데 일반선을 사용한다. 이 선은 아이템 사이에 0 포인트 공간을 갖는 두 아이템을 연결하는 데 사용하기도 한다.

- **실선** 실선은 필수적 제약을 나타내는 데 사용한다. (우선도=1000)

- **점선** 점선은 선택적 제약을 나타내는 데 사용한다. (우선도 < 1000)

- **빨간 선** 오류가 있는 제약에 영향을 받은 아이템을 나타낸다. 모호한 레이아웃을 갖거나 만족스럽지 않은 레이아웃을 갖는 아이템의 경우도 빨간 선으로 나타난다. 인터페이스 빌더 아웃라인 뷰(Interface Builder’s outline view)에 있는 내비게이터 또는 더 보기 화살표 문제(the issues navigator or the disclosure arrow) 참고.

- **주황선** 주황선은 제약의 영향을 받는 아이템 중 하나의 프레임이 현재 제약에 기반할 때 올바른 위치에 있지 않음을 나타낸다. 인터페이스 빌더는 프레임의 계산된 위치를 점선으로 나타나는 윤곽선으로 나타내기도 한다. 오토레이아웃 문제 해결 툴 > 프레임 명령 업데이트를 통해 계산된 위치로 아이템을 이동해줄 수도 있다.

- **파란선** 명확하고 만족스러운 레이아웃을 갖는 제약의 영향을 받는 아이템과 아이템 프레임이 오토레이아웃 엔진에 의해 계산된 올바른 위치에 있는 경우 파란선으로 나타난다.

- **등호 뱃지** 인터페이스 빌더는 두 아이템에게 같은 너비 또는 같은 높이를 주는 제약을 각 아이템에 분리된 막대로 보여준다. 두 막대에는 등호 표시가 있는 파란색 뱃지가 있다.

- **더 크거나 같은 뱃지 그리고 더 작거나 같은 뱃지** 인터페이스 빌더는 모든 제약을 그 안에 >= 또는 <= 표기가 있는 작은 파란 뱃지를 통해 더 크거나 같은 또는 더 작거나 같은 관계를 나타내는 모든 제약을 표기한다.

### 2. 도큐멘트 아웃라인 제약 목록(Listing Constraints in the Document Outline)

- 제약을 포함하는 뷰 아래에 제약을 그룹화하여 **도큐멘트 아웃라인의 모든 제약을 나열**한다.
- 이에 따라, 각 뷰는 자기 자신과 서브 뷰를 포함하며 위 그리고 아래 레이아웃 가이드는 씬(scene)의 루트뷰에 포함된다.

![Pic12](https://cphinf.pstatic.net/mooc/20180101_150/1514788220913oP3CS_PNG/Screen_Shot_2018-01-01_at_2.44.40_PM.png)

- 제약이 아웃라인에 퍼질 수 있다고 하더라도, 대부분의 제약은 씬(scene) 루트뷰 아래에서 끝난다. 만약 모든 제약을 찾고자 한다면, 뷰 계층 전체를 확장하면 된다.

### 3. 사이즈 인스펙터에서 제약 찾기(Finding Constranits in the Size Inspector)

- 현재 선택된 뷰에 영향을 받는 모든 제약을 나타낸다.
- 필수적 제약은 실선으로 나타나며, 선택적 제약은 점섬으로 나타난다.

![Pic13](https://cphinf.pstatic.net/mooc/20180101_3/1514788253334fdvcv_PNG/Screen_Shot_2018-01-01_at_2.44.46_PM.png)

***

## 제약 편집하기

### 1. 사이즈 인스펙터

- 사이즈 인스펙터에서 생성된 제약을 확인하고, "Edit" 버튼을 눌러 제약을 바로 수정 할 수 있다.

![Pic15](https://cphinf.pstatic.net/mooc/20180101_83/1514788576621j7HDt_PNG/Screen_Shot_2018-01-01_at_3.35.54_PM.png)

- 제약의 관계, 상수, 우선도 또는 배수를 변경할 수 있는 팝오버 창(popover)을 띄울 수 있다.
- 더 많은 변경이 필요할 경우 제약을 더블 클릭하여 **속성 인스펙터** 를 열 수 있다.

### 2. 속성 인스펙터

![Pic16](https://cphinf.pstatic.net/mooc/20180101_275/1514788685843rhpJq_PNG/Screen_Shot_2018-01-01_at_3.35.59_PM.png)

- 첫 번째 항목(first item), 관계(relation), 두 번째 항목(second item), 상수(constant), 배수(multiplier)가 포함된다. 또한 우선도와 식별자도 보여준다.
- 또한 제약을 플레이스홀더(placeholder)로 체크할 수도 있다. 체크된 제약들은 설계시점(design time)에만 존재하고 애플리케이션 실행 시에는 레이아웃에 포함되지 않는다.
- 해당 제약 추가는 실행시점에서 동적으로 제약을 추가할 경우에 사용한다. 명료하고 만족스러운 레이아웃을 생성하기 위한 제약을 일시적으로 추가함으로써, 경고나 에러를 제거할 수 있다.
- 상수, 우선도, 배수, 관계, 식별자 및 플레이스홀더 속성을 자유롭게 수정하는 것이 가능하나, 첫 번째 및 두 번째 항목의 경우 속성 수정에 제한이 따른다.
- 첫 번째 항목과 두 번째 항목을 서로 바꿀 수 있으며 항목의 속성 또한 변경할 수 있으나, 항목 자체를 바꾸는 것은 불가능하다. **전혀 다른 항목으로 제약을 옮기고 싶은 경우 제약을 삭제 한 후 새로운 제약으로 대체해야 한다.**

***

[애플 공식 문서 - Constraints in Interface Builder](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithConstraintsinInterfaceBuidler.html#//apple_ref/doc/uid/TP40010853-CH10-SW1)

[애플 공식 문서 - Auto Layout Guide: Types of Errors](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/TypesofErrors.html#//apple_ref/doc/uid/TP40010853-CH22-SW1)

[Xcode Help - Interface Builder workflow](http://help.apple.com/xcode/mac/current/#/dev31645f17f)

[출처 - 부스트코스](https://www.edwith.org/boostcourse-ios/lecture/16873/)

[StackView 관련 내용](https://www.edwith.org/boostcourse-ios/lecture/16884/)



