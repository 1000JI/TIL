//
//  ViewController.swift
//  URLSessionExample
//
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    private let imageUrlStr = "https://loremflickr.com/860/640/cat"
    
    
    // MARK: - Sync method
    
    @IBAction private func asyncMethod() {
        print("\n---------- [ asyncMethod ] ----------\n")
        guard let url = URL(string: imageUrlStr) else { return }
        
        // Sync
//        if let data = try? Data(contentsOf: url) {
//            imageView.image = UIImage(data: data)
//        }
        
        // Sync -> Async
//        DispatchQueue.global().async {
//            if let data = try? Data(contentsOf: url) {
//                DispatchQueue.main.async {
//                    self.imageView.image = UIImage(data: data)
//                }
//            }
//        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
    
    
    // MARK: - Get, Post, Delete
    
    // https://jsonplaceholder.typicode.com/
    
    @IBAction func requestGet(_ sender: Any) { // Get -> 읽기
        print("\n---------- [ Get Method ] ----------\n")
        let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
        guard let url = URL(string: todoEndpoint) else {
            return print("DEBUG: Error, cannot create URL")
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return (print(error!)) }
            guard let response = response as? HTTPURLResponse,
                (200..<300).contains(response.statusCode),
            response.mimeType == "application/json"
                else { return }
            
            guard let data = data else { return }
            if let dictionary = try? JSONSerialization.jsonObject(with: data) as? [String : Any] {
                print(dictionary)
            }
        }
        task.resume()
    }
    
    
    @IBAction func requestPost(_ sender: Any) {
        print("\n---------- [ Post Method ] ----------\n")
        let todoEndpoint = "https://jsonplaceholder.typicode.com/todos"
        guard let url = URL(string: todoEndpoint) else {
            return print("DEBUG: Error, cannot create URL")
        }
        
        let newToDo: [String: Any] = ["title": "My todo", "userId": "20"]
        guard let jsonTodo = try? JSONSerialization.data(withJSONObject: newToDo) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = jsonTodo
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let response = response as? HTTPURLResponse else { return }
            guard let data = data,
                let newItem = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            
            print(newItem)
            print(response.statusCode) // 응답 코드 201 (Created)
        }
        task.resume()
    }
    
    
    @IBAction func requestDelete(_ sender: Any) {
        print("\n---------- [ Delete Method ] ----------\n")
        let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
        guard let url = URL(string: todoEndpoint) else {
            return print("DEBUG: Error, cannot create URL")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let response = response as? HTTPURLResponse,
            response.statusCode == 200
                else { return }
            print("DELETE ok")
        }
        task.resume()
    }
}

