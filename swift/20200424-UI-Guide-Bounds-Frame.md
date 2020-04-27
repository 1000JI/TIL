

# 2020년 04월 24일(금)



## UI Guide

- 화면 크기, 너비를 바탕으로 동일하게 계산하여 레이아웃을 계산함
- UI Image
  - Scale To Fill: 비율의 상관없이 View에 가득 채움
  - Aspect Fit: 화면 크기에 맞춰 사진의 비율에 맞게 들어감(빈 공간 발생)
  - Aspect Fill: 화면 크기에 맞춰 사진의 비율이 크게 들어감(짤리는 현상 발생)
    - 1x -> 3x로 변경함(Assets.xcassets): 2x 또는 3x 으로 나눈 값이 들어가기 때문에 화면 상에서 작아짐
    - 왜? 1x는 1포인트당 1개 픽셀을 담겠다. 또는 2x는 1포인트당 4개 픽셀을 담는다
- View Frame의 좌표는 상위 뷰를 기준으로 결정
  - 버튼의 상위뷰가 mainView 일지, subView 일지에 따라 만들어지는 위치가 달라짐
- **Frame** rectangle
  - 상위(**Super**) 뷰의 원점 (0, 0)으로 부터 width와 height 만큼 그려짐
  - 정의: **Superview(상위뷰)의 좌표시스템** 안에서 View의 위치와 크기를 나타냅니다.
    - Frame의 핵심은 **SuperView(상위 뷰)**
- **Bounds** rectangle
  - 자기 자신 원점(0, 0)부터 width와 height 만큼 그림
  - Bounds를 변경하는 것은 해당 위치에서 View를 다시 그리라는 의미, Bounds는 상위뷰와 아무런 관련이 없으므로, 해당 뷰는 움직이지 않는 것 처럼 보이고, 그안에 있던 View들이 움직이는 것 처럼 보이는 것이다.
  - **Scroll View** 에서 중요!!!
  - 정의: View의 위치와 크기를 **자신만의 좌표시스템** 안에서 나타냅니다.
    - Bounds의 핵심은 **자신 만의 좌표 시스템**
  
***
### Positioning
<img src="https://github.com/1000JI/TIL/blob/master/picture/Positioning.png" width="600px" height="300px" title="Upload" alt="Smile"></img><br/>

***
### Bounds Capture 1
<img src="https://github.com/1000JI/TIL/blob/master/picture/Bounds_Capture1.png" width="600px" height="350px" title="Upload" alt="Smile"></img><br/>

***
### Frame Capture 1
<img src="https://github.com/1000JI/TIL/blob/master/picture/Frame_Capture1.png" width="600px" height="500px" title="Upload" alt="Smile"></img><br/>

***
### Frame Capture 2
<img src="https://github.com/1000JI/TIL/blob/master/picture/Frame_Capture2.png" width="600px" height="350px" title="Upload" alt="Smile"></img><br/>
