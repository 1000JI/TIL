# 2020년 05월 05일(화)

## 기본 형식

``` swift
enum VendingMachineError: Error  {
  case invalidInput
  case insufficientFunds(moneyNeeded: Int)
  case outOfStock
}

class VendingMachine {
  var deposited: Int = 0

  func receiveMoney(_ money: Int) throws {
    guard money > 0 else {
       throw VendingMachineError.invalidInput
    }
    self.deposited += money
    print("\(money)원 받음")
  }
}

let machine: VendingMachine = VendingMachine()

do {
   try machine.receiveMoney(0)
}  catch VendingMachineError.invalidInput {
  print("입력이 잘못되었습니다")
} catch VendingMachineError.insufficientFunds(let moneyNeeded) {
  print("\(moneyNeeded)원이 부족합니다")
} catch VendingMachineError.outOfStock {
  print("수량이 부족합니다")
}
```

