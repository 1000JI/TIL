
###### 최초작성일: 2020. 03. 04.
```
사이트 내용 중 헷갈리거나 다시 정리할 필요가 있는 부분만 작성했습니다.   
더 자세한 내용을 알고 싶다면 하단 참고 사이트를 참조 하시길 바랍니다.
```

# 흐름 제어(Flow Control)
> ###### Swift 4.2, iOS 12, Xcode 10 기준

***
## 1. 시작하기
이 부분에 ```Bool 연산자```가 나오긴 하는데.... 대부분 아는 내용이라 Pass!!   
간단하게 소스 몇 줄만 추가
``` Swift
let doesOneEqualTwo = (1 == 2)
let doesOneNotEqualTwo = (1 != 2)
let alsoTrue = !(1 == 2)
let isOneGreaterThanTwo = (1 > 2)
let isOneLessThanTwo = (1 < 2)
```
요런식으로 사용 가능함. 각 상수는 ```타입추론```으로 ```Bool``` 타입으로 된다.   
```==``` or ```!=``` or ```>=``` or ```<=``` or etc...

***
## 2. Boolean Logic
```AND``` 연산자와 ```OR``` 연산자가 있다.   
사용 방법은 이렇다.
``` Swift
let and = true && true // AND
let or = true || false // OR
```

### 응용
``` Swift
let andTrue = 1 < 2 && 4 > 3
let andFalse = 1 < 2 && 3 > 4

let orTrue = 1 < 2 || 3 > 4
let orFalse = 1 == 2 || 3 == 4
```

### 추가 응용
``` Swift
let andOr = (1 < 2 && 3 > 4) || 1 < 4

1. (1 < 2 && 3 > 4) || 1 < 4
2. (true && false) || true
3. false || true
4. true
```

> 위 처럼 된다고 보면 된다.

***
## 3. String Equality
문자열 같은 경우 알파벳 순으로 나오는지 확인한다.(뒤쪽 일수록 큼)
```Swift
let order = "cat" < "dog" // TRUE "c" < "d"
```

***
## 4. IF 문
간단한 사용법만~~~ XD
``` Swift
let hourOfDay = 12
let timeOfDay: String

if hourOfDay < 6 {
  timeOfDay = "Early morning"
} else if hourOfDay < 12 {
  timeOfDay = "Morning"
} else if hourOfDay < 17 {
  timeOfDay = "Afternoon"
} else if hourOfDay < 20 {
  timeOfDay = "Evening"
} else if hourOfDay < 24 {
  timeOfDay = "Late evening"
} else {
  timeOfDay = "INVALID HOUR!"
}
print(timeOfDay)
```
> ```"Afternoon"```

## 5. Short Circuiting
AND(```&&```) 또는 OR(```||```)을 쓸 때, 복잡한 데이터식을 간편하게 쓸 수 있다.
``` Swift
if 1 > 2 && name == "Matt Galloway" {
  // '1 > 2' 가 False 기 때문에, 뒤가 True 여도 결과는 False!! 두번째 조건은 검사하지 않는다.
}

if 1 < 2 || name == "Matt Galloway" {
  // 이 경우도 '1 < 2'에서 이미 True 기 때문에, 뒤가 False 여도 결과는 True!!! 따라서 두번째 조건은 검사하지 않는다.
}
```

***
## 6. Encapsulating Variables(캡슐화 변수?)
```if```문 에서 변수를 새로 생성하면 사용 범위가 다르다.

```Swift
var hoursWorked = 45

var price = 0
if hoursWorked > 40 {
  let hoursOver40 = hoursWorked - 40
  price += hoursOver40 * 50
  hoursWorked -= hoursOver40
}
price += hoursWorked * 25

print(price) // 1250
```

> 위 소스에서
``` Swift
print(hoursOver40)
```
> 를 사용하면 ```Use of unresolved identifier 'hoursOver40'``` 에러가 발생한다.   
> 즉, ```hoursOver40```은 생성한 { } 안에서만 사용이 가능하며, { }가 종료되면 더이상 사용 할 수 없습니다.


***
## 7. 삼항 연산자(The Ternary Conditional Operator)
### 7-1. 사용전(IF 문)
``` Swift
let a = 5
let b = 10

let min: Int
if a < b {
  min = a
} else {
  min = b
}

let max: Int
if a > b {
  max = a
} else {
  max = b
}
```

### 7-2. 사용 방법(기본)
``` Swift
(<CONDITION>) ? <TRUE VALUE> : <FALSE VALUE>
```

### 7-3. 적용
``` Swift
let a = 5
let b = 10

let min = a < b ? a : b // a(5)
let max = a > b ? a : b // b(10)
```


***
## 8. 조건문(while 문)
### 8-1. 사용 방법(기본)
``` Swift
while <CONDITION> {
  <LOOP CODE>
}
```

### 8-2. 적용
``` Swift
var sum = 1

while sum < 1000 {
  sum = sum + (sum + 1)
}
```

***
## 9. 조건문(repeat-while 문)
### 9-1. 사용 방법(기본)
``` Swift
repeat {
  <LOOP CODE>
} while <CONDITION>
```

### 9-2. 적용
``` Swift
var sum = 1

repeat {
  sum = sum + (sum + 1)
} while sum < 1000
```

> 반복문을 강제로 빠져나올 땐 ```break```를 쓰면 된다.

***
### 문제) 피보나치 배열
- Given a number n, calculate the n-th Fibonacci number. (Recall Fibonacci is 1, 1, 2, 3, 5, 8, 13, ... Start with 1 and 1 and add these values together to get the next value. The next value is the sum of the previous two. So the next value in this case is 8+13 = 21.)
> N번째 피보나치 수 계산

``` Swift
input N

var prevNum = 1
var nextNum = 1

if (N == 1) || (N == 2) {
  print(nextNum)
} else {
  var countNum = 2
  while countNum < N {
    let sumTemp = prevNum + nextNum
    prevNum = nextNum
    nextNum = sumTemp
    
    countNum += 1
  }
  print(nextNum)
}
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
