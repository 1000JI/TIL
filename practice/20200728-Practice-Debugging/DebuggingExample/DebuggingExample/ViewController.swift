//
//  ViewController.swift
//  DebuggingExample
//
//  Created by 천지운 on 2020/07/28.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

/*
 [ 디버깅 프로세스 ]
 문제 식별 및 발생 위치 찾기
 실행 코드의 제어 흐름 및 데이터 구조를 조사하여 원인 규명
 솔루션을 고안하고 그에 따라 코드 수정
 수정된 앱을 실행하고 수정된 코드가 잘 동작하는지 확인
 */

/*
 [ Debugger Command ]
 help - 모든 명령어 목록을 표시하거나 특정 명령에 대한 세부 도움말 출력
 apropos - 명령어와 서브 명령어 등의 설명부에서 지정한 키워드와 매칭되는 명령어를 검색하여 나열
 po - debugDescription 또는 description 내용 출력(debugDescription > description 우선 순위)
 p - LLDB 기본 형식으로 출력
 */

struct Dog: Decodable {
    let name: String
    let age: Int
}

class ViewController: UIViewController {
    
    var number = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickedEvent(_ sender: UIButton) {
        var sum = 0
        for i in 0...100 {
            sum += i
        }
        print(sum)
        debugPrint(sum)
    }
    
    let jsonData = """
    {
        "name": "Tory"
        "age": 6
    }
    """.data(using: .utf8)!
    
    @IBAction func debuggingEvent(_ sender: UIButton) {
        do {
            let dog = try JSONDecoder().decode(Dog.self, from: jsonData)
            print(dog)
        } catch {
            print(error)
        }
        
        sender.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}


// llvm => xcode의 컴파일러 + 툴체인
// lldb => LLVM 환경에서 동작하는 디버거이다.
