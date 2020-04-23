import UIKit

/*
 [ 과제 - 알고리즘 ]
 1. 정수 하나를 입력받은 뒤, 해당 숫자와 숫자 1사이에 있는 모든 정수의 합계 구하기
 e.g.  5 -> 1 + 2 + 3 + 4 + 5 = 15,   -2 -> -2 + -1 + 0 + 1 = -2
*/

func solution(_ index: Int) -> Int {
    guard index < 1 else { return Array(1...index).reduce(0, +) }
    return Array(index...1).reduce(0, +)
}
print("정수 알고리즘 => ", solution(5))
print("정수 알고리즘 => ", solution(-2))



/*
 2. 숫자를 입력받아 1부터 해당 숫자까지 출력하되, 3, 6, 9가 하나라도 포함되어 있는 숫자는 *로 표시
 e.g.  1, 2, *, 4, 5, *, 7, 8, *, 10, 11, 12, *, 14, 15, * ...
*/
func solution2(_ index: Int) -> [String] {
    let resultArray = Array(1...index).map{ value -> String in
        if String(value).contains("3") || String(value).contains("6") || String(value).contains("9") {
            return "*"
        } else {
            return String(value)
        }
    }
    return resultArray
}
print(solution2(20))



/*
 3. 2개의 정수를 입력했을 때 그에 대한 최소공배수와 최대공약수 구하기
 e.g.  Input : 6, 9   ->  Output : 18, 3

 // 최대공약수
 // 1) 두 수 중 큰 수를 작은 수로 나눈 나머지가 0이면 최대 공약수
 // 2) 나머지가 0이 아니면, 큰 수에 작은 수를 넣고 작은 수에 나머지 값을 넣은 뒤 1) 반복

 // 최소 공배수
 // - 주어진 두 수의 곱을 최대공약수로 나누면 최소공배수
*/
func solution3(_ index1: Int, _ index2: Int) -> [Int] {
    let minValue = index1 < index2 ? index1 : index2
    let maxValue = index1 > index2 ? index1 : index2
    let maxDivisor = Array(1...minValue).filter{ minValue % $0 == 0 }.filter{ maxValue % $0 == 0 }
    return [(minValue * maxValue) / maxDivisor.last!, maxDivisor.last!]
}
print(solution3(6, 9))
