

# 2020년 04월 28일(화)

## TextField

- 첫 진입 시 특정 **TextField에 커서 이동 되면서 키보드가 올라오도록 하는 메소드** => ```becomeFirstResponder()```

````swift
override func viewWillAppear(_ animated: Bool) {
  super.viewWillAppear(animated)
  
  textField.becomeFirstResponder()
}
````

* 반대로, 키보드가 내려가도록 하는 메소드가 있는데 특정 TextField의 키보드가 올라와 있는 경우에만 가능하다. 예를 들어, A TextField에서 키보드를 올려놓고 B TextField로 커서를 이동한 후 아래의 코드를 실행하면 실행되지 않는다. => ```resignFirstResponder()```

``` swift
@IBAction func clickedButton(_ sender: UIButton) {
  textField.resignFirstResponder()

  // 언제나 모든 키보드 내려가게 하려면
  view.endEditing(true) // 대체로 이걸 쓰는 듯!!!
}
```

* [ **TextField 메소드** ]

```swift
@IBAction func textFieldEditingDidBegin(_ sender: UITextField) {
  // 텍스트 필드에 커서를 딱 올렸을 때 최초 실행되는 메소드
}

@IBAction func textFieldEditingChanged(_ sender: UITextField) {
  // 텍스트 필드에 입력하거나 삭제 할 때 마다 실행하는 메소드
}

@IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
  // 텍스트 필드에서 Return(Enter) 눌렀을 경우 실행된다
  // 주의해야 할 부분은 여러 개의 텍스트 필드가 있을 경우 다른 텍스트 필드로 넘어 갈때 커서만 이동했다면 해당 메소드는 실행되지 않음
  // UITextField의 편집상태에서 키보드의 return 키를 터치했을 때 발생하는 이벤트 > UIControl.Event.editingDidEndOnExit
}

@IBAction func textFieldPrimaryActionTriggered(_ sender: UITextField) {
  // 버튼이 눌릴때 발생하는 이벤트 (iOS보다는 tvOS에서 사용) > UIControl.Event.primaryActionTriggered
}

@IBAction func textFieldEditingDidEnd(_ sender: UITextField) {
  // 텍스트 필드에서 입력을 모두 마쳤을 때 예를 들어, Return(Enter)키를 눌렀다거나 다른 텍스트 필드로 커서 이동 했을 경우 실행 됨
}
```

* BorderStyle

```swift
textInputField.borderStyle = .bezel // .line, .none, .roundedRect
```

***

## Alert Controller

- 소스 활용 및 실습

``` swift
let alert = UIAlertController(title: "카운트 추가?", message: "", preferredStyle: .alert)

alert.addTextField { textField in
	textField.placeholder = "정수 값 입력"
  textField.keyboardType = .numberPad
}

let addAction = UIAlertAction(title: "Add Count", style: .default, handler: { _ in
	if let addCount = alert.textFields?.first {
    guard addCount.text != "" else { return }
    self.count += Int(addCount.text!)!                                                                  	}                                                                })

let resetAction = UIAlertAction(title: "Reset", style: .destructive, handler: { _ in
	self.count = 0
})

let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)

alert.addAction(addAction)
alert.addAction(resetAction)
alert.addAction(cancelAction)

self.present(alert, animated: true)
```



***

## ETC...

- **didSet** 활용 방법

``` swift
var count: Int = 0 {
  didSet {
    countingLabel.text = "\(count)"
    countingLabel.sizeToFit()
  }
}
```

### 그외 TextField에 설정 할 수 있는 것들

#### Clear Button

- TextField 끝 쪽에 지울 수 있는 버튼 생성

#### Adjust to Fit

- 글이 길어지면 알아서 글씨 크기 조절 됨

#### Return Key

- "Go", "Next" 등 설정 가능함

#### Auto-enable Return Key

- 비어져 있으면 Return 키를 사용 할 수 없음

***

## [ 과제 ]

1. 텍스트 필드에 어떤 값을 입력하면 별도의 Label 에 입력된 텍스트 표시.
2. 텍스트 필드가 활성화 되어 있을 땐 Label 의 텍스트 색상이 파란색이고, Font 크기는 40
3. 텍스트 필드가 비활성화되면 Label 텍스트 색상이 빨간색이고, Font 크기는 20
4. (**추가문제**) 텍스트필드에 10글자까지만 입력되고 그 이상은 입력되지 않도록 하기

#### [ 해결 방법 ]

- TextField에 Event를 걸어주어 Label 상태를 변경한다.
- 이벤트는 editingChanged, editingDidBegin, editingDidEnd, editingDidEndOnExit 를 활용한다.

####  [ 문제 ]

- 텍스트 필드에 글자 수 10글자 까지만 입력 되도록 하는 것을 해결해야 했는데, 두 가지 방법이 있었다. 값이 입력 될때마다 실행되는 이벤트인 ```editingChanged``` 를 활용하거나, ```TextField Delegate``` 를 활용하는 방법이다.

##### 1. **editingChanged** 를 활용하는 경우

- 이벤트가 돌 때 마다 TextField의 글자 갯수를 체크하여 10 글자가 넘어가면 마지막(11번째) 글자를 remove 해주는 방법이다.

``` swift
@objc func textEditingChange(_ sender: UITextField) {
  if sender.text!.count > 10 {
    sender.text?.removeLast()
  }
  self.textViewLabel.text = sender.text
}
```

##### 2. **TextField Delegate** 를 활용하는 경우

- 먼저 TextFieldDelegate를 상속받아야 하고, Delegate를 사용할 TextField에 걸어줘야 한다. 추가적으로 Delegate 메소드를 구현해줘야 한다.

``` swift
class TextInsertViewController: UIViewController, UITextFieldDelegate {
	private let textInputField = UITextField()
  
  override func viewDidLoad() {
    // TextField Delegate ADD
    textInputField.delegate = self
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    if string == "\n" { return true }

    let currentCharacterCount = textField.text?.count ?? 0

    if range.length + range.location > currentCharacterCount {
      return false
    }

    let newLength = currentCharacterCount + string.count - range.length
    return newLength <= 10
  }
}
```

* ```string == "\n"``` 체크하는 이유는 이렇게 썼을 경우 TextField에 10글자가 **모두 채워져 있다면 Return(Enter)키를 먹지 않는다(10글자가 채워져서 더이상 안써진다)**. 따라서, 10글자 채워져 있을 경우가 있기 때문에 "\n"가 입력 됐을 경우 true를 반환하여 동작 할 수 있도록 한다.