import UIKit

/*
 문제 설명
 1부터 입력받은 숫자 n 사이에 있는 소수의 개수를 반환하는 함수, solution을 만들어 보세요.

 소수는 1과 자기 자신으로만 나누어지는 수를 의미합니다.
 (1은 소수가 아닙니다.)

 제한 조건
    - n은 2이상 1000000이하의 자연수입니다.
 
 입출력 예
 n      result
 10     4
 5      3
 
 입출력 예 설명
 입출력 예 #1
 1부터 10 사이의 소수는 [2,3,5,7] 4개가 존재하므로 4를 반환

 입출력 예 #2
 1부터 5 사이의 소수는 [2,3,5] 3개가 존재하므로 3를 반환
 */

func solution(_ n:Int) -> Int {
    var primeBool: Bool = true
    var primeArray: [Int] = [2]
    
    for index in 2...n where !(index.isMultiple(of: 2)) {
        for div in primeArray {
            if index.isMultiple(of: div) { primeBool = false; break }
        }
        if primeBool { primeArray.append(index) }
        primeBool = true
    }

    return primeArray.count
//    if n >= 2 { resultCount += 1 }
//    for index in 2...n where !(index.isMultiple(of: 2)) {
//        for div in 2...index where (div == 2) || !(div.isMultiple(of: 2)) {
//            if index % div == 0 { primeCount += 1 }
//            if primeCount > 1 { break }
//        }
//        if primeCount == 1 { resultCount += 1 }
//        primeCount = 0
//    }
//    return resultCount
}
solution(10)
solution(5)
solution(100000)
