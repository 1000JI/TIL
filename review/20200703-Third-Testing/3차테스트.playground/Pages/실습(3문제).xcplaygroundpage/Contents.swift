import Foundation

/*
 < 1번 문제 > 고차함수만을 이용하여 구현
 1)
 1부터 100까지의 숫자를 가진 배열에서 홀수만을 골라 각 숫자에 1씩 더해준 배열을 출력
 Output: [2, 4, 6, 8, 10, 12, ... 98, 100]
 
 2)
 ["1", "2", "3", "4", "5", "A", "B", "C", "D"]
 위 배열에서 숫자에 해당하는 문자열만 골라낸 뒤, 그것을 제곱한 숫자들을 모두 더한 결과 출력
 Output: 55
 */

print("\n---------- [ 1번 문제 ] ----------\n")

// 1)
let intArray = Array(1...100)
    .filter { !$0.isMultiple(of: 2) }
    .map { $0 + 1 }
print(intArray)

// 2)
let numberArray = ["1", "2", "3", "4", "5", "A", "B", "C", "D"]
    .map { Int($0) }
    .compactMap { $0 }
    .map { $0 * $0 }
    .reduce(0, +)
print(numberArray)



/*
 < 2번 문제 >
 단일 연결 리스트(Single Linked List) 구현하기
 
 protocol LinkedListStack {
 var isEmpty: Bool { get } // 노드가 있는지 여부
 var size: Int { get }     // 전체 개수
 func push(node: Node)     // 데이터 삽입
 func pop() -> String?     // 데이터 추출
 func peek() -> String?    // 마지막 데이터 확인
 }
 */

print("\n---------- [ 2번 문제 ] ----------\n")



final class Node {
    var value: String
    var next: Node?
    
    init(value: String) {
        self.value = value
    }
}

final class SingleLinkedList {
    // 구현
    var head: Node?
    
    var isEmpty: Bool { head == nil }
    var size: Int {
        var count = 0
        var goHead = head
        while goHead != nil {
            goHead = goHead?.next
            count += 1
        }
        return count
    }
    
    func push(node: Node) {
        guard head != nil else {
            head = node
            return
        }
        node.next = head
        head = node
    }
    
    func pop() -> String? {
        let popNode = head
        head = head?.next
        return popNode?.value
    }
    
    func peek() -> String? {
        return head?.value
    }
}


let linkedList = SingleLinkedList()
linkedList.isEmpty    // true

linkedList.push(node: Node(value: "A"))
linkedList.push(node: Node(value: "B"))
linkedList.peek()    // B
linkedList.size    // 2

linkedList.isEmpty    // false
linkedList.pop()    // B
linkedList.push(node: Node(value: "C"))
linkedList.peek()    // C
linkedList.size    // 2

linkedList.pop()    // C
linkedList.pop()    // A
linkedList.pop()    // nil
linkedList.size    // 0
linkedList.isEmpty    // true




/*
 < 3번 문제 >
 버블 정렬(Bubble Sort) 구현하기
 */

print("\n---------- [ 3번 문제 ] ----------\n")

var inputCases = [
    [],
    [1],
    [1, 2, 3, 5, 6, 7, 9, 10, 14],
    [1, 1, 2, 2, 3, 3, 3, 3, 1, 1, 2, 2],
    [14, 10, 9, 7, 6, 5, 3, 2, 1],
    [5, 6, 1, 3, 10, 2, 7, 14, 9],
    Array(1...10).map { _ in Int.random(in: 1...999) },
]


func bubbleSort(input: inout [Int]) {
    // 구현 코드 작성
    guard input.count > 0 else { return }
    
    for i in 1..<input.count {
        for j in 0..<(input.count - i) {
            if input[j] > input[j+1] {
                input.swapAt(j, j+1)
            }
        }
    }
}



// 정답지 - 기본 정렬 함수
let sorted = inputCases.map { $0.sorted() }

// 직접 만든 정렬 함수 적용
for idx in inputCases.indices {
    bubbleSort(input: &inputCases[idx])
}

// 결과 비교. 정렬 완료 메시지가 나오면 성공
func testCases() {
    inputCases.enumerated().forEach { idx, arr in
        guard sorted[idx] != arr else { return }
        print("케이스 \(idx + 1) 정렬 실패 - \(inputCases[idx])")
    }
}
let isSuccess = sorted == inputCases
isSuccess ? print("정렬 완료") : testCases()



/*
 수고하셨습니다!
 */



