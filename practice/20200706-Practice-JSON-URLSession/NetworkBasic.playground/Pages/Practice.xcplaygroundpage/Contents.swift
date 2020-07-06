//: [Previous](@previous)

import Foundation

/*
 [ 실습1 ]
 다음 주소를 통해 얻은 json 데이터(국제정거장 위치 정보)를 파싱하여 출력하기
 http://api.open-notify.org/iss-now.json
 */

func practice1() {
    guard let url = URL(string: "http://api.open-notify.org/iss-now.json") else { return }
    
    let getData = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        if let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
            if let positionData = jsonObject["iss_position"] as? [String: String] {
                let longitude = Double(positionData["longitude"] ?? "0.0")!
                let latitude = Double(positionData["latitude"] ?? "0.0")!
                
                print("----- [ 국제 정거장 위치 ] -----")
                print(longitude, latitude)
            }
        }
    }
    getData.resume()
}
practice1()




/*
 [ 실습2 ]
 Post 구조체 타입을 선언하고
 다음 주소를 통해 얻은 JSON 데이터를 파싱하여 Post 타입으로 변환한 후 전체 개수 출력하기
 https://jsonplaceholder.typicode.com/posts
 */

struct Post {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    init(dictionary: [String: Any]) {
        self.userId = dictionary["userId"] as? Int ?? 0
        self.id = dictionary["id"] as? Int ?? 0
        self.title = dictionary["title"] as? String ?? ""
        self.body = dictionary["body"] as? String ?? ""
    }
}

func practice2() {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
    
    let getPosts = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let data = data,
            let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]] {
            for post in jsonObject {
                print("\n-----[ Post ]-----")
                let postData = Post(dictionary: post)
                print(postData)
            }
        }
    }
    getPosts.resume()
}

practice2()




//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)


