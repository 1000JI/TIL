import UIKit

/*
 [ 과제 ]
 1. 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수

 func combineString(str1: String?, str2: String?, str3: String?) -> String {
   // code
 }

 // 입력 예시 및 결과
 combineString1(str1: "AB", str2: "CD", str3: "EF")   // "ABCDEF"
 combineString1(str1: "AB", str2: nil, str3: "EF")    // "ABEF"
*/
func combineString(_ firstString: String?, _ secondString: String?, _ thirdString: String?) -> String {
    var combinedString : String = ""
    
    if let first = firstString { combinedString += first }
    if let second = secondString { combinedString += second }
    if let third = thirdString { combinedString += third }
    
    return combinedString
}
combineString("AB", "CD", "EF")   // "ABCDEF"
combineString("AB", nil, "EF")    // "ABEF"


/*
 2. 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic과 2개의 자연수를 입력 파라미터로 받아 (파라미터 총 3개) 해당 연산의 결과를 반환하는 함수 구현
 enum Arithmetic {
   case addition, subtraction, multiplication, division
 }
*/

enum Arithmetic {
    case addition, subtraction, multiplication, division
}

func calculatorFunction(number1: Int, op: Arithmetic, number2: Int) -> Int {
    guard number1 != 0, number2 != 0 else { return 0 }
    
    switch op {
    case .addition:
        return number1 + number2
    case .subtraction:
        return number1 - number2
    case .multiplication:
        return number1 * number2
    case .division:
        return number1 / number2
    }
}
calculatorFunction(number1: 10, op: .multiplication, number2: 3)


/*
 [ 도전 과제 ]
 1. celcius, fahrenheit, kelvin 온도 3가지 케이스를 가진 enum 타입 Temperature 를 정의
 각 케이스에는 Double 타입의 Associated Value 를 받도록 함

 추가로 Temperature 타입 내부에 각 온도를 섭씨 온도로 변환해주는 toCelcius() 함수를 구현
 섭씨 = 섭씨
 섭씨 = (화씨 - 32) * 5 / 9
 섭씨 = 켈빈 + 273
  
 enum Temperature {
   // 코드
 }
 */

enum Temperature {
    case celcius(Double)
    case fahrenheit(Double)
    case kelvin(Double)
    
    func toCelcius() -> Double {
        switch self {
        case .celcius(let celcius):
            return celcius
        case .fahrenheit(let fahrenheit):
            return (fahrenheit - 32) * 5 / 9
        case .kelvin(let kelvin):
            return kelvin + 273
        }
    }
}
var calcTem = Temperature.kelvin(50)
print(calcTem.toCelcius())

