import UIKit

/*
 [ 과제 ]
 
 1.
 func addTwoValues(a: Int, b: Int) -> Int {
 return a + b
 }
 let task1: Any = addTwoValues(a: 2, b: 3)
 
 위와 같이 정의된 변수 task1이 있을 때 다음의 더하기 연산이 제대로 동작하도록 할 것
 task1 + task1
 */
func addTwoValues(a: Int, b: Int) -> Int {
    return a + b
}
let task1: Any = addTwoValues(a: 2, b: 3)

if let intValue = task1 as? Int {
    print(intValue + intValue)
}


/*
 [ 도전 과제 ]
 1.
 let task2: Any = addTwoValues
 과제 1번에 이어 이번에는 위와 같이 정의된 task2 변수에 대해
 두 변수의 더하기 연산이 제대로 동작하도록 할 것
 (addTwoValues의 각 파라미터에는 원하는 값 입력)
 
 task2 + task2
 */

let task2: Any = addTwoValues

if let addTwo = task2 as? (Int, Int) -> Int {
    print(addTwo(2, 3) + addTwo(2, 3))
}


/*
 2.
 class Car {}
 let values: [Any] = [
 1,
 99.9,
 (2.0, Double.pi),
 Car(),
 { (str: String) -> Int in str.count }
 ]
 
 위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기
 
 for value in values {
 switch value {
 // Code 구현
 }
 }
 */

class Car {}
let values: [Any] = [
    1,
    99.9,
    (2.0, Double.pi),
    Car(),
    { (str: String) -> Int in str.count }
]

//for value in values {
////    print(type(of: value))
//    switch value {
//    case let x where type(of: x) == Int.self:
//        print(x)
//    default:
//        print("default")
//    }
//}

for value in values {
    print(type(of: value))
    switch value {
    case is Int:
        if let x = value as? Int {
            print(x)
        }
    case is Double:
        if let x = value as? Double {
            print(x)
        }
    case is (Double, Double):
        if let x = value as? (Double, Double) {
            print(x)
        }
    case is Car:
        if let x = value as? Car {
            print(x)
        }
    case is (String) -> Int:
        if let x = value as? (String) -> Int {
            x("String")
        }
    default:
        print("default")
    }
}
