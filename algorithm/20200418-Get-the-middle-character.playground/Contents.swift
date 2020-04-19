import UIKit

/*
 문제 설명
 단어 s의 가운데 글자를 반환하는 함수, solution을 만들어 보세요. 단어의 길이가 짝수라면 가운데 두글자를 반환하면 됩니다.

 제한사항
    - s는 길이가 1 이상, 100이하인 스트링입니다.
 
 입출력 예
 s      return
 abcde  c
 qwer   we
 */

func solution(_ s:String) -> String {
    // 첫 번째 알고리즘 구현(String.index로 접근 하는 방법)
//    let secondText = s.index(s.startIndex, offsetBy: s.count/2)
//
//    if s.count.isMultiple(of: 2) {
//        let firstText = s.index(s.startIndex, offsetBy: s.count/2-1)
//
//        return "\(s[firstText...secondText])"
//    } else {
//        return "\(s[secondText])"
//    }
    
    // 두 번째 알고리즘 구현(String -> Array로 형 변환 후 처리 -> String으로 형 변환
    if s.count.isMultiple(of: 2) {
        return String(Array(s)[(s.count/2)-1...(s.count/2)])
    } else {
        return String(Array(s)[(s.count/2)])
    }
}
solution("qwer")

/*
 Swift에서는 String[Int]를 통해 개별 문자에 접근하기 어렵다.
 따라서, String.index 메소드를 통해서 개별문자 혹은 범위로 접근 할 수 있다. 가장 기본이 되는 2가지 메소드는 startIndex, endIndex 이다.
 
 let str = "Hello"

 print(str[str.startIndex]) // H

 print(str[str.index(before: str.endIndex)]) // o
 print(str[str.endIndex]) // error
 이런식으로 접근이 가능하다.
 
 또는 offsetBy를 통해서 접근 가능하다.
 offsetBy: 시작 지점부터 떨어진 정수 값만큼 더한 위치를 반환한다.
 let str = "Hello World"

 print(str[str.index(str.startIndex, offsetBy: 0)]) // H
 print(str[str.index(str.startIndex, offsetBy: 6)]) // W

 print(str[str.index(str.endIndex, offsetBy: -1)]) // d
 print(str[str.index(str.endIndex, offsetBy: -3)]) // r
 
 
 */
