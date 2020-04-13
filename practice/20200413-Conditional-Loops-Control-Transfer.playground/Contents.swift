import Foundation

// ### 강의 중 Practice
// #### Conditional Statements
// 1. 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)
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
print("grade: \(inputAndReturnGrade(grade: 2.5))")


//2. 특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb", ...)
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

// 3. 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수((switch where clause 를 이용해 풀어볼 수 있으면 해보기))
func judgePositiveNumber(_ first: Int, _ second: Int, _ third: Int) -> Bool {
    switch (first, second, third) {
    case let (x, y, z) where (x * y * z) > 0:
        return true
    default:
        return false
    }
}
judgePositiveNumber(2, 2, -3)


// -----------------------------------------------------------------------
// #### Loops
// 1. 자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
func calcFactorial(_ number: Int) -> Int {
    var result = 1
    
    for index in 1...number {
        result *= index
    }
    return result
}
print(calcFactorial(4))

// 2. 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
func calcSquare(number: Int, square: Int) -> Int {
    var result = 1
    for _ in 1...square {
        result *= number
    }
    return result
}
print(calcSquare(number: 3, square: 3))

//3. 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
func calcSumDigit(_ index: Int) -> Int {
    var result = 0
    var tempIndex = index
    
    while tempIndex > 0 {
        result += (tempIndex % 10)
        tempIndex /= 10
    }
    return result
}
print(calcSumDigit(1234))

// -----------------------------------------------------------------------
// #### Control Transfer
// 1. 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되, 그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수
func sumOfNumberLimit2000(_ index: Int) -> Int {
    var result = 0
    for number in 1...index {
        result += number
        if result > 2000 {
            return result
        }
    }
    return result
}
print(sumOfNumberLimit2000(10))

// 2. 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수
func calcSum1To50() -> Int {
    var result = 0
    for index in 1...50 {
        if (20...30) ~= index {
            continue
        }
        result += index
    }
    return result
}
print("calcSum1To50() : \(calcSum1To50())")


// -----------------------------------------------------------------------
// ### 강의 후 Practice [ 과제 ]
/*
 1. 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
    (1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)
 */
func combineTwoNumbers(_ number1: Int, _ number2: Int) -> Int {
    var tempNumber2 = number2
    var numberOfCount = 1
    
    while tempNumber2 > 0 {
        numberOfCount *= 10
        tempNumber2 /= 10
    }
    return (number1 * numberOfCount) + number2
}
print("combineTwoNumbers: \(combineTwoNumbers(6, 100))")

/*
 2. 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
 */
func stirngCompareFunction(_ inputStringA: String, _ inputStringB: String) {
    guard inputStringA == inputStringB else { print("두 문자열은 다릅니다."); return }
    print("두 문자열은 같습니다.")
}
stirngCompareFunction("string", "string")

/*
 3. 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
 */
func factorizationPrint(to inputNumber: Int) {
     print("\(inputNumber)의 약수는", terminator: " ")
    for index in 1...inputNumber {
        if (inputNumber % index) == 0 {
            print(index, terminator: " ")
        }
    }
    print("입니다.")
}
factorizationPrint(to: 20)

/*
 4. 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
 */
func printCommonMultiple(_ Multiple1: Int, _ Multiple2: Int) {
    print("\(Multiple1)와 \(Multiple2)의 공배수는 ", terminator: " ")
    for index in 1...100 {
        if ((index % Multiple1) == 0) && ((index % Multiple2) == 0) {
            print(index, terminator: " ")
        }
    }
    print("입니다.")
}
printCommonMultiple(3, 5)


// ### challenge Practice
/*
 1. 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수
 */
let judgeIndex = 13
func judgePrimeNumber(number: Int) -> String {
    var judgeCount = 0
    
    for index in 1...number {
        if (number % index) == 0 {
            judgeCount += 1
        }
    }
    return judgeCount <= 2 ? "소수입" : "소수가 아닙"
}
print("\(judgeIndex)는 \(judgePrimeNumber(number: judgeIndex))니다.")

/*
 2. 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
 참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
 e.g.  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89 ....
 함수 호출 시 입력받은 숫자가 4인 경우 피보나치 수열의 4번째 위치인 2 출력
 */
func searchFibonacciSequence(index: Int) -> Int {
    var prevNumber = 0
    var presentNumber = 1
    
    switch index {
    case 1:
        return 0
    case 2:
        return 1
    default:
        for _ in 3...index {
            let sumTemp = prevNumber + presentNumber
            prevNumber = presentNumber
            presentNumber = sumTemp
        }
        return presentNumber
    }
}
let fibonacciIndex = 4
print("피보나치 수열 중 \(fibonacciIndex)번째의 값은 \(searchFibonacciSequence(index: fibonacciIndex))입니다.")

/*
 3. 정수를 입력받아 윤년(2월 29일이 있는 해)인지 아닌지 판단하는 함수
 (공식 - 매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
 ex) 윤년O 예시 - 160, 204, 400, 1996, 2000, 2800
     윤년X 예시 - 200, 300, 500, 600, 1900, 2100
 */
func judgeLeapYear(year: Int) -> String {
    switch year {
    case let x where (x % 4) == 0 && (x % 400) == 0 :
        return "윤년입니다."
    case let x where (x % 4) == 0 && (x % 100) == 0 :
        return "윤년이 아닙니다."
    case let x where (x % 4) == 0 :
        return "윤년입니다."
    default:
        return "윤년이 아닙니다."
    }
    
//    if (year % 4) == 0 && (year % 400) == 0 {
//        return "윤년입니다."
//    } else if (year % 4) == 0 && (year % 100) == 0 {
//        return "윤년이 아닙니다."
//    } else if (year % 4) == 0 {
//        return "윤년입니다."
//    } else {
//        return "윤년이 아닙니다."
//    }
}
print(judgeLeapYear(year: 2000))


