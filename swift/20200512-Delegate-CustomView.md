# 2020년 05월 12일(화)

## Delegate

- [명사] 대표(자), 사절, 위임, 대리(자)
- [동사] (권한, 업무 등을)위임하다, (대표를) 선정하다

### 델리게이션 디자인 패턴(Delegation Design Pattern)

델리게이션 디자인 패턴은 **하나의 객체가 다른 객체를 대신해 동작 또는 조정할 수 있는 기능**을 제공한다. 즉 **특정 로직을 내가 아닌 다른 객체가 대신 구현하도록 위임하는 형태의 디자인 패턴**이라고 볼 수 있다.

- 델리게이션 디자인 패턴은 Foundation, UIKit, AppKit 그리고 Cocoa Touch 등 애플의 프레임워크에서 광범위하게 활용하고 있다.
- **요청하는 객체**와 **요청에 응답할 객체**로 나누어 작성
  - 뷰가 받은 이벤트나 상태를 뷰 컨트롤러에게 전달하여 처리(**View -> ViewController**)
  - 뷰 구성에 필요한 정보를 뷰 컨트롤러가 결정(**View <- ViewController**)
  - 주요 코드는 숨기고 특정 상황에 대해서만 커스터마이징 할 수 있도록 제공
- **주로 프레임워크 객체가 위임을 요청**하며, (주로 애플리케이션 프로그래머가 작성하는) **커스텀 컨트롤러 객체가 위임을 받아 특정 이벤트에 대한 기능을 구현**한다.
- 델리게이션 디자인 패턴은 커스텀 컨트롤러에서 **세부 동작을 구현함으로써 동일한 동작에 대해 다양한 대응**을 할 수 있게 해준다.
- MusicPlayer(AVAudioPlayer)와 UIImagePickerController의 [Delegate 예제](https://www.edwith.org/boostcourse-ios/lecture/16883/)

#### UITextFieldDelegate Example

```swift
// 대리자에게 특정 텍스트 필드의 문구를 편집해도 되는지 묻는 메서드
func textFieldShouldBeginEditing(UITextField)
	
// 대리자에게 특정 텍스트 필드의 문구가 편집되고 있음을 알리는 메서드
func textFieldDidBeginEditing(UITextField)

// 특정 텍스트 필드의 문구를 삭제하려고 할 때 대리자를 호출하는 메서드
func textFieldShouldClear(UITextField)

// 특정 텍스트 필드의 `Return` 키가 눌렸을 때 대리자를 호출하는 메서드
func textFieldShouldReturn(UITextField)
```

#### CustomView Delegate Example

```swift
// CustomView.swift
// 1. 프로토콜 정의
protocol CustomViewDelegate: class {
    func colorForBackground(_ newColor: UIColor?) -> UIColor
}

final class CustomView: UIView {
    /*
     2. delegate 프로퍼티 선언
     - 일반적으로 delegate라고 명명
     - 타입은 정의한 프로토콜과 동일
     - optional
     - weak : 순환 참조 때문에 weak으로 선언해야 한다
     */
    weak var delegate: CustomViewDelegate?
    
    override var backgroundColor: UIColor? {
        get { super.backgroundColor }
        set {
            /*
             3. 필요한 곳에서 delegate 객체의 메서드 실행
             - delegate에 할당된 객체는 없을 수 있음(nil)
             - nil이 아니면 메서드 호출에 응답하여 어떤 로직(그게 무엇이 될지는 알 수 없음)을 수행
             - 반환되는 값이 있을 경우 그 결과를 받아서 활용
             */
            let newColor = delegate?.colorForBackground(newValue)
            let applyColor = newColor ?? newValue ?? .systemGray
            
            super.backgroundColor = applyColor
            print("새로 변경될 색은 :", applyColor)
        }
    }
}


//-------------------------------------------------
// ViewController.swift
// 사용할 delegate(CustomViewDelegate)를 추가해줘야 한다.
// 1. delegate 프로토콜 채택
class ViewController: UIViewController, CustomViewDelegate {

    @IBOutlet var customView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         2. delegate 프로퍼티를 소유한 객체에게 위임받아 처리할 메서드를 구현한 객체 할당(보통 self)
         - customView.delegate에 ViewController(주소)를 전달해줌
         - 이 부분이 중요함
         - 프로토콜을 채택하지 않은 경우 에러 메시지 발생
         */
        customView.delegate = self
        
        customView.backgroundColor = .systemRed
        customView.backgroundColor = .systemGreen
        customView.backgroundColor = nil
    }
    
    /*
     3. 채택한 프로토콜의 메서드 구현
     - CustomViewDelegate의 colorForBackground 구현 부분
     - 옵셔널 메서드인 경우 미구현 가능
     - 이 메서드가 언제 호출될 지는 결정할 수 없으며, 그 시점은 위임하는 객체에 달려있음
     */
    func colorForBackground(_ newColor: UIColor?) -> UIColor {
        guard let color = newColor else { return .systemGray }
        return color == .systemGreen ? .systemBlue : color
    }
}
```



### 데이터소스(DataSource)

- 델리게이트와 매우 비슷한 역할을 한다.
- **델리게이트**가 **사용자 인터페이스 제어에 관련된 권한을 위임**받고, **데이터소스**는 **데이터를 제어하는 기능을 위임** 받는다.
- 많이 사용되는 데이터소스는 UITableViewDataSource, UICollectionViewDataSource가 있다.

### 프로토콜(Protocol)

- 코코아터치에서 **프로토콜을 사용해 델리게이션과 데이터소스를 구현**할 수 있다.
- **객체간 소통을 위한 강력한 통신 규약**으로 데이터나 메시지를 전달할 때 사용한다.
- 프로토콜은 특별한 상황에 대한 역할을 정의하고 제시하나, 세부 기능은 미리 구현해두지 않는다.
- 구조체, 클래스, 열거형에서 프로토콜을 채택하고 특정 기능을 수행하기 위한 요구사항을 구현할 수 있다.

***

## Custom View

```swift
// CustomView.swift
final class CustomView: UIView {
    weak var delegate: CustomViewDelegate?
    
    override var backgroundColor: UIColor? {
        get { super.backgroundColor }
        set {
            super.backgroundColor = newValue ?? .systemGray
            if newValue == .systemGreen {
                super.backgroundColor = .systemBlue
            }
            print("새로 변경될 색은 :", super.backgroundColor)
        }
    }
}

// ViewController.swift
class ViewController: UIViewController {
    @IBOutlet var customView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        changeBackgroundColor()
        
        // 1. 바꿀 때 마다 직접 입력
        // 2. 뷰컨트롤러에 메소드 작성
        // 3. 커스텀 뷰 구현
//        customView.backgroundColor = .systemRed
//        customView.backgroundColor = .systemGreen
        customView.backgroundColor = nil
    }

    private func changeBackgroundColor() {
        let colors: [UIColor] = [.systemBlue, .systemRed, .systemGreen, .systemYellow]
        customView.backgroundColor = colors.randomElement()!
        print(customView.backgroundColor)
    }
}
```

***

## Delegate 과제

Delegate 를 이용하여 FirstVC의 TextField 에 입력한 값을 SecondVC 의 Label에 표시하기

1. delegate 프로토콜과 프로퍼티를 firstVC 에 정의하는 방법으로 구현(e.g. class FirstVC { weak var delegate: ~~~ })

``` swift
// FirstViewController.swift
class FirstViewController: UIViewController, UITextFieldDelegate {
    weak var delegate: RiffleDelegate?
    
    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemTeal
        textField.frame.size = CGSize(width: 200, height: 50)
        textField.center = view.center
        textField.backgroundColor = .white
        textField.delegate = self
        
        self.view.addSubview(textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let secondVC = SecondViewController()
        
        delegate = secondVC
        delegate?.nextViewNextRiffle(textField.text ?? "")
        
        self.present(secondVC, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//================================================//
// SecondViewController
class SecondViewController: UIViewController {

    let viewLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        viewLabel.frame.size = CGSize(width: 200, height: 50)
        viewLabel.center = view.center
        viewLabel.backgroundColor = .systemFill
        viewLabel.font = .boldSystemFont(ofSize: 25)
        
        view.addSubview(viewLabel)
    }
}

extension SecondViewController: RiffleDelegate {
    func nextViewNextRiffle(_ inputText: String) {
        viewLabel.text = inputText
    }
}
```



2. delegate 프로토콜과 프로퍼티를 secondVC 에 정의하는 방법으로 구현(e.g. class SecondVC { weak var delegate: ~~~ })

```swift
// ThirdViewController.swift
class ThirdViewController: UIViewController {

    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemTeal
        textField.frame.size = CGSize(width: 200, height: 50)
        textField.center = view.center
        textField.backgroundColor = .white
        textField.delegate = self
        
        self.view.addSubview(textField)
    }
}

extension ThirdViewController: UITextFieldDelegate, TextSendDelegate {
    func sendTextFunction() -> String {
        return textField.text ?? ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let fourthVC = FourthViewController()
        fourthVC.delegate = self
        present(fourthVC, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//================================================//
// FourthViewController.swift
protocol TextSendDelegate: class {
    func sendTextFunction() -> String
}

class FourthViewController: UIViewController {
    weak var delegate: TextSendDelegate?

    let viewLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        viewLabel.frame.size = CGSize(width: 200, height: 50)
        viewLabel.center = view.center
        viewLabel.backgroundColor = .systemFill
        viewLabel.font = .boldSystemFont(ofSize: 25)
        
        view.addSubview(viewLabel)
        
        viewLabel.text = delegate?.sendTextFunction()
    }
}
```



***

[애플 공식 문서 - Delegation](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html#//apple_ref/doc/uid/TP40014097-CH25-ID276)

[애플 공식 문서 - Cocoa Design Patterns](https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/AdoptingCocoaDesignPatterns.html#//apple_ref/doc/uid/TP40014216-CH7-ID8)

[일부 출처 - 부스트코스](https://www.edwith.org/boostcourse-ios/lecture/16856/)

