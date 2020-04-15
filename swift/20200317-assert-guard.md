
# assert와 guard
> 애플리케이션 동작 중 생성하는 다양한 연산 값들을 동적으로 확인 할 수 있으며,   
> 빠르게 확인하여 안전하게 처리 할 수 있도록 도와준다.

## 1. Assertion
- **assert(_:_:file:line:)** 함수를 사용한다.
- **assert** 함수는 **디버깅 모드에서만 동작**(*배포하는 애플리케이션에서는 제외*)한다.
- 주로 사용하는 이유는 예상했던 **조건의 검증을 위해** 사용한다.
``` Swift
var testInt: Int = 0

// 검증 조건에 실패 시 나타날 문구를 작성한다.

assert(testInt == 0, "testInt != 0")  // 통과

testInt = 1
// assert(testInt == 0) // 동작 중지(검증 실패)
// assert(testInt == 0, "testInt != 0") // 동작 중지(검증 실패)
// assertion failed: someInt != 0: file guard_assert.swift

func functionWithAssert(age: Int?) {
  assert(age != nil, "age == nil")
  assert((age! >= 0) && (age! <= 130), "나이값 입력이 잘못되었습니다")
  print("당신의 나이는 \(age!)세입니다")
}

functionWithAssert(age: 50)
//functionWithAssert(age: -1) // 동작 중지(검증 실패)
//functionWithAssert(age: nil) // 동작 중지(검증 실패)
```
> **precondition(_:_:file:line:)** 함수: **assert(_:_:file:line:)** 와 같은 역할을 하지만 실제 배포 환경에서도 동작한다.

## 2. guard(빠른종료- Early Exit)
- **guard**를 사용하면 잘못된 값 전달 시 특정 실행구문을 빠르게 종료한다.
- 디버깅 모드 뿐만아니라 어떤 조건에서도 사용한다.
- **guard**의 **else** 블럭에는 코드 블럭을 종료하는 **키워드(return, break 등)** 가 꼭 있어야 한다.
- **타입스캐팅** 또는 **옵셔널**에도 많이 사용하며, 그외 단순 조건 판단에서 쓰인다.
``` Swift
func functionWithGuard(age: Int?) {
    
    guard let unwrappedAge = age,
        unwrappedAge < 130,
        unwrappedAge >= 0 else {
        print("나이 값이 올바르지 않습니다.")
        return
    }
    
    print("당신의 나이는 \(unwrappedAge)세입니다")
}

var count = 1

while true {
    guard count < 3 else {
        break
    }
    print(count)
    count += 1
}
// 1
// 2

func someFunction(info: [String: Any]) {
    guard let name = info["name"] as? String else {
        return
    }
    
    guard let age = info["age"] as? Int, age >= 0 else {
        return
    }
    
    print("\(name): \(age)")
}

someFunction(info: ["name": "jenny", "age": "10"])
someFunction(info: ["name": "mike"])
someFunction(info: ["name": "jiwoon", "age": 10]) // jiwoon: 10
```

### if let / guard를 이용한 옵셔널(Optional) 바인딩 비교
``` Swift
// 1. if let 옵셔널 바인딩
if let unwrapped: Int = someValue { 
// do something
   unwrapped = 3
} 
// if 구문 외부에서는 unwrapped 사용이 불가능 합니다.
// unwrapped = 5 

// 2. guard 옵셔널 바인딩
// guard 구문 이후에도 unwrapped 사용 가능합니다.
guard let unwrapped: Int = someValue else {
         return 
}
unwrapped = 3
```


***
###### 참조&강의내용: [커넥트재단](https://www.edwith.org/boostcamp_ios/)
###### [애플 공식문서 - assert](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID335)
###### [애플 공식문서 - guard](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html#//apple_ref/doc/uid/TP40014097-CH9-ID525)
###### [참고사이트](http://seorenn.blogspot.com/2016/05/swift-assertion.html)
***
