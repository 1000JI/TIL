//: [Previous](@previous)
//: # Versus Serialization
import Foundation

struct Dog: Codable {
    let name: String
    let age: Int
}

/*:
 ---
 ### Question
 - JSONSerialization을 이용해 Dog객체 생성
 - JSONDecoder를 이용해 Dog객체 생성
 ---
 */

/*
 Basic
 */
print("\n---------- [ Basic ] ----------\n")
let jsonData = """
  {
    "name": "Tory",
    "age": 3,
  }
  """.data(using: .utf8)!

// JSONSerialization
if let jsonObject = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] {
    guard let name = jsonObject["name"] as? String else { fatalError() }
    guard let age = jsonObject["age"] as? Int else { fatalError() }
    
    let dog = Dog(name: name, age: age)
    print("DEBUG: JSONSerialization Dog \(dog)")
}

// JSONDecoder
let decoder = JSONDecoder()
let decodedDog = try! decoder.decode(Dog.self, from: jsonData)
print("DEBUG: JSONDecoder Dog \(decodedDog)")


/*
 Array
 */
print("\n---------- [ Array ] ----------\n")
let jsonArrData = """
  [
    { "name": "Tory", "age": 3 },
    { "name": "Tory", "age": 3 },
  ]
  """.data(using: .utf8)!


// JSONSerialization

if let jsonObject = try? JSONSerialization.jsonObject(with: jsonArrData) as? [[String: Any]] {
    for object in jsonObject {
        guard let name = object["name"] as? String else { fatalError() }
        guard let age = object["age"] as? Int else { fatalError() }
        
        let dog = Dog(name: name, age: age)
        print("DEBUG: JSONSerialization ArrDog \(dog)")
    }
}

// JSONDecoder

let decodedArrDogs = try! decoder.decode([Dog].self, from: jsonArrData)
for dog in decodedArrDogs {
    print("DEBUG: JSONDecoder ArrDog \(dog)")
}

/*
 Dictionary
 */
print("\n---------- [ Dictionary ] ----------\n")
let jsonDictData = """
{
  "data": [
    { "name": "Tory", "age": 3 },
    { "name": "Tory", "age": 3 },
  ]
}
""".data(using: .utf8)!

// JSONSerialization
if let jsonObject = try? JSONSerialization.jsonObject(with: jsonDictData) as? [String: Any] {
    if let dictDatas = jsonObject["data"] as? [[String: Any]] {
        for object in dictDatas {
            guard let name = object["name"] as? String else { fatalError() }
            guard let age = object["age"] as? Int else { fatalError() }
            
            let dog = Dog(name: name, age: age)
            print("DEBUG: JSONSerialization DictDog \(dog)")
        }
    }
}


// JSONDecoder

let decodedDictDogs = try! decoder.decode([String: [Dog]].self, from: jsonDictData)

if let arrayDogs = decodedDictDogs["data"] {
    for dog in arrayDogs {
        print("DEBUG: JSONDecoder DictDog \(dog)")
    }
}






/*:
 ---
 ### Answer
 ---
 */
print("\n---------- [ Answer ] ----------\n")

extension Dog {
    init?(from json: [String: Any]) {
        guard let name = json["name"] as? String,
            let age = json["age"] as? Int
            else { return nil }
        self.name = name
        self.age = age
    }
}

/*
 Basic
 */
print("---------- [ Basic ] ----------")
// JSONSerialization
if let jsonObject = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] {
    if let dog = Dog(from: jsonObject) {
        print("Serialization :", dog)
    }
}

// JSONDecoder
if let dog = try? JSONDecoder().decode(Dog.self, from: jsonData) {
    print("Decoder :", dog)
}

/*
 Array
 */
print("\n---------- [ Array ] ----------")
// JSONSerialization
if let jsonObjects = try? JSONSerialization.jsonObject(with: jsonArrData) as? [[String: Any]] {
    
    jsonObjects
        .compactMap { Dog(from: $0) }
        .forEach { print("Serialization :", $0) }
}

// JSONDecoder
if let dogs = try? JSONDecoder().decode([Dog].self, from: jsonArrData) {
    dogs.forEach { print("Decoder :", $0) }
}


/*
 Dictionary
 */
print("\n---------- [ Dictionary ] ----------")
// JSONSerialization
if let jsonObject = try? JSONSerialization.jsonObject(with: jsonDictData) as? [String: Any],
    let data = jsonObject["data"] as? [[String: Any]] {
    
    data
        .compactMap { Dog(from: $0) }
        .forEach { print("Serialization :", $0) }
}

// JSONDecoder
if let dogs = try? JSONDecoder().decode([String: [Dog]].self, from: jsonDictData) {
    dogs.values.forEach { $0.forEach { print("Decoder :", $0) } }
}



//: [Table of Contents](@Contents) | [Previous](@previous) | [Next](@next)
