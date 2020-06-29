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


//final class SingleLinkedList: LinkedListStack {
//  private var head: Node? = nil
//
//  var isEmpty: Bool { true }
//
//  var size: Int = 0
//
//  func push(node: Node) {
//    if head == nil {
//      head = node
//      return
//    }
//
//    guard var nodePointer = head else { return }
//
//    while nodePointer.next != nil {
//      nodePointer = nodePointer.next!
//    }
//
//    nodePointer.next = node
//  }
//
//  func peek() -> String? {
//    guard var nodePointer = head else { return nil }
//
//    while nodePointer.next != nil {
//      nodePointer = nodePointer.next!
//    }
//    return nodePointer.value
//  }
//
//  func pop() -> String? {
//    guard var nodePointer = head else { return nil }
//    var prevPoint: Node? = nodePointer
//
//    while nodePointer.next != nil {
//      prevPoint = nodePointer
//      nodePointer = nodePointer.next!
//    }
//
//    let popValue = nodePointer.value
//    prevPoint?.next = nil
//
//    return popValue
//  }
//
//  func printLinked() {
//    print("-----------")
//    var headPoint = head
//    while headPoint != nil {
//      print("DEBUG: Print \(headPoint?.value)")
//      headPoint = headPoint?.next
//    }
//  }
//}
//
//let stackList: SingleLinkedList = SingleLinkedList()
//
//stackList.push(node: Node(value: "A"))
//stackList.push(node: Node(value: "B"))
//stackList.push(node: Node(value: "C"))
//stackList.push(node: Node(value: "D"))
//stackList.printLinked()
//
//print("DEBUG: PeekValue \(stackList.peek())")
//print("DEBUG: PopValue \(stackList.pop())")
//print("DEBUG: PopValue \(stackList.pop())")
//print("DEBUG: PeekValue \(stackList.peek())")
//stackList.printLinked()
//
//stackList.push(node: Node(value: "E"))
//print("DEBUG: PeekValue \(stackList.peek())")
//stackList.printLinked()
