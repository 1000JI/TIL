###### 최초 작성일: 2020. 03. 03.

> ###### 사이트 내용 중 헷갈리거나 다시 정리할 필요가 있는 부분만 작성했습니다.
> ###### 더 자세한 내용을 알고 싶다면 하단 참고 사이트를 참조 하시길 바랍니다.

## 표현식, 변수 및 상수
> ###### Swift 4.2, iOS 12, Xcode 10 기준

***
### 1. 시작하기
```
소프트웨어를 작성하는 데 사용하는 Tools를 Tool Chain 이라고 한다.
Code를 작성하는 Tool Chain의 일부를 IDE(Integrated Development Environment) 라고 한다.
Xcode를 IDE라고 보면 된다.
```

***
### 2. shift 연산
shift 연산은 2진 형태를 하고 있는 숫자를 각각 왼쪽 또는 오른쪽으로 이동하여 새로운 10진수 형식을 반환합니다.

#### 사용법
> Ex:   
> 0000 1110(14) << 2 ==> 0011 1000(56)   
> 0010 1000(40) >> 1 ==> 0001 0100(20)

#### 정리
> '<< M'은 2의 M 제곱 수를 곱한다.
>> 0001(1) << 2 ==> 2의 2 제곱은 '4'이기 때문에 1 * 4 = 0100(4) 나온다.

> '>> N'은 2의 N 제곱 수를 나눈다.
>> 1110(14) >> 2 ==> 2의 2제곱은 '4'이기 때문에 14 / 4 = 0011(3) 나온다.

#### 문제
```
(( 8000 / ( 5 * 10 ))- 32 ) >> ( 29 % 5 ) => ?
```
> 답: 


***
### 3. 상수 & 변수
주로 상수에는 ```Int```가 많이 사용된다.   
실수 같은 경우에는 ```Float```와 ```Double```가 있는데 주로 ```Double```이 커버해주는 정밀도가 높아 많이 사용한다.

#### 사용법(상수)
상수 값은 변경되지 않는 값에 유용합니다.   
예를 들어 서버 주소라던지, 사용할 API Key 값이라던지 등등...

##### 오류
``` Swift
let number: Int = 10
number = 0
```
> Cannot assign to value: 'number' is a 'let' constant   
> 위 처럼 오류가 발생하게 된다. 상수는 값을 변경 할 수 없다.

#### 사용법(변수)
변수는 값이 수시로 바뀌는 값을 저장 할 때 사용한다.
은행 계좌 금액 같은...

``` Swift
var changeValue : Int = 55
changeValue = 1_000_000
// Swift에서는 선택적으로 밑줄을 사용하여 큰 숫자를 용이하게 읽을 수 있게 만들 수 있습니다.
```

***
### 4. 의미 있는 변수&상수명 짓기
변수와 상수의 이름을 의미있는 이름(직관적이고 정확한)으로 사용해야 합니다.   
나중에 다시 이름을 봤을 때 무엇을 의미하는지 알 수 있도록 지어야 합니다.

* 좋은 예
> - ```presonAge```
> - ```numberOfPeople```
> - ```gardePointAverage```

* 나쁜 예
> - ```a```
> - ```temp```
> - ```average```

>> Camel Case 방식
>> 1. 소문자로 시작
>> 2. 이름이 여러 단어로 구성된 경우, 단어를 합치고 후속 단어를 대문자로 시작
>> 3. 단어 중 하나가 약어라면 전체 약어(ex: ```sourceURL``` or ```urlDescription```)


***
***
## 참고 사이트
> 1. Swift Tutorial Part 1: Expressions, Variables and Constants
>> [https://www.raywenderlich.com/6338-swift-tutorial-part-1-expressions-variables-and-constants](https://www.raywenderlich.com/6338-swift-tutorial-part-1-expressions-variables-and-constants)
> 2. Swift Tutorial Part 2: Types and Operations
>> [https://www.raywenderlich.com/6364-swift-tutorial-part-2-types-and-operations](https://www.raywenderlich.com/6364-swift-tutorial-part-2-types-and-operations)
> 3. Swift Tutorial Part 3: Flow Control
>> [https://www.raywenderlich.com/965-swift-tutorial-part-3-flow-control](https://www.raywenderlich.com/965-swift-tutorial-part-3-flow-control)
