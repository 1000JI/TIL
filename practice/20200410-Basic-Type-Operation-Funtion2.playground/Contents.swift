import UIKit

// 문제에서 요구하는 함수 정의하기
// - 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수
func introduceFunction(yourName inputName: String, yourAge inputAge: Int){
    print("내 이름은 \(inputName)이고, 나이는 \(inputAge)입니다.")
}
introduceFunction(yourName: "천지운", yourAge: 29)


//--------------------------------------------------------------------------
// - 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
// return: true(짝수), false(홀수)
func isTwoMultiple(_ inputIndex: Int) -> Bool {
    if (inputIndex % 2) == 0 {
        return true
    } else {
        return false
    }
}

if isTwoMultiple(50) {
    print("짝수입니다.")
} else {
    print("홀수입니다.")
}


//--------------------------------------------------------------------------
// - 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)
func calcMultiple(_ inputIndex1: Int, _ inputIndex2: Int = 10) -> Int {
    return inputIndex1 * inputIndex2
}
print(calcMultiple(2))
print(calcMultiple(2, 5))


//--------------------------------------------------------------------------
// - 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수
func avgTestScore(_ inputScore1: Int, _ inputScore2: Int, _ inputScore3: Int, _ inputScore4: Int) -> Double {
    return Double(inputScore1 + inputScore2 + inputScore3 + inputScore4) / Double(4)
}
print(avgTestScore(40, 50, 60, 50))


//--------------------------------------------------------------------------
// - 점수를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
func gradeReturnFuntion(_ inputIndex: Int) -> Character {
    if inputIndex >= 90 {
        return "A"
    } else if inputIndex >= 80 {
        return "B"
    } else if inputIndex >= 70 {
        return "C"
    } else {
        return "F"
    }
}
print(gradeReturnFuntion(90))


//--------------------------------------------------------------------------
// - 가변 인자 파라미터를 이용해 점수를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
func avgGradeReturnFution(_ inputIndexs: Int...) -> Character {
    var sumScore: Int = 0
    var avgScore: Double = 0.0
    
    for indexScore in inputIndexs {
        sumScore = sumScore + indexScore
    }
    
    avgScore = Double(sumScore) / Double(inputIndexs.count)
    
    if avgScore >= 90.0 {
        return "A"
    } else if avgScore >= 80.0 {
        return "B"
    } else if avgScore >= 70.0 {
        return "C"
    } else {
        return "F"
    }
}
print("평균 학점: \(avgGradeReturnFution(75))")

