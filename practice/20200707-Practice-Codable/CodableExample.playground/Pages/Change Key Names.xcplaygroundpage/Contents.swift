//: [Previous](@previous)
import Foundation

let jsonData = """
{
  "user_name": "James",
  "user_email": "abc@xyz.com",
  "gender": "male",
}
""".data(using: .utf8)!


struct User: Decodable {
    let name: String
    let email: String
    let gender: String
//    let myEmail: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "user_name"
        case email = "user_email"
        case gender
//        case myEmail = "my_email"
    }
    
    init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        name = try keyedContainer.decode(String.self, forKey: .name)
        email = try keyedContainer.decode(String.self, forKey: .email)
        gender = try keyedContainer.decode(String.self, forKey: .gender)
    }
}


let decoder = JSONDecoder()
do {
    let user = try decoder.decode(User.self, from: jsonData)
    print(user)
} catch {
    print(error)
}


//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
