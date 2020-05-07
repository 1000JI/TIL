# 2020년 05월 07일(목)



## 공통 부분

- Action Segue 또는 Menual Segue으로 화면 전환 후 다시 돌아올 때 쓰는 메소드 구현

```` swift
@IBAction func unwindToViewAController(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
  print(unwindSegue.source) // 출발지
  print(unwindSegue.destination) // 도착지
  
  if let returnVC = unwindSegue.source as? SecondViewController {
    // Code
  }
}
````

- A View Controller("A"), B View Controller("B")가 있다고 가정 했을 때, A -> B로 Segue 이동 시, 상위 메소드는 A에 구성한다.
- 그 후, Storyboard에서 B에 있는 돌아가는 버튼과 [Exit]를 연결하면 ```unwindToViewAController``` 와 연결 할 수 있다.
- 그러면 B에서 돌아가는 버튼을 클릭하면 A로 돌아가면서 ```unwindToViewAController``` 메소드가 실행된다.

![unwind](https://github.com/1000JI/TIL/blob/master/picture/unWind.png)

***

## Action Segue

* shouldPerformSegue(prepare를 실행하기 전 Segue 실행 여부 결정) (true면 Segue 동작O, false면 Segue 동작X)

``` swift
override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
  super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
  
  // Code Example
  if let title = (sender as? UIButton)?.currentTitle {
    // Code
    return false
  }
  return true
}
```



- prepare(**화면 전환에 따른 사전 작업하는 메서드**)

``` swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  super.prepare(for: segue, sender: sender)

  // Code Example
  guard let secondVC = segue.destination as? SecondViewController else { return }
  secnodVC.text = "\(count)"
}
```

![ActionSegue](https://github.com/1000JI/TIL/blob/master/picture/ActionSegue.png)

***

## Menual Segue

- performManualSegue

```swift
@IBAction private func performManualSegue(_ sender: Any) {
  performSegue(withIdentifier: "Segue 이름", sender: sender)
  // performSegue 메소드가 Segue 실행
}
```

#### **1. A View에서 B View로 Segue 연결(각 Segue는 identifier로 이름을 구분할 수 있다)**

![Menual Segue1](https://github.com/1000JI/TIL/blob/master/picture/MenualSegue3.png)    

![Menual Segue2](https://github.com/1000JI/TIL/blob/master/picture/MenualSegue.png)

#### **2. A에서 만들어준 performManualSegue 메소드와 연결**

![Menual Segue3](https://github.com/1000JI/TIL/blob/master/picture/MenualSegue2.png)

