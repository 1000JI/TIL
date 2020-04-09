
###### 최초작성일: 2020. 03. 04.
```
사이트 내용 중 헷갈리거나 다시 정리할 필요가 있는 부분만 작성했습니다.   
더 자세한 내용을 알고 싶다면 하단 참고 사이트를 참조 하시길 바랍니다.
```

# 고급(?) 흐름 제어(Advanced Control Flow)
> ###### Swift 4.2, iOS 12, Xcode 10 기준

***
## 1. 범위(Ranges)

### 1-1. closed range
``` Swift
let closedRange = 0...5 // 0, 1, 2, 3, 4, 5
```

### 1-2. half-open range
``` Swift
let halfOpenRange = 0..<5 // 0, 1, 2, 3, 4
```


***
## 2. For Loops
### 2-1. 사용법
``` Swift
for <CONSTANT> in <RANGE> {
  <LOOP CODE>
}
```

### 2-2. 적용
``` Swift
let count = 10
var sum = 0

for i in 1...count {
  sum += i
}
```

### 2-3. 응용(상수 없이 횟수만 실행할 경우)
``` Swift
let count = 10
var sum = 1
var lastSum = 0

for _ in 0..<count {
  let temp = sum
  sum = sum + lastSum
  lastSum = temp
}
```

### 2-4. 응용(반복 조건문)
``` Swift
let count = 10
var sum = 0
for i in 1...count where i % 2 == 1 {
  sum += i
}
```

***
## 문제 1. for Loops Example
![example1](https://koenig-media.raywenderlich.com/uploads/2016/09/first_board_example-496x500.png)
``` Swift
var sum = 0

for row in 0..<8 {
  if row % 2 == 0 {
    continue
  }

  for column in 0..<8 {
    sum += row * column
  }
}
```

## 문제 2. for Loops Example
![example2](https://koenig-media.raywenderlich.com/uploads/2016/09/second_board_example-496x500.png)

```Swift
var sum = 0

rowLoop: for row in 0..<8 {
  columnLoop: for column in 0..<8 {
    if row == column {
      continue rowLoop
    }
    sum += row * column
  }
}
```

> **labeled statements** 라고 해서, 각 반복문에 이름을 붙여 ```break``` 또는 ```continue``` 를 사용 할 수 있다.   
기본적으로는 가장 안쪽 반복문에만 적용된다.


***
## 3. Switch Statements
기초 사용법은 패스~~!!!

### 3-1. 적용
```Swift
let hourOfDay = 12
let timeOfDay: String

switch hourOfDay {
case 0...5:
  timeOfDay = "Early morning"
case 6...11:
  timeOfDay = "Morning"
case 12...16:
  timeOfDay = "Afternoon"
case 17...19:
  timeOfDay = "Evening"
case 20..<24:
  timeOfDay = "Late evening"
default:
  timeOfDay = "INVALID HOUR!"
}
```

### 3-2. 응용(let-where)
``` Swift
let number = 10

switch number {
case let x where x % 2 == 0:
  print("Even")
default:
  print("Odd")
}
```

### 3-3. 응용(_-where)
``` Swift
let number = 10

switch number {
case _ where number % 2 == 0:
  print("Even")
default:
  print("Odd")
}
```

### 3-4. 응용(부분매칭, ```partial matching```)
``` Swift
let coordinates = (x: 3, y: 2, z: 5)

switch coordinates {
case (0, 0, 0):
  print("Origin")
case (let x, 0, 0):
  print("On the x-axis at x = \(x)")
case (0, let y, 0):
  print("On the y-axis at y = \(y)")
case (0, 0, let z):
  print("On the z-axis at z = \(z)")
case let (x, y, z):
  print("Somewhere in space at x = \(x), y = \(y), z = \(z)")
}
```

## 질문 내용)

1. var와 let의 차이점에 대해 서술하고 그 예제 코드 작성
    * var: 변수, 값을 바꿀 수 있다. Ex) 시간, 통장 금액 등
    * let: 상수, 선언 할 때 값을 정하면 변경 할 수 없다. Ex) API 주소, 이름 등
    ``` Swift
    var changeValue : Int = 50
    changeValue = 70  // OK

    let fixValue : Int = 33
    fixValue = 44 // FAIL
    ```

2. 반복문(Loop)의 종류와 1~10까지 출력하는 코드 작성
    ``` Swift
    // FOR 문
    for number in 1...10 {
      print(number)
    }

    // While 문
    var number : Int = 1

    while number<=10 {
      print(number)
      number += 1
    }
    ```
    
3. 타입 추론(Type Inference)이란?
    - 변수를 선언 할 때, 타입을 지정하지 않아도 초기화 되는 값에 따라 변수의 타입을 정해지는 것
    - ```var doubleValue = 50.4  // Double``` 또는 ```var stringValue = "TEST" // String```
    
4. 논리연산자(Boolean Logic) 인 AND(&&) 와 OR(||) 로 나올 수 있는 경우의 수 4가지
    - AND(&&)
    ``` Swift
    true  && true   = true
    true  && false  = false
    false && true   = false
    false && false  = false
    ```
    
    - OR(||)
    ``` Swift
    true  || true   = true
    true  || false  = true
    false || true   = true
    false || false  = false
    ```

***
***
## 참고 사이트
> 1. Swift Tutorial Part 1: Expressions, Variables and Constants
>> [https://www.raywenderlich.com/6338-swift-tutorial-part-1-expressions-variables-and-constants](https://www.raywenderlich.com/6338-swift-tutorial-part-1-expressions-variables-and-constants)
> 2. Swift Tutorial Part 2: Types and Operations
>> [https://www.raywenderlich.com/6364-swift-tutorial-part-2-types-and-operations](https://www.raywenderlich.com/6364-swift-tutorial-part-2-types-and-operations)
> 3. Swift Tutorial Part 3: Flow Control
>> [https://www.raywenderlich.com/965-swift-tutorial-part-3-flow-control](https://www.raywenderlich.com/965-swift-tutorial-part-3-flow-control)

