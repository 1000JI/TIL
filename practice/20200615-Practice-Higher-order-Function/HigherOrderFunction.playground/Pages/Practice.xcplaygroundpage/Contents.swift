//: [Previous](@previous)
import Foundation

// 키노트 문제 참고
/*:
 ---
 ## Practice 1
 ---
 */
print("\n---------- [ Practice 1 ] ----------\n")

struct Pet {
    enum PetType {
        case dog, cat, snake, pig, bird
    }
    var type: PetType
    var age: Int
}

let myPet = [
    Pet(type: .dog, age: 13),
    Pet(type: .dog, age: 2),
    Pet(type: .dog, age: 7),
    Pet(type: .cat, age: 9),
    Pet(type: .snake, age: 4),
    Pet(type: .pig, age: 5),
]

// 1번
func sumDogAge(pets: [Pet]) -> Int {
    return pets.filter {
        $0.type == .dog
    }.reduce(0) { (sum, pet) in
        sum + pet.age
    }
}
sumDogAge(pets: myPet)

// 2번
func oneYearOlder(of pets: [Pet]) -> [Pet] {
    //    let olderPets = pets.map { inputPet -> Pet in
    //        var pet: Pet = inputPet
    //        pet.age += 1
    //        return pet
    //    }
    //    return olderPets
    return pets.map { return Pet(type: $0.type, age: $0.age + 1) }
}
oneYearOlder(of: myPet)



/*:
 ---
 ## Practice 2
 ---
 */
print("\n---------- [ Practice 2 ] ----------\n")

// immutableArray 배열의 각 인덱스와 해당 인덱스의 요소를 곱한 값 중 홀수는 제외하고 짝수에 대해서만 모든 값을 더하여 결과 출력
let immutableArray = Array(1...40)

func multiplyByIndex(index: Int, number: Int) -> Int {
    return index * number
}

func isEven(number: Int) -> Bool {
    return number.isMultiple(of: 2)
}

func addTwoNumbers(left: Int, right: Int) -> Int {
    return left + right
}

// 1번 방법
let answerInt = immutableArray.enumerated()
    .map { multiplyByIndex(index: $0.offset, number: $0.element) }
    .filter { isEven(number: $0) }
    .reduce(0) { addTwoNumbers(left: $0, right: $1) }
print(answerInt)

// 2번 방법
let answerInt2 = immutableArray.enumerated()
    .map(multiplyByIndex(index:number:))
    .filter(isEven(number:))
    .reduce(0, addTwoNumbers(left:right:))
print(answerInt2)


let array = ["1j", "2d", "3", "4"]

let m1 = array.map({ Int($0) })
let f1 = array.compactMap({ Int($0) })
let m2 = array.map({ Int($0) })[0]
let f2 = array.compactMap({ Int($0) })[0]

print("DEBUG: \(m1)")
print("DEBUG: \(f1)")
print("DEBUG: \(m2)")
print("DEBUG: \(f2)")


/*:
 ---
 ## Practice
 ---
 */

/*
 [ 1번 문제 ]
 let numbers = [-2, -1, 0, 1, 2]
 numbers.compactMap {
 $0 >= 0 ? $0 : nil
 }
 => [0, 1, 2]
 
 위와 같이 compactMap을 이용했을 때와 동일한 결과가 나오도록 compactMap 없이 구현
 */

print("\n---------- [ 1번 문제 ] ----------\n")

let numbers = [-2, -1, 0, 1, 2]
let zeroUpArray = numbers.filter{ $0 >= 0 }
print(zeroUpArray)


/*
 [ 2번 문제 ]
 
 let nestedArr = [[1, 2, 3], [9, 8, 7], [-1, 0, 1]]
 nestedArr.flatMap { $0 }
 => [1, 2, 3, 9, 8, 7, -1, 0, 1]
 
 위와 같이 flatMap을 이용했을 때와 동일한 결과가 나오도록 flatMap 없이 구현
 */

print("\n---------- [ 2번 문제 ] ----------\n")

let nestedArr = [[1, 2, 3], [9, 8, 7], [-1, 0, 1]]
//let undoArray = nestedArr.reduce([Int]()) { (sumArray, array) in
//    sumArray + array
//}

let undoArray = nestedArr.reduce([], +)
print(undoArray)


/*
 [ 3번 문제 ]
 Q. map 과 flatMap, compactMap 을 이용하여 다음 3가지 결과값이 나오도록 출력해보기
 
 1. [[1, 2, 3], [5], [6], []]
 2. [Optional(1), Optional(2), Optional(3), nil, Optional(5), Optional(6), nil, nil] 
 3. [1, 2, 3, 5, 6]
 */

print("\n---------- [ 3번 문제 ] ----------\n")

let s_array: [[Int?]] = [[1, 2, 3], [nil, 5], [6, nil], [nil]]

// 1. [[1, 2, 3], [5], [6], []]
print(s_array.map { $0.compactMap { $0 } }) // 각 배열을 풀어서 nil을 벗겨내야함
print(s_array.flatMap { $0 })
print(s_array.flatMap { $0 }.compactMap { $0 })


/*
 [4번 문제 ]
 Q. 아래 배열에서 숫자에 해당하는 문자열만 골라낸 뒤, 그 숫자들을 제곱한 결과를 모두 더한 값 출력
 고차함수만을 이용할 것
 
 ["1", "2", "3", "4", "5", "A", "B", "C", "D"]
 */

print("\n---------- [ 4번 문제 ] ----------\n")

let mixedString = ["1", "2", "3", "4", "5", "A", "B", "C", "D"]

print(mixedString
    .filter { Int($0) != nil }
    .reduce(0, { (sum, digit) in
        sum + Int(digit)!
    }))

print(mixedString
    .map { Int($0) }
    .compactMap { $0 }
    .map { $0 * $0 }
    .reduce(0, +))
//: [Next](@next)
