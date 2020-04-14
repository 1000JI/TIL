import Foundation

/*
 1. [보기] 철수 - apple, 영희 - banana, 진수 - grape, 미희 - strawberry
 위 보기처럼 학생과 좋아하는 과일을 매칭시킨 정보를 Dictionary 형태로 만들고
 스펠링에 'e'가 들어간 과일을 모두 찾아 그것과 매칭되는 학생 이름을 배열로 반환하는 함수
*/
let studentDict : Dictionary<String, String> = [
    "철수":"apple",
    "영희":"banana",
    "진수":"grape",
    "미희":"strawberry"
]

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


/*
 2. 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
 ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]
*/
var intArray  : Array<Int> = [2, 8, 7, 1, 4, 3]

func arrayCompriseOddEven(_ randomIntArray: [Int]) -> [Int] {
    var evenNumberArray : Array<Int> = []   // 짝수
    var oddNumberArray  : Array<Int> = []   // 홀수

    for index in randomIntArray {
        guard (index % 2) == 0 else { oddNumberArray.append(index); continue }  // 홀수면 oddArray
        evenNumberArray.append(index)   // 짝수면 evenArray
    }
    return oddNumberArray + evenNumberArray
}
print(arrayCompriseOddEven(intArray))   // 배열 출력


/*
 3. 0 ~ 9 사이의 숫자가 들어있는 배열에서 각 숫자가 몇 개씩 있는지 출력하는 함수
 입력 : [1, 3, 3, 3, 8]
 결과 :
 숫자 1 : 1개
 숫자 3 : 3개
 숫자 8 : 1개
*/
let numberList : [Int] = [1, 3, 3, 3, 8]

func arrayNumberCount(_ inputList: [Int]) {
    var countDict: [Int:Int] = [:]
    
    for index in numberList {
        guard countDict[index] != nil else {
            countDict[index] = 1
            continue
        }
        countDict[index] = countDict[index]! + 1
    }
    
    for (key, value) in countDict {
        print("숫자 \(key) : \(value)개")
    }
}
arrayNumberCount(numberList)



//---------------------------------------------------
/*
 [ 과제 ]
 1. 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
 ex) 123 -> 321 , 10293 -> 39201
 */
func reverseIntFunction(_ inputData: Int) -> Int {
    var reverseInt : Int = inputData
    var reverseArray : [Int] = []

    while reverseInt > 0 {
        reverseArray.append(reverseInt % 10)
        reverseInt /= 10
    }
    reverseArray = reverseArray.reversed()

    var tenCount : Int = 1
    reverseInt = 0
    for index in reverseArray {
        reverseInt += index * tenCount
        tenCount *= 10
    }
    return reverseInt
}
print("Number reverse : \(reverseIntFunction(123))")

/*
 2. 100 ~ 900 사이의 숫자 중 하나를 입력받아 각 자리의 숫자가 모두 다른지 여부를 반환하는 함수
 ex) true - 123, 310, 369   /  false - 100, 222, 770
*/
func judgeDiffNumber(_ inputData: Int) -> Bool {
    var saveNumberArray: [Int] = []
    var tempData: Int = inputData
    
    while tempData > 0 {
        saveNumberArray.append(tempData % 10)
        tempData /= 10
    }
    saveNumberArray = saveNumberArray.sorted {$0 < $1}
    
    for i in 0..<saveNumberArray.count {
        for j in i+1..<saveNumberArray.count {
            if saveNumberArray[i] == saveNumberArray[j] {
                return false
            }
        }
    }
    return true
}
print("Judge = \(judgeDiffNumber(123))")

/*
 [ 도전 과제 ]
 1. 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
 ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]
 */
func returnNotOverlapArray(find charString: [Character]) -> [Character] {
    var notOverlapArray : [Character] = []
    var overlapCount : Int = 0
    
    for i in 0..<charString.count {
        for j in 0..<charString.count {
            guard charString[i] == charString[j] else { continue }
            overlapCount += 1
        }
        guard overlapCount <= 1 else { overlapCount = 0; continue }
        notOverlapArray.append(charString[i])
        overlapCount = 0
    }
    
    return notOverlapArray
}
print("Not Overlap Array => \(returnNotOverlapArray(find: ["a", "b", "c", "a", "e", "d", "c"]))")


/*
 2. 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고
 + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기
 */

let carnivoraMimic = [
    "식육목": [
        "개과": [
            "개": ["자칼", "늑대", "북미산 이리"],
            "여우": ["아메리카 여우", "유럽 여우"]
        ],
        "고양이과": [
            "고양이": ["고양이", "살쾡이"],
            "표범": ["사자", "호랑이"]
        ]
    ]
]

print(carnivoraMimic["식육목"]!["고양이과"]!["표범"]!)

/*
 let carnivoraMimic : [String:Any] 인 경우 "식육목"은 String 이지만,
 [] 값은 value(Any) 때문에 별도의 타입캐스팅이 필요함.
 하지만 생략할 경우 타입 추론이 가능하기에 출력이 가능함.
 */
