

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
- **Bounds** rectangle
  - 자기 자신 원점(0, 0)부터 width와 height 만큼 그림