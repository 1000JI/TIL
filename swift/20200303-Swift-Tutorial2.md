###### 최초 작성일: 2020. 03. 03.

> ###### 사이트 내용 중 헷갈리거나 다시 정리할 필요가 있는 부분만 작성했습니다.
> ###### 더 자세한 내용을 알고 싶다면 하단 참고 사이트를 참조 하시길 바랍니다.


# 타입과 연산자
> ###### Swift 4.2, iOS 12, Xcode 10 기준

***
## 1. 시작하기
코딩을 하다보면 Int에서 Double 또는 Double에서 Int로 변환해야 하는 경우가 있다.   
하지만 간단하게 생각하고 코딩을 하면 아래와 같이 오류가 난다.

```Swift
var integer: Int = 100
var decimal: Double = 12.5
integer = decimal
```
> ```Cannot assign value of type 'Double' to type 'Int'```

이러한 종류의 자동 변환은 버그의 원인이 될 수 있으며 되더라도 성능을 저하 시키는 원인이 된다.   
그렇다면 어떻게 해야 오류가 안날까? 다음 코드를 보면,
```Swift
var integer: Int = 100
var decimal: Double = 12.5
integer = Int(decimal)
```
> ```integer``` => ```12```

위 처럼 오류가 나지 않고 코딩이 됐음을 확인 할 수 있다.   
이것은 강제형변환을 통해 ```Double``` -> ```Int```로 형변환 한 것이다.   
하지만 ```12.5```에서 ```12```로 되면서 소숫점 손실이 발생했다.   
이러한 점들을 인지 후 사용해야 데이터 손실 또는 성능 저하를 예방 할 수 있다.

***
### 2. 혼합 유형의 연산자
```Swift
let hourlyRate: Double = 19.5
let hoursWorked: Int = 10
let totalCost: Double = hourlyRate * hoursWorked
```
> ```Binary operator '*' cannot be applied to operands of type 'Double' and 'Int'```

Swift에서는 ```*``` 연산자를 혼합 유형에 사용 할 수 없다(다른 연산자에도 적용).   
결과에는 하나의 유형만 있어야 하기 때문에 ```Int``` -> ```Double``` 또는 ```Double``` -> ```Int```가 필요하다.   
```Double``` -> ```Int```는 소숫점 손실이 생길 수 있기 때문에, ```Int``` -> ```Double```로 하는 것이 좋다.

##### 수정 코드
```Swift
let hourlyRate: Double = 19.5
let hoursWorked: Int = 10
let totalCost: Double = hourlyRate * Double(hoursWorked)
```

***
### 3. 타입 추론(Type Inference)
```Swift
let integer: Int = 42
let double: Double = 3.14159
```
코드를 보면 ```42```는 내가 추측해도 ```Int```일 것 같고, ```3.14159```는 ```Double```일 것 같다.   
'하지만 빌더는 모르니까 타입을 써줘야겠지?' 라고 생각 할 수 있다.   
Swift는 ```타입 추론(Type Inference)```을 할 수 있다.

> **타입추론(Type Inference)**   
> 타입 추론은 ```변수```&```상수``` 선언 할 때 타입을 같이 선언 할 필요 없이   
> 초기화 되는 값에 따라 ```변수```&```상수```의 타입이 정해진다.   
> 예를 들어,
```Swift
let typeInferredInt = 42
```
> 라고 한다면 ```typeInferredInt```은 ```Int``` 타입으로 선언된다.   
>
![typeInferredInt](https://koenig-media.raywenderlich.com/uploads/2018/07/swift-tutorial-part-2-inferred-int-1.png)
> ###### [그림출처](https://www.raywenderlich.com/6364-swift-tutorial-part-2-types-and-operations)

>    
```Swift
let typeInferredDouble = 3.14159
```
> 그렇다면 ```typeInferredDouble```은 타입이 뭘까? 맞다. ```Double```이다.   
> ```변수```나 ```상수```를 선언 할 때 마다 타입을 정해주지 않아도 되고 코드의 간결성이 높아진다.

#### 타입 추론 응용
```Swift
let wantADouble = 3
```
> ###### ```wantADouble``` : ```Int```

```Swift
let actuallyDouble = Double(3)
let actuallyDouble: Double = 3
let actuallyDouble = 3 as Double
```
> ###### ```actuallyDouble``` : ```Double```   
> 엇? ```as```? ```as```는 ```타입 추론```에 도움을 주는 키워드이다.   
> ```3```은 ```Int``` 또는 ```Double```로 사용 할 수 있는데 ```타입 추론``` 될 때 타입을 ```Double```로 해라~   
> ```3``` => ```3.0```으로 되어 ```변수``` 또는 ```상수```에 저장된다.


***
### 4. 문자열(String)
문자열은 매우 일반적인 데이터 유형이다. 텍스트를 ```String```이라는 데이터 형식으로 저장한다.   
```String```은 ```문자(Character)```의 모음으로 생각한다.

> #### 유니코드(Unicode)
> ```유니코드```는 문자와 숫자를 매핑해놓은 표준 규약이라고 보면 된다.   
> 여러 가지의 표준이 있지만 가장 많이 쓰는 것은 ```유니코드```이다.   
>     
![picUnicode](https://koenig-media.raywenderlich.com/uploads/2016/09/cafe-1.png)
> [그림출처](https://www.raywenderlich.com/6364-swift-tutorial-part-2-types-and-operations)   
>     

> #### Strings in Swift
> ```문자(Character)```는 단일 문자를 저장 할 수 있다.   
> ```문자열(String)```는 복수 문자를 저장 할 수 있다.   
```Swift
let characterA: Character = "a"
let stringDog = "Dog" // String 타입으로 추론
```
> ```문자```는 단순히 길이가 1인 문자열이기에, ```Character``` 타입을 원한다면 명시적으로 지정 해야 한다.

#### 4-1. 문자열 결합(Concatenation)
```Swift
var message = "Hello" + " my name is "
let name = "Lorenzo"
message += name // "Hello my name is Lorenzo"
```
위 처럼 문자열끼리 결합이 가능하며, 문자열과 문자와도 결합이 가능하다.
```Swift
let exclamationMark: Character = "!"
message += String(exclamationMark) // "Hello my name is Lorenzo!"
```

#### 4-2. 문자열 안에 변수 넣기
```Swift
let oneThird = 1.0 / 3.0
let oneThirdLongString = "One third is \(oneThird) as a decimal."
```
> ###### One third is 0.3333333333333333 as a decimal.


#### 4-3. 여러 줄 문자열
```Swift
let bigString = """
  You can have a string
  that contains multiple
  lines
  by
  doing this.
  """
print(bigString)
```

```
You can have a string
that contains multiple
lines
by
doing this.
```

***
### 5. 튜플(Tuples)
데이터가 쌍 또는 삼중으로 나올 때, ```튜플```을 사용하면 매우 간단한 방식으로 나타낼 수 있습니다.   
예를 들어 2D 좌표를 표현하고자 한다면,
```Swift
let coordinates: (Int, Int) = (2, 3)
let coordinatesInferred = (2, 3) // Inferred to be of type (Int, Int)
let coordinatesMixed = (2.1, 3) // Inferred to be of type (Double, Int)
```
이 또한 ```타입추론```을 사용하여 위처럼 사용 할 수 있다.   
그럼 이 값을 어떻게 꺼내서 쓸 수 있을까?

```Swift
let coordinates = (2, 3)
let x1 = coordinates.0
let y1 = coordinates.1
```
> ###### 참고   
> ```Zero Indexing```이라 하여 일반적으로 0부터 시작함

또는,
```Swift
let coordinatesNamed = (x: 2, y: 3) // Inferred to be of type (x: Int, y: Int)
let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y
```
위 처럼 사용 할 수 있다.

#### 5-1. 튜플(세 개의 값)
```Swift
let coordinates3D = (x: 2, y: 3, z: 1)
let (x3, y3, z3) = coordinates3D
```

또는,

```Swift
let coordinates3D = (x: 2, y: 3, z: 1)
let x3 = coordinates3D.x
let y3 = coordinates3D.y
let z3 = coordinates3D.z
```

또는,

```Swift
let (x4, y4, _) = coordinates3D
```

위 처럼 사용 할 수 있는데 ```_``` 은 해당 부분은 무시한다는 것(?)   
```wildcard operator```이라고해서, 값을 무시 할 수 있다.

***
### 6. A Whole Lot of Number Types
![numberTable](https://koenig-media.raywenderlich.com/uploads/2016/09/int_sizes-650x274.png)
![doubleTable](https://koenig-media.raywenderlich.com/uploads/2016/09/float_sizes-650x91.png)   
> [그림출처](https://www.raywenderlich.com/6364-swift-tutorial-part-2-types-and-operations)
``` Swift
let a: Int16 = 12
let b: UInt8 = 255
let c: Int32 = -100000

let answer = Int(a) + Int(b) + Int(c) // Answer is an Int
```

***
###### 이부분 조금 이해 안됨... 나중에 물어봐야할듯!!!
> ###### 프로토콜(Protocol)   
> Swift의 가장 큰 특징 중 하나는 ```프로토콜```을 사용하는 것이며, 유형 공통성의 개념을 공식화 하는 방법이다.   
> 정수의 경우 다음과 같이 다이어그램으로 나타낼 수 있다.
![protocolPic](https://koenig-media.raywenderlich.com/uploads/2018/07/swift-tutorial-part-2-integer-protocols-650x459.png)   
> [그림출처](https://www.raywenderlich.com/6364-swift-tutorial-part-2-types-and-operations)   


***
***
## 참고 사이트
> 1. Swift Tutorial Part 1: Expressions, Variables and Constants
>> [https://www.raywenderlich.com/6338-swift-tutorial-part-1-expressions-variables-and-constants](https://www.raywenderlich.com/6338-swift-tutorial-part-1-expressions-variables-and-constants)
> 2. Swift Tutorial Part 2: Types and Operations
>> [https://www.raywenderlich.com/6364-swift-tutorial-part-2-types-and-operations](https://www.raywenderlich.com/6364-swift-tutorial-part-2-types-and-operations)
> 3. Swift Tutorial Part 3: Flow Control
>> [https://www.raywenderlich.com/965-swift-tutorial-part-3-flow-control](https://www.raywenderlich.com/965-swift-tutorial-part-3-flow-control)
