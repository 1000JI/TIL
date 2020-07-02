//
//  ViewController.swift
//  DispatchQueueExample
//
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

// 인프런 앨런 동기비동기

func log(_ str: String) {
    print(str, terminator: " - ")
}

final class ViewController: UIViewController {
    
    @IBOutlet private weak var testView: UIView!
    
    @IBAction private func buttonDidTap(_ sender: Any) {
        print("---------- [ Change Color ] ----------\n")
        let r = CGFloat.random(in: 0...1.0)
        let g = CGFloat.random(in: 0...1.0)
        let b = CGFloat.random(in: 0...1.0)
        testView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    func bigTask() {
        print("= Big task start =")
        for _ in 0...5_000_000 { _ = 1 + 1 }
        print("= Big task end =")
    }
    
    @IBAction func bigTaskOnMainThread() {
        bigTask() // Serial Queue라 다른 놈들이 실행되지 않음
    }
    
    @IBAction private func bigTaskOnBackgroundThread() {
        DispatchQueue.global().async {
            self.bigTask()
        }
    }
    
    
    @IBAction func uiTaskOnBackgroundThread() {
        print("\n---------- [ uiTaskOnBackgroundThread ] ----------\n")
        
//        DispatchQueue.global().async {
//            self.bigTask()
//            self.buttonDidTap(self)   // 색 변경 X
//        }
        
        DispatchQueue.main.async {
            self.bigTask()
            self.buttonDidTap(self)
        }
    }
    
    
    @IBAction private func serialSyncOrder(_ sender: UIButton) {
        print("\n---------- [ Serial Sync ] ----------\n")
        let serialQueue = DispatchQueue(label: "kr.giftbot.serialQueue") // default가 serialQueue
//         Main -> SerialQueue log("1")
        serialQueue.sync { log("1") }
        log("A")
        serialQueue.sync { log("2") }
        log("B")
        serialQueue.sync { log("3") }
        log("C")
        serialQueue.sync { log("4") }
        print()
    }
    
    @IBAction private func serialAsyncOrder(_ sender: UIButton) {
        print("\n---------- [ Serial Async ] ----------\n")
        let serialQueue = DispatchQueue(label: "kr.giftbot.serialQueue")
        // ABC 고정. 1234 고정.
        serialQueue.async { log("1") }
        log("A")
        serialQueue.async { log("2") }
        log("B")
        serialQueue.async { log("3") }
        log("C")
        serialQueue.async { log("4") }
        print()
    }
    
    
    @IBAction private func concurrentSyncOrder(_ sender: UIButton) {
        print("\n---------- [ Concurrent Sync ] ----------\n")
        let concurrentQueue = DispatchQueue(
            label: "kr.giftbot.concurrentQueue",
            attributes: [.concurrent] // 이걸해줘야 concurrentQueue가 된다.
        )
        concurrentQueue.sync { log("1") }
        log("A")
        concurrentQueue.sync { log("2") }
        log("B")
        concurrentQueue.sync { log("3") }
        log("C")
        concurrentQueue.sync { log("4") }
        print()
    }
    
    @IBAction private func concurrentAsyncOrder(_ sender: UIButton) {
        print("\n---------- [ Concurrent Async ] ----------\n")
        let concurrentQueue = DispatchQueue(
            label: "kr.giftbot.concurrentQueue",
            qos: .userInteractive,
            attributes: [.concurrent]
        )
        // async로 되어 있는 놈들은 먼저 끝나는 대로 랜덤으로 나온다.
        // ABC 순서대로, 1234 순서 변경. ABC와 1234 사이의 순서도 매번 변경
        concurrentQueue.async { log("1") }
        log("A")
        concurrentQueue.async { log("2") }
        log("B")
        concurrentQueue.async { log("3") }
        log("C")
        concurrentQueue.async { log("4") }
        print()
    }
    
    @IBAction private func dispatchQueueQualityOfService(_ sender: Any) {
        let userInteractiveQoS = DispatchQueue(
            label: "kr.giftbot.concurrentQueue1", qos: .userInteractive, attributes: .concurrent
        )
        let backgroundQoS = DispatchQueue(
            label: "kr.giftbot.concurrentQueue2", qos: .background, attributes: .concurrent
        )
        
        for _ in 0..<1000 {
            userInteractiveQoS.async { log("😈")}
            DispatchQueue.global(qos: .default).async { log("🤖")}
            backgroundQoS.async { log("👻")}
        }
    }
    
    
    let inactiveQueue = DispatchQueue(
        label: "kr.giftbot.inactiveQueue",
        attributes: [.initiallyInactive, .concurrent]
    )
    
    @IBAction func initiallyInactiveQueue() { // Queue를 쌓아놓는 작업을 한다.
        print("\n---------- [ initiallyInactiveQueue ] ----------\n")
        
        let workItem = DispatchWorkItem { print("Activate WorkItem!") }
        inactiveQueue.async(execute: workItem)
        
        // 필요한 타이밍에 activate 메서드를 통해 활성화
//        inactiveQueue.activate()
    }
    
    
    @IBAction func groupNotify() {
        print("\n---------- [ groupNotify ] ----------\n")
        
        let queue1 = DispatchQueue(label: "kr.giftbot.example.queue1")
        let queue2 = DispatchQueue(label: "kr.giftbot.example.queue2")
        let queue3 = DispatchQueue(label: "kr.giftbot.example.queue3", attributes: .concurrent)
        
        func calculate(task: Int, limit: Int) {
            print("Task\(task) 시작")
            for _ in 0...limit { _ = 1 + 1 }
            print("Task\(task) 종료")
        }
        
//        queue1.async { calculate(task: 1, limit: 10_000_000) }
//        queue2.async { calculate(task: 2, limit:  5_000_000) }
//        queue3.async { calculate(task: 3, limit:  3_000_000) }
//        queue3.async { calculate(task: 4, limit:  1_000_000) }
        
        let group = DispatchGroup()
        queue1.async(group: group) { calculate(task: 1, limit: 10_000_000) }
        queue2.async(group: group) { calculate(task: 2, limit:  5_000_000) }
        queue3.async(group: group) { calculate(task: 3, limit:  3_000_000) }
        queue3.async(group: group) { calculate(task: 4, limit:  1_000_000) }
        group.notify(queue: .main) { print("모든 작업 완료") }
    }
    
    
    
    var myWorkItem: DispatchWorkItem!
    
    @IBAction func cancelDispatchWorkItem() {
        myWorkItem = DispatchWorkItem {
            let bigNumber = 8_000_000
            let divideNumber = bigNumber / 4
            
            for i in 1...bigNumber {
                guard i % divideNumber == 0 else { continue }
                guard !self.myWorkItem.isCancelled else { return } // Cancell 됐으면 return
                print(i / divideNumber * 25, "%")
            }
        }
        
        DispatchQueue.global().async(execute: myWorkItem)
        
        let timeLimit = 3.0
        DispatchQueue.global().async {
            let timeoutResult = self.myWorkItem.wait(timeout: .now() + timeLimit)
            
            switch timeoutResult {
            case .success: print("success within \(timeLimit) seconds")
            case .timedOut:
                self.myWorkItem.cancel() // 단순히 isCancelled를 true로 해줌.
                print("Timed out. Task Cancelled")
            }
        }
        
    }
}



