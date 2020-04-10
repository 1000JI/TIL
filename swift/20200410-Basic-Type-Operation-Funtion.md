
## 2020년 04월 10일(금)
[공식 Swift 홈페이지 문서](https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html#)

***

### Playground

- 단축키
	* Command + Shift + Enter : 전체 실행
	* Shift + Enter : 해당 라인까지 실행

***

- 출력문
``` Swift
var num = 1
print(num)

print("숫자 num")
print("숫자 \(num)")

print("숫자", num) // 숫자 1
print("숫자 " + String(num)) // 숫자 1
```

***

- 주석
``` Swift
/*
 주석 (Comment)
	- //  : 한 줄 주석 , Command + /
	- /// : 한 줄 주석 + Quick Help Markup , Command + Option + /
	- /* */ : 멀티 라인 주석

	1. 빠르게 특정 부분의 코드를 비활성화
	2. 협업 또는 인계 시 이해를 돕기 위해
	3. 자기 자신을 위해
	4. 문서화

	- 주석 없이도 쉽게 이해할 수 있을 만한 코드를 짜는 것이 선행 과제
 */
```

***

- 상수와 변수
	1. 상수(Constants): 한 번 설정되면 값 변경 불가
	2. 변수(Variables): 설정한 값을 변경 가능
	3. 변수로 사용할 수 없는 이름
		1. 같은 스코프 범위 내에서 중복되는 이름
		2. 공백문자
		3. 수학 기호 (√, ∑ 등)
		4. 화살표 (→, ← 등)
		5. 숫자로 시작하는 이름 (시작 부분 외에는 사용 가능)

***

- Type
	1. Type Annotation: 변수 선언 시 사용될 자료의 타입을 **명확하게 지정**하는 것
```
let year: Int = 2019
```
	
	2. Type Inference: 변수 선언 시 초기화로 사용되는 값의 타입을 통해 변수의 **타입을 추론**하여 적용하는 것
```
var weight = 6.4 //Double
```

***

- Literals & Types
	* 소스코드에서 고정된 값으로 표현되는 문자 (데이터) 그 자체
	* 정수 / 실수 / 문자 / 문자열 / 불리언 리터럴 등

``` Swift
// 10진수
let decimalInteger = 17
// 2진수
let binaryInteger = 0b10001
type(of: binaryInteger)

// 8진수
let octalInteger = 0o21
// 16진수
let hexadecimalInteger = 0x11

var bigNumber = 1_000_000_000
bigNumber = 1_0000_0000_0000
bigNumber = 000_001_000_000_000
bigNumber = 0b1000_1000_0000
bigNumber = 0xAB_00_FF_00_FF
```

***

- Integer Types
	* 8-bit : Int8, UInt8
	* 16-bit : Int16, UInt16
	* 32-bit : Int32, UInt32
	* 64-bit : Int64, UInt64(Present, Int)
	* Int8 -> -2^7 ~ 2^7 - 1(-128 ~ 127)
	* UInt8 -> 0 ~ 2^8 - 1(0 ~ 255)
	* Int32.max + 1(x), Int64.max + 1(x)
		+ **Overflow Error**

***

- Overflow Operators
	* Int8.max &+ 1 => -128
		+ 01111111 &+ 1 => 10000000

***

- Floating-point Literal
	* Double - 최소 소수점 이하 15 자리수 이하의 정밀도(Basic)
	* Float - 최소 소수점 이하 6 자리수 이하의 정밀도
	* 부동 소수점이므로 소수점 이하의 정밀도는 변경 될 수 있음

``` Swift
MemoryLayout<Double>.size
Double.greatestFiniteMagnitude
Double.leastNormalMagnitude
```

***

- Character Literal
``` Swift
MemoryLayout<String>.size		//16
MemoryLayout<Character>.size	//16
```

***

- Typealias: 문맥상 더 적절한 이름으로 기존 타입의 이름을 참조하여 사용하고 싶을 경우 사용
``` Swift
// typealias <type name> = <type expression>

typealias Name = String

let name: Name = "Tory"
let nameString: String = "Tory"

type(of: name)
type(of: nameString)
```

***

- Type Conversion
``` Swift
let height = Int8(5)
let width = 10
//let area = height * width
//print(area)


let h = Int8(12)
//let x = 10 * h
//print(x)
```
	* Q) 10 이 Int8로 자동변환 됨

***

- Terminology
``` Swift
// Unary Operator (단항 연산자)
-a

// Prefix (전위 표기법)
-a

// Postfix (후위 표기법)
c!


// Binary Operator (이항 연산자)
a + b

// Infix (중위 표기법)
a + b


// Ternary Operator (삼항 연산자)
// Swift 에서 삼항 연산자는 단 하나
a > 0 ? "positive" : "zero or negative"

//-------------------------------

// 아래 3개의 케이스에서 returnTrue 메서드는 각각 몇 번씩 호출될까?
// 우선순위 : && > ||

print("\n---------- [ Case 1 ] ----------\n")
returnTrue() && returnTrue() && false || true && returnTrue()
// 3번 호출 1, 2, 3번째

print("\n---------- [ Case 2 ] ----------\n")
returnTrue() && false && returnTrue() || returnTrue()
// 2번 호출 1, 3번째

print("\n---------- [ Case 3 ] ----------\n")
returnTrue() || returnTrue() && returnTrue() || false && returnTrue()
// 1번 호출 1번째
```

***

- Range Operators
``` Swift
//               0       1        2       3
//let names = ["Anna", "Alex", "Brian", "Jack"]
names[2...] // "Brain", "Jack"
names[...2] // "Anna", "Alex", "Brain"
names[..<2] // "Anna", "Alex"

//-----------------

//  순서를 반대로 적용하는 방법
for index in (1...5) {
  print("\(index) times 5 is \(index * 5)")
}

// 1) reversed
for index in (1...5).reversed() {
	print("\(index) times 5 is \(index * 5)")
}
print()

// 2) stride
for index in stride(from: 5, through: 1, by: -1) {
	print("\(index) times 5 is \(index * 5)")
}
print()

//----------------

// 참고
let range = 1...5
range.lowerBound   // 하한선
range.upperBound   // 상한선
```

***

- Function: 일련의 작업을 수행하는 코드 묶음을 식별할 수 있는 특정한 이름을 부여하여 사용하는 것
	* 유형
		+ Input 과 Output 이 모두 있는 것 (Function)
		+ Input 이 없고 Output 만 있는 것 (Generator)
		+ Input 이 있고 Output 은 없는 것 (Consumer)
		+ Input 과 Output 이 모두 없는 것

``` Swift
func functionName(parameterName: Type) -> ReturnType {
	//statements
}

// ex) Functions without return values
func say(number: Int) {
	print(number)
}

// ex) Functions with params and return values
func addNumbers(a: Int, b: Int) -> Int {
	return a + b
}
addNumbers(a: 10, b: 20)


// ex) Omit Return
func addTwoNumbers(a: Int, b: Int) -> Int {
	a + b//  return a + b   // 동일
}
addTwoNumbers(a: 1, b: 2)
```

- Argument Label
``` Swift
/*
 func functionName(<#parameterName#>: <#Type#>) {}
*/

func someFunction(first: Int, second: Int) {
	print(first, second)
}
someFunction(first: 1, second: 2)


/*
func functionName(<#argumentName#> <#parameterName#>: <#Type#>) {}
*/

// Specifying Argument Labels
func multiplyNumber(lhs num1: Int, rhs num2: Int) {
	num1 + num2
}
multiplyNumber(lhs: 10, rhs: 10)


// Omitting Argument Labels
func someFunction(_ first: Int, second: Int) {
	print(first, second)
}

//someFunction(first: 1, second: 2)
someFunction(1, second: 2)
```

***

- Default Parameter Values
``` Swift
func functionWithDefault(param: Int = 12) -> Int {
  return param
}

functionWithDefault(param: 6)
// param is 6

functionWithDefault()
// param is 12
```

***

- Question
1. 이름을 입력 값으로 받아서 출력하는 함수 (기본 형태)
``` Swift
func printName(inputName: String) {
	print(inputName)
}
printName(inputName: "홍길동")
```

2. 나이를 입력 값으로 받아서 출력하는 함수 (Argument Label 생략)
``` Swift
func printAge(_ inputAge: Int) {
	print(inputAge)
}
printAge(29)
```

3. 이름을 입력 값으로 받아 인사말을 출력하는 함수 (Argument Label 지정)1. 
``` Swift
func sayToHello(to inputName: String) {
	print("HI! How are you? \(inputName)?")
}
sayToHello(to: "임둘리")
```

***

- Variadic Parameters: 가변 인자
``` Swift
func arithmeticAverage(_ numbers: Double...) -> Double {
	var total = 0.0
	for number in numbers {
	total += number
	}
	return total / Double(numbers.count)
}

arithmeticAverage(1, 2, 3)
arithmeticAverage(1, 2, 3, 4, 5)
arithmeticAverage(3, 8.25, 18.75)

//----------------

//func arithmeticAverage2(_ numbers: Double..., _ last: Double) {
//  print(numbers)
//  print(last)
//}
//
//arithmeticAverage2(1, 2, 3, 5)


// 가변인자 뒤에 변수를 쓸 경우 argument 생략이 불가능하다
// 따라서 _ last: Double이 아닌 last: Double을 써야한다.
//func arithmeticAverage3(_ numbers: Double..., and last: Double) {
//  print(numbers)
//  print(last)
//}
//
//arithmeticAverage3(1, 2, 3, and: 5)
```

***

- Nested Functions
``` Swift
func chooseFunction(plus: Bool, value: Int) -> Int {
	func plusFunction(input: Int) -> Int { input + 1 }
	func minusFunction(input: Int) -> Int { input - 1 }

	if plus {
		return plusFunction(input: value)
	} else {
		return minusFunction(input: value)
	}
}

var value = 4
chooseFunction(plus: true, value: value)
chooseFunction(plus: false, value: value)
```




