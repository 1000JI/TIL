import UIKit

/*
 [ 자율 학습 ]
 1. 지난 과제에서 함수를 이용해 풀었던 문제를 클로저로 변형해서 풀어보기
 
 1-1) 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수
 func combineString(_ firstString: String?, _ secondString: String?, _ thirdString: String?) -> String {
     var combinedString : String = ""
     
     if let first = firstString { combinedString += first }
     if let second = secondString { combinedString += second }
     if let third = thirdString { combinedString += third }
     
     return combinedString
 }
 combineString("AB", "CD", "EF")   // "ABCDEF"
 combineString("AB", nil, "EF")    // "ABEF"
 */
let combineString: (String?, String?, String?) -> String = {
    var combinedString: String = ""
    if let tempString = $0 { combinedString += tempString }
    if let tempString = $1 { combinedString += tempString }
    if let tempString = $2 { combinedString += tempString }
    return combinedString
}
combineString("AB", nil, "EF")


/*
 1-2) [보기] 철수 - apple, 영희 - banana, 진수 - grape, 미희 - strawberry
 위 보기처럼 학생과 좋아하는 과일을 매칭시킨 정보를 Dictionary 형태로 만들고
 스펠링에 'e'가 들어간 과일을 모두 찾아 그것과 매칭되는 학생 이름을 배열로 반환하는 함수
 
 func findSpellingE(_ studentDict: Dictionary<String, String>) -> [String] {
     var studentList : Array<String> = []

     for dict in studentDict {
         if (dict.value).contains("e") {
             studentList.append(dict.key)
         }
     }
     return studentList
 }
 print(findSpellingE(studentDict))
 */
let studentDict : Dictionary<String, String> = [
    "철수":"apple",
    "영희":"banana",
    "진수":"grape",
    "미희":"strawberry"
]

let findSpellingE: (Dictionary<String, String>) -> [String] = {
    var studentList: [String] = []
    for dict in $0 {
        if dict.value.contains("e") {
            studentList.append(dict.key)
        }
    }
    return studentList
}
findSpellingE(studentDict)

//----------------------------------------------------------------------------//
/*
 2. 클로저 Full Syntax <-> Optimized Syntax 변환 연습


 //----------------------------------------------------------------------------//
 [ 과제 ]
 1. 객체 지향 프로그래밍 (Object-Oriented Programming) 에 대해 예습하기
    - 추상화:
    - 캡슐화:
    - 상속성:
    - 다형성:
*/

/*
 //----------------------------------------------------------------------------//
 [ 도전 과제 ]
 1. 아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기

 let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
   let isAscending: Bool
   if s1 > s2 {
     isAscending = true
   } else {
     isAscending = false
   }
   return isAscending
 }
*/
let someClosure: (String, String) -> Bool = {
    guard $0 > $1 else { return false }
    return true
}
someClosure("abe","abc")

let someClosure2: (String, String) -> Bool = { $0 > $1 }
someClosure2("abe", "abc")

/*
 let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
   var count: Int = 0
   for _ in values {
     count += 1
   }
   return count
 }
 */

let otherClosure: ([Int]) -> Int = { $0.count }

otherClosure([1, 2, 4])
