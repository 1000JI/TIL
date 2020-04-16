
# 오류처리(error handling)
## 1. 오류처리
- 오류(Error)는 **Error** 라는 프로토콜을 준수하는 타입의 값을 통해 표현한다.
- **Error** 프로토콜은 빈 프로토콜이므로, 오류를 표현하기 위한 타입(***주로 열거형***)은 Error 프로토콜을 채택한다.
- Swift의 열거형은 오류의 종류를 나타내기에 적합하다.
- 연관 값을 통해 오류에 관한 부가 정보에 제공 할 수 있다.

## 2. 오류표현
- **Error 프로토콜** 과 **열거형** 을 통해서 오류를 표한한다.
``` Swift
enum VendingMachineError: Error {
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)
    case outOfStock
}
```

## 3. 함수에서 발생한 오류 던지기
``` Swift
class VendingMachine {
    let itemPrice: Int = 100
    var itemCount: Int = 5
    var deposited: Int = 0
    
    // 돈 받기 메서드
    func receiveMoney(_ money: Int) throws {
        
        // 입력한 돈이 0이하면 오류를 던집니다
        guard money > 0 else {
            throw VendingMachineError.invalidInput
        }
        
        // 오류가 없으면 정상처리를 합니다
        self.deposited += money
        print("\(money)원 받음")
    }
    
    // 물건 팔기 메서드
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
        
        // 원하는 아이템의 수량이 잘못 입력되었으면 오류를 던집니다
        guard numberOfItemsToVend > 0 else {
            throw VendingMachineError.invalidInput
        }
        
        // 구매하려는 수량보다 미리 넣어둔 돈이 적으면 오류를 던집니다
        guard numberOfItemsToVend * itemPrice <= deposited else {
            let moneyNeeded: Int
            moneyNeeded = numberOfItemsToVend * itemPrice - deposited
            
            throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }
        
        // 구매하려는 수량보다 요구하는 수량이 많으면 오류를 던집니다
        guard itemCount >= numberOfItemsToVend else {
            throw VendingMachineError.outOfStock
        }
        
        // 오류가 없으면 정상처리를 합니다
        let totalPrice = numberOfItemsToVend * itemPrice
        
        self.deposited -= totalPrice
        self.itemCount -= numberOfItemsToVend
        
        return "\(numberOfItemsToVend)개 제공함"
    }
}

// 자판기 인스턴스
let machine: VendingMachine = VendingMachine()

// 판매 결과를 전달받을 변수
var result: String?
```

## 4. 오류 처리
### <do-catch>
- 가장 표준적인 방법으로, 모든 오류 케이스에 대응하는 방법이다.
``` Swift
do {
    try machine.receiveMoney(0)
} catch VendingMachineError.invalidInput {
    print("입력이 잘못되었습니다")
} catch VendingMachineError.insufficientFunds(let moneyNeeded) {
    print("\(moneyNeeded)원이 부족합니다")
} catch VendingMachineError.outOfStock {
    print("수량이 부족합니다")
} // 입력이 잘못되었습니다
```

- ```switch```를 사용하여 오류를 분류 할 수 있다.
``` Swift
do {
    try machine.receiveMoney(300)
} catch /*(let error)*/ {
    
    switch error {
    case VendingMachineError.invalidInput:
        print("입력이 잘못되었습니다")
    case VendingMachineError.insufficientFunds(let moneyNeeded):
        print("\(moneyNeeded)원이 부족합니다")
    case VendingMachineError.outOfStock:
        print("수량이 부족합니다")
    default:
        print("알수없는 오류 \(error)")
    }
} // 300원 받음
```

- ```catch``` 구문 내부를 간략화 할 수 있다(케이스 별로 구분할 필요 없을 시).
``` Swift
do {
    result = try machine.vend(numberOfItems: 4)
} catch {
    print(error)
} // insufficientFunds(100)
```

- 또는, 오류처리 할 필요가 없다면 ```do```구문만 써도 무방하다.
``` Swift
do {
    result = try machine.vend(numberOfItems: 4)
}
```

### <try? 와 try!>
1. try?
    - 오류가 발생하면 결과 값을 ```nil```로 돌려 받을 수 있다.
    - 정상 동작 하게 되면 **옵셔널 타입** 으로 반환 값을 돌려 받는다.
    
    ``` Swift
    result = try? machine.vend(numberOfItems: 2)
    result // Optional("2개 제공함")

    result = try? machine.vend(numberOfItems: 2)
    result // nil
    ```
    
2. try!
    - 정상 동작 후 바로 결과값을 돌려받을 수 있으나, 오류 발생 시 **런타임 오류** 가 발생 할 수 있다.
    ``` Swift
    result = try! machine.vend(numberOfItems: 1)
    result // 1개 제공함

    //result = try! machine.vend(numberOfItems: 1)
    // 런타임 오류 발생!
    ```
    
3. 더 알아보면 좋을 개념
    - **rethrows**
    - **defer**
    


***
###### 참조&강의내용: [커넥트재단](https://www.edwith.org/boostcamp_ios/)
###### [애플 공식문서 - 오류처리](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)
***
