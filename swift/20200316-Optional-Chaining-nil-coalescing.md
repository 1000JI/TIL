
# 옵셔널 체이닝과 nil 병합 연산자

## 1. 옵셔널 체이닝(Optional Chaining)
- 옵셔널의 내부에 연속된 옵셔널이 있을 경우 유용하게 활용 할 수 있다.
- 매번 **nil** 확인을 하지 않고, 원하는 값의 유무를 확인 할 수 있다.

``` Swift

// 사람 정보 클래스
class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}

// 아파트 정보 클래스
class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

// 옵셔널 인스턴스 생성
let jiwoon: Person? = Person(name: "jiwoon")
let siheung: Apartment? = Apartment(ji: "202", woon: "402")
let superman: Person? = Person(name: "superman")


// Question) 우리집 경비원의 직업이 궁금하다면?

// 옵셔널 체이닝 사용 X
func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("우리집 경비원의 직업은 \(guardJob)입니다")
                } else {
                    print("우리집 경비원은 직업이 없어요")
                }
            }
        }
    }
}

guardJob(owner: jiwoon)


// 옵셔널 체이닝 사용 O
func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)입니다")
    } else {
        print("우리집 경비원은 직업이 없어요")
    }
}

guardJobWithOptionalChaining(owner: jiwoon)
// 우리집 경비원은 직업이 없어요


jiwoon?.home?.guard?.job // nil

jiwoon?.home = siheung

jiwoon?.home // Optional(Apartment)
jiwoon?.home?.guard // nil

// 경비원 할당
jiwoon?.home?.guard = superman

jiwoon?.home?.guard // Optional(Person)

jiwoon?.home?.guard?.name // superman
jiwoon?.home?.guard?.job // nil

jiwoon?.home?.guard?.job = "경비원"
```


## 2. nil 병합 연산자(nil-coalescing operator)
- 중위 연산자(```??```)이다. => Optional ?? Value
- 옵셔널 값이 **nil** 일 경우, ```??``` 우측에 있는 값을 반환한다.
- **띄어쓰기 주의**

``` Swift
var guardJob: String
    
guardJob = jiwoon?.home?.guard?.job ?? "슈퍼맨"
print(guardJob) // 경비원

jiwoon?.home?.guard?.job = nil

guardJob = jiwoon?.home?.guard?.job ?? "슈퍼맨"
print(guardJob) // 슈퍼맨
```


***
###### 참조&강의내용: [커넥트재단](https://www.edwith.org/boostcamp_ios/)
###### [애플 공식문서 - 옵셔널 체이닝](https://docs.swift.org/swift-book/LanguageGuide/OptionalChaining.html)
***
