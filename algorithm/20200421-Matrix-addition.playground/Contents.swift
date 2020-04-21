import UIKit

/*
 문제 설명
 행렬의 덧셈은 행과 열의 크기가 같은 두 행렬의 같은 행, 같은 열의 값을 서로 더한 결과가 됩니다. 2개의 행렬 arr1과 arr2를 입력받아, 행렬 덧셈의 결과를 반환하는 함수, solution을 완성해주세요.

 제한 조건
    - 행렬 arr1, arr2의 행과 열의 길이는 500을 넘지 않습니다.
 
 입출력 예
 arr1               arr2                return
 [[1,2],[2,3]]      [[3,4],[5,6]]       [[4,6],[7,9]]
 [[1],[2]]          [[3],[4]]           [[4],[6]]
 */

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var resultArray: [[Int]] = arr1

    for (index, arr1Row) in arr1.enumerated() {
        for arr1Col in 0..<arr1Row.count {
            resultArray[index][arr1Col] = arr1[index][arr1Col] + arr2[index][arr1Col]
        }
    }

    return resultArray
    // return zip(arr1, arr2).map{zip($0,$1).map{$0+$1}}

}
solution([[1,2],[2,3]], [[3,4],[5,6]])
solution([[1],[2]], [[3],[4]])


// x만큼 간격이 있는 n개의 숫자
//func solution(_ x:Int, _ n:Int) -> [Int64] {
//    return Array(1...n).map{ Int64($0 * x) }
//
//    // OR
//
//    var resultArray : [Int64] = []
//    var index: Int = 0
//
//    for _ in 1...n {
//        index += x
//        resultArray.append(Int64(index))
//    }
//
//    return resultArray
    // return Array(1...n).map { Int64($0 * x) }
//}
