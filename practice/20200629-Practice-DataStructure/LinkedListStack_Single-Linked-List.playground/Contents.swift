import Foundation

protocol LinkedListStack {
  var isEmpty: Bool { get } // 노드가 있는지 여부
  var size: Int { get }     // 전체 개수
  func push(node: Node)     // 데이터 삽입
  func peek() -> String?    // 마지막 데이터 확인
  func pop() -> String?     // 데이터 추출
}


final class Node {
  var value: String
  var next: Node?
  
  init(value: String) {
    self.value = value
  }
}

final class SingleLinkedList: LinkedListStack {
  private var head: Node? = nil
  var isEmpty: Bool {
    return head == nil
  }
  
  var size: Int {
    guard var pointer = head else { return 0 }
    
    var count: Int = 1
    while pointer.next != nil {
      pointer = pointer.next!
      count += 1
    }
    return count
  }
  
  func push(node: Node) {
    if isEmpty {
      head = node
      return
    }
    node.next = head
    head = node
  }
  
  func peek() -> String? {
    return head?.value
  }
  
  func pop() -> String? {
    if isEmpty { return nil }
    var removeNode = head
    defer { removeNode = nil }
    head = head?.next
    return removeNode?.value
  }
}

let linkedList = SingleLinkedList()
linkedList.isEmpty
linkedList.pop()

linkedList.push(node: Node(value: "A"))
linkedList.push(node: Node(value: "B"))
linkedList.peek()
linkedList.size

linkedList.isEmpty
linkedList.pop()
linkedList.push(node: Node(value: "C"))
linkedList.push(node: Node(value: "D"))
linkedList.peek()
linkedList.size

linkedList.pop()
linkedList.pop()
linkedList.pop()
linkedList.pop()
linkedList.size
linkedList.isEmpty


/*
 [ 도전 과제 ]
 다음 내용을 참고하여 더블 링크드 리스트 구현
 
 /***************************************************
 class Node { }
 - deinit 메서드 구현할 것
 
 class DoubleLinkedList { }
 - 다음의 프로퍼티와 메서드 구현
 
 [ 프로퍼티 ]
 // private
 private var head: Node?
 private weak var tail: Node?
 
 // internal
 var isEmpty: Bool - 노드 존재 여부
 var count: Int    - 노드 전체 개수
 var first: Node?  - 첫번째 노드 반환
 var last: Node?   - 마지막 노드 반환
 
 [ 메서드 ]
 scanValues()  - 현재 저장된 모든 노드의 값 출력
 removeAll()   - 모든 노드 제거
 removeNode(by value: String) -> Bool      - 밸류를 이용해 노드 제거 후 성공 여부
 removeNode(at index: Int) -> String?      - 인덱스를 이용해 노드 제거 후 삭제한 노드의 밸류 반환
 node(by value: String) -> Node?           - 지정한 값을 지닌 노드를 찾아 반환
 insert(node newNode: Node, at index: Int) - 특정 위치에 노드 삽입
 append(node: Node)                        - 마지막 부분에 노드 삽입
 ***************************************************/
 */
