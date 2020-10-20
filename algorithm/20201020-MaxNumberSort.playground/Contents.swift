
import Foundation

func solution(_ numbers:[Int]) -> String {
    guard numbers.reduce(0, +) != 0 else { return "0" }
    
    var compareNumbers = [Int]()
    compareNumbers = numbers.sorted { (lhs, rhs) -> Bool in
        if lhs < 10 && rhs < 10 {
            return lhs > rhs
        } else {
            let lhsValue = Int("\(lhs)\(rhs)") ?? 0
            let rhsValue = Int("\(rhs)\(lhs)") ?? 0
            return lhsValue > rhsValue
        }
    }
    return compareNumbers.map { return "\($0)" }.reduce("", +)
}

solution([6, 10, 2])
solution([3, 30, 34, 5, 9])
solution([40, 403])
