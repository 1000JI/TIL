

# 2020년 04월 23일(목)



## 	The App Life Cycle(생명주기)

- [The App Life Cycle.pdf] 참조
- Command + Shift + H: 홈으로 가기

### Not running

- 실행되지 않았거나, 실스템에 의해 종료된 상태

### Foreground

- Inactive: 실행 중이지만 이벤트를 받고 있지 않은 상태. 예를 들어, 앱 실행 중 미리 알림 또는 일정 얼럿이 화면에 덮여서 앱이 실질적으로 이벤트를 받지 못하는 상태 등을 뜻함
- Active: 애플리케이션이 실질적으로 활동하고 있는 상태

### Backgorund

- BackGround: 백그라운드 상태에서 실질적인 동작을 하고 있는 상태, 예를 들어 백그라운드에서 음악을 실행하거나, 걸어온 길을 트래킹 하는 등의 동작을 뜻함

### Suspended

- 백그라운드 상태에서 활동을 멈춘 상태. 빠른 재실행을 위하여 메모리에 적재된 상태이지만 실질적으로 동작하고 있지는 않음. 메모리가 부족할 때 비로소 시스템이 강제종료 하게 됨





## Xcode

- 통합 개발 환경(IDE, Intergrated Development) = Editor + Compiler + Debugger + ...
- Swift, Objective-C, C, C++, Fotran, Ruby, Python, Java
- [Xcode.pdf] 파일 참조



### 실습 중...

- View와 Safe Area 차이점: 노치 부분 & Status bar와 겹치지 않도록 하기 위해 Safe Area가 좀 더 작음
- Command + D : UI 복사
- Command + Shift + O 누른 뒤 Main 에서 Option + Enter 누르면 화면 분할되어 볼 수 있음
- Button Action
  - Touch Up Inside -> 버튼 내에서 손을 뗄 경우
  - Touch Up Outside -> 버튼 외에서 손을 뗄 경우