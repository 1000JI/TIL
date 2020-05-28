//: [Previous](@previous)

/*
 다음의 클로져를 FullSyntax 로부터 Optimized Syntax 로 차근차근 줄여보세요.
 (최종 답만 적지 말고 하나씩 줄여갈 것)
 */

func performClosure(param: (String) -> Int) {
    param("Swift")
}

performClosure(param: { (param: String) -> Int in
    return param.count
})

performClosure(param: { (param: String) in
    return param.count
})

performClosure(param: { param in
    return param.count
})

performClosure(param: { param in
    param.count
})

performClosure(param: {
    $0.count
})

performClosure(param: ) {
    $0.count
}

performClosure() {
    $0.count
}

performClosure { $0.count }

/*
 자연수 하나를 입력받아 1년부터 그 해까지의 모든 윤년의 개수를 출력하는 함수
 (공식 : 매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
 윤년O 예시 - 160, 204, 400, 1996, 2000, 2800
 윤년X 예시 - 200, 300, 500, 600, 1900, 2100
 
 Intput : 2019
 Output : 윤년에 속하는 해는 총 489회입니다.
 */

func printTheNumberOfLeafYear(_ year: Int) {
    var leafYearCount = 0
    
    for yearIndex in 1...year {
        if yearIndex % 100 == 0 {
            if yearIndex % 400 == 0 { leafYearCount += 1 }
        } else if yearIndex % 4 == 0 {
            leafYearCount += 1
        }
    }
    
    print("윤년에 속하는 해는 총 \(leafYearCount)회입니다.")
}

printTheNumberOfLeafYear(8)     // 2
printTheNumberOfLeafYear(100)   // 24
printTheNumberOfLeafYear(400)   // 97
printTheNumberOfLeafYear(2019)  // 489


/*
 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
 e.g.
 > Input : ["a", "b", "c", "a", "e", "d", "c", "a", "c", "f"]
 > Output : ["b", "e" ,"d", "f"]
 
 // sort 함수 사용하지 말 것
 */

func printUniqueValues(from arr: [String]) -> [String] {
    return arr.filter { arr.firstIndex(of: $0) == arr.lastIndex(of: $0) }
}

let strArr = ["a", "b", "c", "a", "e", "d", "c", "a", "c", "f"]
print(printUniqueValues(from: strArr))   // b, e, d, f


/*
 자연수를 입력받아 그 숫자보다 작거나 같은 모든 소수와 그 개수를 출력하는 함수를 정의
 
 e.g.
 func checkPrimeNumbers(number: Int)
 > Input : 10
 > Output : 10보다 작거나 같은 소수는 [2, 3, 5, 7]이고, 총 4개입니다.
 */

func checkPrimeNumbers(number: Int) {
    var primeCount = 0
    var resultArray: [Int] = []
    
    guard number != 1 else {
        print("\(number)보다 작거나 같은 소수는 \(resultArray)이고, 총 \(resultArray.count)개입니다.")
        return
    }
    
    for digit in 2...number {
        for div in 1...digit {
            guard primeCount <= 2 else { primeCount = 0; break }
            if digit % div == 0 { primeCount += 1 }
        }
        
        if primeCount == 2 {
            resultArray.append(digit)
        }
        primeCount = 0
    }
    
    print("\(number)보다 작거나 같은 소수는 \(resultArray)이고, 총 \(resultArray.count)개입니다.")
}

checkPrimeNumbers(number: 1)
checkPrimeNumbers(number: 10)   // 4개
checkPrimeNumbers(number: 100)  // 25개
checkPrimeNumbers(number: 1000) // 168개


/*
 구글(google), 카카오(kakao), 네이버(naver) 로그인을 위해 Site라는 이름의 Enum 타입을 만들고자 합니다.
 각 case는 사용자의 아이디(String)와 비밀번호(String)를 위한 연관 값(associated value)을  가집니다.
 그리고 Site 타입 내부에는 signIn()이라는 이름의 메서드를 만들어 다음과 같이 문자열을 출력하는 기능을 구현해보세요.
 
 e.g.
 enum Site {}
 > Input
 let google = Site.google("google@gmail.com", "0000")
 google.signIn()
 
 > Output
 구글에 로그인하였습니다. (아이디 - google@gmail.com, 비밀번호 - 0000)
 */

enum Site {
    case google(String, String)
    case kakao(String, String)
    case naver(String, String)
    
    func signIn() {
        switch self {
        case let .google(id, pw):
            print("구글에 로그인하였습니다. (아이디 - \(id), 비밀번호 - \(pw)")
        case let .kakao(id, pw):
            print("카카오에 로그인하였습니다. (아이디 - \(id), 비밀번호 - \(pw)")
        case let .naver(id, pw):
            print("네이버에 로그인하였습니다. (아이디 - \(id), 비밀번호 - \(pw)")
        }
    }
}

let google = Site.google("google@gmail.com", "0000")
google.signIn()


//: [Next](@next)
