//: [Previous](@previous)
import Foundation

let decoder = JSONDecoder()

/*
 1번 문제
 - 다음 JSON 내용을 Fruit 타입으로 변환
 */
print("\n---------- [ 1번 문제 (Fruits) ] ----------\n")
let jsonFruits = """
[
{
  "name": "Orange",
  "cost": 100,
  "description": "A juicy orange"
},
{
  "name": "Apple",
  "cost": 200
},
{
  "name": "Watermelon",
  "cost": 300
},
]
""".data(using: .utf8)!


struct Fruit: Decodable {
    let name: String
    let cost: Int
    let description: String?
}

do {
    let fruits = try decoder.decode([Fruit].self, from: jsonFruits)
    fruits.forEach { print("fruit => \($0)") }
} catch {
    print(error.localizedDescription)
}



/*
 2번 문제
 - 다음 JSON 내용을 Report 타입으로 변환
 */
print("\n---------- [ 2번 문제 (Report) ] ----------\n")
let jsonReport = """
{
  "name": "Final Results for iOS",
  "report_id": "905",
  "read_count": "10",
  "report_date": "2019-02-14",
}
""".data(using: .utf8)!

struct Report: Decodable {
    let name: String
    let reportID: String
    let readCount: String
    let reportDate: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case reportID = "report_id"
        case readCount = "read_count"
        case reportDate = "report_date"
    }
    
    init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        name = try keyedContainer.decode(String.self, forKey: .name)
        reportID = try keyedContainer.decode(String.self, forKey: .reportID)
        readCount = try keyedContainer.decode(String.self, forKey: .readCount)
        reportDate = try keyedContainer.decode(String.self, forKey: .reportDate)
    }
}

do {
    let report = try decoder.decode(Report.self, from: jsonReport)
    print(report)
} catch {
    print(error.localizedDescription)
}


/*
 3번 문제
 - Nested Codable 내용을 참고하여 다음 JSON 내용을 파싱
 */

print("\n---------- [ 3번 문제 (Movie) ] ----------\n")
let jsonMovie = """
[
  {
    "name": "Edward",
    "favorite_movies": [
      { "title": "Gran Torino", "release_year": 2008 },
      { "title": "3 Idiots", "release_year": 2009 },
      { "title": "Big Fish", "release_year": 2003 },
    ]
  }
]
""".data(using: .utf8)!

struct Person: Decodable {
    let name: String
    let favoriteMovies: [Movie]

    private enum PersonKeys: String, CodingKey {
        case name
        case favoriteMovies = "favorite_movies"
    }

    init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: PersonKeys.self)
        name = try keyedContainer.decode(String.self, forKey: .name)
        favoriteMovies = try keyedContainer.decode([Movie].self, forKey: .favoriteMovies)
    }

    struct Movie: Decodable {
        let title: String
        let releaseYear: Int

        private enum MovieKeys: String, CodingKey {
            case title
            case releaseYear = "release_year"
        }

        init(from decoder: Decoder) throws {
            let keyedContainer = try decoder.container(keyedBy: MovieKeys.self)
            title = try keyedContainer.decode(String.self, forKey: .title)
            releaseYear = try keyedContainer.decode(Int.self, forKey: .releaseYear)
        }
    }
}


do {
    let edwardMoives = try decoder.decode([Person].self, from: jsonMovie)
    print(edwardMoives[0].name)
    
    for movie in edwardMoives[0].favoriteMovies {
        print(movie)
    }
} catch {
    print(error.localizedDescription)
}




//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
