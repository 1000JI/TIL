/*
 - 수포자 삼인방은 모의고사에 수학 문제를 전부 찍으려 합니다. 수포자는 1번 문제부터 마지막 문제까지 다음과 같이 찍습니다.
 
 1. 1번 수포자가 찍는 방식: 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, ...
 2. 2번 수포자가 찍는 방식: 2, 1, 2, 3, 2, 4, 2, 5, 2, 1, 2, 3, 2, 4, 2, 5, ...
 3. 3번 수포자가 찍는 방식: 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, ...
 
 - 1번 문제부터 마지막 문제까지의 정답이 순서대로 들은 배열 answers가 주어졌을 때, 가장 많은 문제를 맞힌 사람이 누구인지 배열에 담아 return 하도록 solution 함수를 작성해주세요.
 
 - 제한 조건
    * 시험은 최대 10,000 문제로 구성되어있습니다.
    * 문제의 정답은 1, 2, 3, 4, 5중 하나입니다.
    * 가장 높은 점수를 받은 사람이 여럿일 경우, return하는 값을 오름차순 정렬해주세요.
 */

import Foundation

// 내가 푼 것
    func solution(_ answers:[Int]) -> [Int] {
        let firstHuman:  [Int] = [1, 2, 3, 4, 5]
        let secondHuman: [Int] = [2, 1, 2, 3, 2, 4, 2, 5]
        let thirdHuman:  [Int] = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
        
        var resultHuman: [Int] = []
        
        var firstAnswerCount    : Int = 0
        var secondAnswerCount   : Int = 0
        var thirdAnswerCount    : Int = 0
        
        var maxValue            : Int = 0
        
        for index in 0..<answers.count {
            if answers[index] == firstHuman[index % firstHuman.count] {
               firstAnswerCount += 1
            }
            if answers[index] == secondHuman[index % secondHuman.count] {
               secondAnswerCount += 1
            }
            if answers[index] == thirdHuman[index % thirdHuman.count] {
               thirdAnswerCount += 1
            }
        }
        
        maxValue = max(firstAnswerCount, secondAnswerCount, thirdAnswerCount)
        if firstAnswerCount == maxValue { resultHuman.append(1) }
        if secondAnswerCount == maxValue { resultHuman.append(2) }
        if thirdAnswerCount == maxValue { resultHuman.append(3) }
        
        return resultHuman
    }
solution([1,2,3,4,5])   // return [1]
solution([1,3,2,4,2])   // return [1,2,3] 오름차순


// 풀이
//func solution2(_ answers:[Int]) -> [Int] {
//    let answer = (
//        a: [1, 2, 3, 4, 5], // index % 5
//        b: [2, 1, 2, 3, 2, 4, 2, 5], // index % 8
//        c: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] // index % 10
//    )
//    var point = [1:0, 2:0, 3:0]
//
//    for (i, v) in answers.enumerated() {
//        if v == answer.a[i % 5] { point[1] = point[1]! + 1 }
//        if v == answer.b[i % 8] { point[2] = point[2]! + 1 }
//        if v == answer.c[i % 10] { point[3] = point[3]! + 1 }
//    }
//
//    return point.sorted{ $0.key < $1.key }.filter{ $0.value == point.values.max() }.map{ $0.key }
//}
/*
 .enumerated() : 은 배열, 딕셔너리 등 튜플로 반환해주는 메소드이다.
 배열 같은 경우 (index, value)이며, 딕셔너리 같은 경우 (key, value) 튜플을 뱉어낸다. 굿!!!!
 */

func solution3(_ answers:[Int]) -> [Int] {
    let answer = (
        first   : [1, 2, 3, 4, 5], // index % 5
        second  : [2, 1, 2, 3, 2, 4, 2, 5], // index % 8
        third   : [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] // index % 10
    )
    var result = [1:0, 2:0, 3:0]

    for (index, value) in answers.enumerated() {
        if value == answer.first[index % answer.first.count] { result[1] = result[1]! + 1 }
        if value == answer.second[index % answer.second.count] { result[2] = result[2]! + 1 }
        if value == answer.third[index % answer.third.count] { result[3] = result[3]! + 1 }
    }
    
    return result.sorted{ $0.key < $1.key }.filter{ $0.value == result.values.max() }.map{ $0.key }
}
solution3([1,2,3,4,5])
solution3([1,3,2,4,2])
