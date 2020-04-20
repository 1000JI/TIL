import UIKit

/*
 문제 설명
 길이가 n이고, 수박수박수박수....와 같은 패턴을 유지하는 문자열을 리턴하는 함수, solution을 완성하세요. 예를들어 n이 4이면 수박수박을 리턴하고 3이라면 수박수를 리턴하면 됩니다.

 제한 조건
    - n은 길이 10,000이하인 자연수입니다.
 
 입출력 예
 n    return
 3    수박수
 4    수박수박
 */

func solution(_ n:Int) -> String {
//    var resultArray: String = ""
//    for index in 1...n {
//        if index.isMultiple(of: 2) { resultArray += "박" }
//        else { resultArray += "수" }
//    }
//    return resultArray
    return String(repeating: "수박", count: n/2) + ((n%2 == 1) ? "수" : "")
}
solution(5)
