
# 고차함수(Higher-order function)

## 1. 고차함수
- **'다른 함수를 전달인자로 받거나 함수실행의 결과를 함수로 반환하는 함수'** 를 뜻한다.
- Swift의 함수(클로저)는 일급객체여서 함수의 전달인자 또는 결과 값으로 반환 할 수 있다.
- 표준 라이브러리에서 제공하는 [```map```, ```filter```, ```reduce```] 함수는 컨테이너 타입(```Array```, ```Set```, ```Dictionary``` 등)에 구현된다.

## 2. map
- 기존 데이터를 변형(transform)하여 새로운 컨테이너를 생성한다.
``` Swift
// 변형하고자 하는 numbers와 변형 결과를 받을 doubledNumbers, strings

let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int]
var strings: [String]
```

### <기존 for문 사용>
```Swift
doubledNumbers = [Int]()
strings = [String]()

for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubledNumbers) // [0, 2, 4, 6, 8]
print(strings) // ["0", "1", "2", "3", "4"]
```

### <map 메서드 사용>
``` Swift
// numbers의 각 요소를 2배하여 새로운 배열 반환
doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

// numbers의 각 요소를 문자열로 변환하여 새로운 배열 반환
strings = numbers.map({ (number: Int) -> String in
    return "\(number)"
})

print(doubledNumbers) // [0, 2, 4, 6, 8]
print(strings) // ["0", "1", "2", "3", "4"]

// 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저
doubledNumbers = numbers.map { $0 * 2 }
print(doubledNumbers) // [0, 2, 4, 6, 8]
```

## 3. filter
- 값을 걸러서 새로운 컨테이너로 추출한다.

### <기존 for문 사용>
``` Swift
// 변수 사용에 주목하세요
var filtered: [Int] = [Int]()

for number in numbers {
    if number % 2 == 0 {
        filtered.append(number)
    }
}

print(filtered) // [0, 2, 4]
```

### <filter 메서드 사용>
``` Swift
// numbers의 요소 중 짝수를 걸러내어 새로운 배열로 반환
let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers) // [0, 2, 4]

// 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저
let oddNumbers: [Int] = numbers.filter {
    $0 % 2 != 0
}
print(oddNumbers) // [1, 3]
```


## 4. reduce
- 콘텐츠를 하나로 통합한다.
``` Swift
// 통합하고자 하는 someNumbers
let someNumbers: [Int] = [2, 8, 15]
```

### <기존 for 구문 사용>
``` Swift
// 변수 사용에 주목하세요
var result: Int = 0

// someNumbers의 모든 요소를 더합니다
for number in someNumbers {
    result += number
}

print(result) // 25
```

### <reduce 메서드 사용>
``` Swift
// 초깃값이 0이고 someNumbers 내부의 모든 값을 더합니다.
let sum: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
    //print("\(first) + \(second)") //어떻게 동작하는지 확인해보세요
    return first + second
})

print(sum)  // 25

// 초깃값이 0이고 someNumbers 내부의 모든 값을 뺍니다.
var subtract: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
    //print("\(first) - \(second)") //어떻게 동작하는지 확인해보세요
    return first - second
})

print(subtract) // -25

// 초깃값이 3이고 someNumbers 내부의 모든 값을 더합니다.
let sumFromThree = someNumbers.reduce(3) { $0 + $1 }

print(sumFromThree) // 28
```


## 5. flatmap???



***
###### 참조&강의내용: [커넥트재단](https://www.edwith.org/boostcamp_ios/)
***
