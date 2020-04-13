

## 2020년 04월 13일(월)

### Study Goal
1. Conditional Statements
2. Tuples
3. Loops
4. Control Transfer

***

### 1. Conditional Statements

#### IF Statments

``` Swift
/*
if <#condition#> {
	<#code#>
}

if <#condition#> {
	<#statements#>
} else {
	<#statements#>
}

- condition 은 Bool 값 (true, false)
*/
```

- if ~ else if와 if 문을 2개 하는 것과 차이점?
	* if ~ else if는 첫 if문에서 true가 나와 {}가 실행되었다면 밑에 있는 else if를 실행하지 않음. 반대로 if문 2개는 2개 모두 실행함.

``` Swift 
// IF Basic
var number = 9
if number < 10 {
	print("10보다 작다")
} else if number < 20 {
	print("20보다 작다")
}
```

***

#### Switch Statements
- switch 문은 가능한 모든 사례를 반드시 다루어야 함 (Switch must be exhaustive)

``` Swift
// Switch Basic
let alphabet: Character = "a"

switch alphabet {
case "a":
	print("The first letter of the alphabet")
case "z":
	print("The last letter of the alphabet")
default:
	break
//  print("Some other character")
}
```

- Interval Matching
``` Swift
let approximateCount = 30

switch approximateCount {
case 0...50:
	print("0 ~ 50")
case 51...100:
	print("51 ~ 100")
default:
	print("Something else")
}
```

``` Swift
let temperatureInFahrenheit = 86

switch temperatureInFahrenheit {
case ...32:
    print("It's very cold. Consider wearing a scarf.")
case 86...:
	print("It's really warm. Don't forget to wear sunscreen.")
default:
	print("It's not that cold. Wear a t-shirt.")
}
```

- if문은 콤마(,)가 And(&&)연산인 것과 반대로 switch문은 콤마(,)가 Or(||) 연산
``` Swift
let someCharacter: Character = "e"

switch someCharacter {
case "a", "e", "i", "o", "u":
	print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
       "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
	print("\(someCharacter) is a consonant")
default:
	print("\(someCharacter) is not a vowel or a consonant")
}
```

- **Value binding**
``` Swift
let somePoint = (9, 0)

switch somePoint {
case (let distance, 0), (0, let distance):
	print("On an axis, \(distance) from the origin")
default:
	print("Not on an axis")
}
```

- **where clause**
``` Swift
let anotherPoint = (1, -1)
switch anotherPoint {
case let (x, y) where x == y:
	print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
	print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
	print("(\(x), \(y)) is just some arbitrary point")
}
```

``` Swift
// 어떤 숫자가 주어졌을 때 짝수인지 홀수인지 출력 (switch의 where 절 이용)
let inputNumber = 5

switch inputNumber {
case let x where x.isMultiple(of: 2):
	print("짝수입니다.)
default:
	print("홀수입니다.)
}
```

- **fallthrough** : 밑에 있는 것 까지 실행하려면 쓰는
``` Swift
// fallthrough

print("\n---------- [ fallthrough ] ----------\n")
let integerToDescribe = 3
var description = "The number \(integerToDescribe) is"

switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
	description += " a prime number, and also"
default:
	description += " an integer."
}
print(description)
```

***

#### guard statement
``` Swift
/*
if <#condition#> {
	<#code#>
} else if <#condition#> {
	<#code#>
}


// - 특정 조건을 만족하면 해당 분기문 실행
guard <#condition#> else {
	<#code#>
}

// - 조건에 맞지 않으면 바로 종료.
// - 들여쓰기 중첩 방지
*/
```

- Guard Example
``` Swift
//func update(age: Int) {
//  if 1...100 ~= age {
//    print("Update")
//  }
//}

//func update(age: Int) {
//  switch age {
//  case 1...100: print("Update")
//  default: break
//  }
//}

func update(age: Int) {
	guard 1...100 ~= age else { return }
	print("Update")
}
```
> 1...100 ~= age : ~= -> age가 1...100 안에 포함이 되는지 확인할 때 씀


***


### Tuples
- Unnamed Tuple
``` Swift
let number: Int = 10

let threeNumbers: (Int, Int, Int) = (1, 2, 5)

threeNumbers.0
threeNumbers.1
threeNumbers.2

var threeValues: (Int, Double, String) = (10,  100.0,  "이름")
```

- Decomposition
``` Swift
let numbers = threeNumbers // 1, 2, 5

let (first, second, third) = threeNumbers // 1, 2, 5

let (_, second1, third1) = threeNumbers // _, 2, 5
```

- Named Tuple
``` Swift
let iOS = (language: "Swift", version: "5")


func 튜플(a: Int, b: (Int, Int)) -> (first: Int, second: Int) {
	return (a + b.0,  a + b.1)
}


let result = 튜플(a: 10, b: (20, 30))
// result.first = 30, result.second = 40
```


- Comparison Operators
	* Tuple 은 7개 미만 요소에 대한 비교 연산자가 포함되어 있음
	* 7개 이상의 요소를 비교하기 위해서는 비교 연산자를 직접 구현해야 함
	* **6개** 까지 쓸 수 있음

Q. 다음 튜플 비교 연산에 대한 결과는?
```
(1, "zebra") < (2, "apple"): true(1 < 2)
(3, "apple") > (3, "bird"): false("apple" < "bird"
("blue", 1) > ("bluesky", -1): false("blue" < "bluesky")
("일", 1) > ("이", 2.0): true("일" > "이")(ㅇ + ㅣ + ㄹ)

(1, "zebra") < ("2", "apple"): error(같은 타입과 비교가 안됨)
("blue", false) < ("purple", true): error(false와 true는 비교가 안됨)
```

- Tuple Matching
``` Swift
// 순서 유의
let somePoint = (1, 0)

switch somePoint {
case (0, 0):
	print("\(somePoint) is at the origin")
case (_, 0):
	print("\(somePoint) is on the x-axis")
case (0, _):
	print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
	print("\(somePoint) is inside the box")
default:
	print("\(somePoint) is outside of the box")
}
```


### Dictionary Enumeration
- Key와 Value로 한쌍
- 순서가 없음

``` Swift
let fruits = ["A": "Apple", "B": "Banana", "C": "Cherry"]

for element in fruits {
	// 어떤 식으로 출력해야 할까요?
	print(element.0, element.1) // Unnamed Tuples
	print(element.key, element.value) // Named Tuples
}
```

***

### 2. Loops

#### For-In Loops
- Basic For Loops
``` Swift
for index in 1...4 {
	print("\(index) times 5 is \(index * 5)")
}

// Wildcard Pattern

for _ in 0...3 {
	print("hello")
}

for chr in "Hello" {
	print(chr, terminator: " ") // 기본 값(\n)
}
print()

let list = ["Swift", "Programming", "Language"]
for str in list {
	print(str)
}
```

Q1) for 문을 이용하여 3 의 10 제곱에 대한 결과값을 표현하는 코드 구현
``` Swift
var threeSqure = 1
for _ in 1...10 {
	threeSqure *= 3
}
print("3 to the power of 10 is \(threeSqure))
```

Q2) for 문을 이용하여 10부터 1까지 내림차순으로 출력하는 코드 구현
``` Swift
for index in 0..<10 {
    print(10 - index, terminator: " ")
}

// OR

for index in (1...10).reversed() {
	print(index)
}
```


#### While Loops
- 조건이 거짓이 될 때까지 일련의 명령문 수행
- 첫 번째 반복이 시작되기 전에 반복 횟수를 알지 못할 때 많이 사용

- **While**
``` Swift
/*
while <#condition#> {
	<#code#>
}
// - 루프를 통과하는 각 패스의 시작 부분에서 조건을 평가
*/
```

Q1) 2 ~ 9 사이의 숫자를 입력받아 해당 숫자에 해당하는 구구단 내용을 출력하는 함수
``` Swift
print("---[resultMulti]---")
func resultMulti(_ inputNumber: Int) {
    var index = 1
	
	while index <= 9 {
		print("\(inputNumber) * \(index) = \(inputNumber * index)")
		index += 1
	}
}
resultMulti(5)
```

- **repeat ~ while**
	* 루프를 통과하는 각 패스의 끝 부분에서 조건을 평가
	* 다른 언어에서는 do - while 문으로 많이 사용
``` Swift
func printMultiplicationTable1(for number: Int) {
	var i = 1
    repeat {
		print("\(number) * \(i) = \(number * i)")
		i += 1
	} while i <= 9
}

printMultiplicationTable1(for: 3)
```

Q2) 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 그 합을 반환하는 함수
``` Swift
func sumOfAllNumbers(to number: Int) -> Int {
    var count = 1
	var sum = 0
	
	repeat {
		sum += count
		count += 1
	} while count <= number
	print("Sum of [1 ~ \(number)] = \(sum)")
	return sum
}
sumOfAllNumbers(to: 10)
```

***

### 3. Control Transfer Statement
- 특정 코드에서 다른 코드로 제어를 이전하여 코드 실행 순서를 변경하는 것
- Swift 에는 5가지 키워드 사용
	1. **continue**: 현재 반복문의 작업을 중단하고 다음 반복 아이템에 대한 작업 수행
	2. **break**: break가 포함된 해당 제어문의 흐름을 즉각 중단 (반복문, switch 문)
	3. **fallthrough**: switch 문에서 매칭된 case 의 실행이 종료된 후 그 다음의 case 까지 실행
	4. **return**: 함수를 즉시 종료하고, return type에 해당하는 자료를 반환
	5. **throw**


***

### Practice
#### Conditional Statements
1. 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)
``` Swift
func inputAndReturnGrade(grade inputData: Double) -> String {
    switch inputData {
	case 4.5:
		return "A+"
	case 4.0..<4.5:
		 return "A"
    case 3.5..<4.0:
        return "B+"
	case 3.0..<3.5:
		return "B"
	case 2.5..<3.0:
		return "C+"
	case 2.0..<2.5:
		return "C"
	default:
		return "F"
	}
}

inputAndReturnGrade(grade: 4.3)
```
2. 특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb", ...)
``` Swift
func returnCalendarEnglish(month: Int) -> String {
    switch month {
	case 1:
		return "Jan"
	case 2:
		return "Feb"
	case 3:
		return "Mar"
	case 4:
		return "Apr"
	case 5:
		return "May"
	case 6:
		return "Jun"
	case 7:
		return "Jul"
	case 8:
		return "Aug"
	case 9:
		return "Sep"
	case 10:
		return "Oct"
	case 11:
		return "Nov"
	case 12:
		return "Dec"
	default:
		return "Error"
	}
}
print(returnCalendarEnglish(month: 12))
```
3. 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수((switch where clause 를 이용해 풀어볼 수 있으면 해보기))


#### Loops
1. 자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
2. 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
3. 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수

#### Control Transfer
1. 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되, 그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수
2. 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수

