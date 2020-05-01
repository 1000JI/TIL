//: [Previous](@previous)

/*
 "Hello, World!" 문자열을 출력하기 위한 코드 작성
 */
print("Hello, World!")


/*
 2개의 정수를 입력 받아서 그 숫자들을 더한 뒤 결과를 정수로 반환하는 함수 작성
 */
private func addCalc(_ num1: Int, _ num2: Int) -> Int {
    return num1 + num2
}
addCalc(5, 6)


/*
 2개의 정수를 입력 받아 그 숫자들을 곱한 뒤 결과값을 문자열로 반환하는 함수 작성
 */
private func multiCalc(_ num1: Int, _ num2: Int) -> String {
    return "\(num1 * num2)"
}
multiCalc(6, 6)

/*
 주어진 숫자가 짝수인지 홀수인지 판단하는 함수 작성 (switch 문으로 해결)
 */
private func isOddOrEven(_ num: Int) -> String {
    switch num {
    case let odd where odd.isMultiple(of: 2):
        return "짝수"
    default:
        return "홀수"
    }
}
isOddOrEven(5)


/*
 Swift 3가지 다른 반복문 방식별로 각각 1부터 10까지 값을 더한 결과를 출력하는 코드 작성
 */
// For
var sumValue: Int = 0
var index: Int = 1

for i in 1...10 {
    sumValue += i
}
print(sumValue)

// While
sumValue = 0
while index <= 10 {
    sumValue += index
    index += 1
}
print(sumValue)

// Repeat ~ While
sumValue = 0
index = 1
repeat {
    sumValue += index
    index += 1
} while index <= 10
print(sumValue)


/*
 Swift 에서 사용하는 네이밍 컨벤션의 종류를 나열하고 그것이 언제 사용되는지,
 그리고 그 특징에 대해 설명
 */
/*
 Answer
 
 1. Pascal Case(Upper Camel Case)
    첫 글자가 대문자로 시작하며 이어지는 단어들의 첫 글자만 대문자로 시작한다.
    protocol, class, sturct, enum 등 이름에 사용된다.
    ex) Ractangle, SumValueCalc
 
 2. Camel Case(Lower Camel Case)
    첫 단어는 모두 소문자로 시작하며 이어지는 단어들의 첫 글자만 대문자로 한다.
    일반적인 변수명에 사용
    ex) sumValue, inputText
 */




/*
 사전 지식 테스트 때 위 내용들을 제대로 푸신 분이 거의 없었는데
 지금은 대부분 많이 쉽죠?
 그만큼 많이 발전하셨습니다. :)
 */

//: [Next](@next)
