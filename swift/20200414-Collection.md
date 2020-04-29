

## 2020년 04월 14일(화)

# Collection

## Value Type (Swift Collection)
- Three primary collection types, known as arrays, sets, and dictionaries, for storing collections of values.
	1. **Array** - _ordered_ collections of values.
	2. **Set** - _unordered_ collections of **unique** values.
	3. **Dictionary** - _unordered collections of key-value_ associations.

<img src="https://github.com/1000JI/TIL/blob/master/picture/Array_Set_Dictionary.png" width="300px" height="200px" title="Set_Array_Dictionary" alt="Smile"></img><br/>

### **Array**
- Ordered Collection
- Zero-based Integer Index
- **인덱스는 순서대로 할당**되며, 중간 인덱스가 삭제되더라도 **인접한 다음 아이템들이 차례대로 앞으로 이동하면서 빈 인덱스를 채워 넣는다**. 따라서 배열 처음이나 중간에 있는 아이템이 삭제되어도 **실제로 사라지는건 가장 마지막 인덱스**이다.
- <> 기호를 사용하여 배열 내부에서 사용할 아이템 타입을 지정하는 문법을 **제네릭(Generic)** 이라고 합니다. - 제네릭은 **구조체나 클래스 외부에서 객체 내부에 사용될 타입을 지정**할 수 있다는 점에서 **동적 프로그래밍 영역으로 간주**되기도 하는데, **생산성을 높여주는 문법**이다.
``` Swift
// Type Annotation
let strArray1: Array<String> = ["apple", "orange", "melon"]
let strArray2: [String] = ["apple", "orange", "melon"]

// Type Inference
let strArray3 = ["apple", "orange", "melon"]
let strArray4 = Array<String>(repeating: "iOS", count: 5)

// Error
//let strArray5 = ["apple", 3.14, 1]
//let strArray6 = []	// Type Unknown


// 초기화 되지 않은 배열은 아직 메모리 공간을 할당받지 않은 상태
var cities : Array<String>

// 따라서 초기화를 해주어 메모리 공간을 할당받아야 한다.
cities = Array() // 또는 Array<String>(), cities = [String](), cities = []
```

Q1) String, Int 타입으로 각각 자료가 없는 빈 배열을 만들어 보세요.
``` Swift
var stringArray: Array<String> = []
var intArray: Array<Int> = []
```

Q2) Double, Bool 타입으로 임의의 값을 넣어 초기화하는 배열을 만들어 보세요.
``` Swift
var doubleArray: Array<Double> = [3.5, 1.2, 2.2]
var boolArray: Array<Bool> = [true, false]
```

- Number of Elements
``` Swift
let fruits = ["Apple", "Orange", "Banana"]
let countOfFruits = fruits.count
if !fruits.isEmpty {
	print("\(countOfFruits) element(s)")
} else {
	print("empty array")
}
```

- Retrieve an Element
``` Swift
// startIndex, endIndex

fruits[fruits.startIndex]
//fruits[fruits.endIndex]	// endIndex - 1
fruits[fruits.endIndex - 1]
```

- Searching
``` Swift
let alphabet = ["A", "B", "C", "D", "E"]

if alphabet.contains("A") {
	print("contains A")
}

if alphabet.contains(where: { str -> Bool in
	// code...
	print(str)
	// return alphabet 배열을 모두 볼 때까지 돔(for문 같음)
	// "E" 인 경우 "A", "B", "C", "D", "E" 모두 확인
	return str == "A"
}) {
	print("contains A")
}

if let index = alphabet.firstIndex(of: "Q") {
	print("index of D: \(index)")
} else {
	print("No index")
}
```

- Add a new Element
``` Swift
//var alphabetArray: Array<String> = []
//var alphabetArray: [String] = []
//var alphabetArray = [String]()

var alphabetArray = ["A"]
alphabetArray.append("B")
alphabetArray += ["C"]
alphabetArray

var alphabetArray2 = ["Q", "W", "E"]
alphabetArray + alphabetArray2

//alphabetArray.append(5.0)
//alphabetArray + 1

alphabetArray.insert("S", at: 0)
alphabetArray.insert("F", at: 3)
alphabetArray
```

- Change an Existing Element
``` Swift 
alphabetArray = ["A", "B", "C"]
alphabetArray[0] = "Z"
alphabetArray


1...5
1..<5
alphabetArray = ["A", "B", "C", "D", "E", "F"]
alphabetArray[2...]
alphabetArray[2...] = ["Q", "W", "E"]
alphabetArray


// 추가 20200429
var alphabet = ["a", "b", "c", "d", "e"]
alphabet[1...2] // "b", "c"

alphabet[1...2] = ["1", "2", "3"]
alphabet	// "a", "1", "2", "3", "d", "e"
// 이런식으로 1...2 만 보면 "b", "c" 두 개만 바꿔주는 것 같지만 "b", "c" 자리에는 "1", "2"가 들어가고 추가적으로 "3"이 추가되어 들어간다.

alphabet[2...4] = ["A"]
alphabet    // "a", "1", "A", "e"
// 위와 마찬가지로 2...4에 "A"만 넣게되면 "2", "3", d"가 없어지고 "A"로 대체된다.
```

- Remove an Element
``` Swift
alphabetArray = ["A", "B", "C", "D", "E"]

let removed = alphabetArray.remove(at: 0)
alphabetArray

alphabetArray.removeAll()


// index 찾아 지우기
alphabetArray = ["A", "B", "C", "D", "E"]

if let indexC = alphabetArray.firstIndex(of: "C") {
	alphabetArray.remove(at: indexC)
}
alphabetArray
```

- Sorting
``` Swift
alphabetArray = ["A", "B", "C", "D", "E"]
alphabetArray.shuffle() // shuffle: 자기자신이 sfuffle  & shuffled shuffle 된 데이터  반환
alphabetArray.sort()

// sort by closure syntax
sortedArray = alphabetArray.sorted { $0 > $1 }
alphabetArray.sorted(by: >= )
sortedArray
```

- Enumerating an Array
```Swift

// 배열의 인덱스와 내용을 함께 알고 싶을 때

let array = ["Apple", "Orange", "Melon"]

for value in array {
  if let index = array.firstIndex(of: value) {
	print("\(index) - \(value)")
	}
}

for tuple in array.enumerated() {
		print("\(tuple.0) - \(tuple.1)")
		//  print("\(tuple.offset) - \(tuple.element)")
}

for (index, element) in array.enumerated() {
	print("\(index) - \(element)")
}


for (index, element) in array.reversed().enumerated() {
	print("\(index) - \(element)")
}
````

Q1) ["p", "u", "p", "p", "y"] 라는 값을 가진 배열에서 마지막 "p" 문자 하나만 삭제하기
``` Swift
var dogArray : Array<String> = ["p", "u", "p", "p", "y"]

if let deleteChar = dogArray.lastIndex(of: "p") {
    dogArray.remove(at: deleteChar)
}
print(dogArray)
```

Q2) 정수 타입의 배열을 2개 선언하고 두 배열의 값 중 겹치는 숫자들로만 이루어진 배열 만들기
- [1, 2, 4, 8, 9, 12, 13] , [2, 5, 6, 9, 13]  -->  [2, 9, 13]
``` Swift
let firstIntArray  : Array<Int> = [1, 2, 4, 8, 9, 12, 13]
let secondIntArray : Array<Int> = [2, 5, 6, 9, 13]
var resultIntArray : Array<Int> = []

for i in firstIntArray {
	for j in secondIntArray {
		if i == j {
			resultIntArray.append(i)
		}
	}
}
resultIntArray
```

Q3) 정수 타입의 배열을 선언하고 해당 배열 요소 중 가장 큰 값을 반환하는 함수
- [50, 23, 29, 1, 45, 39, 59, 19, 15] -> 59
``` Swift
let maxSearchTemp = [50, 23, 29, 1, 45, 39, 59, 19, 15]
func maxIntSearch(_ searchArray: Array<Int>) -> Int {
    return (searchArray.sorted{$0 > $1})[0]
}
maxIntSearch(maxSearchTemp)

// OR
maxSearchTemp.max() //를 사용해도 됨

// OR
func maximumValue(in list: [Int]) -> Int {
	var maxValue = Int.min
	for number in list {
		maxValue = max(maxValue, number)

		// 위 함수는 다음의 3항 연산자와 동일
		//     maxValue = maxValue < number ? number : maxValue
	}
	return maxValue
}
maximumValue(in: [50, 23, 29, 1, 45, 39, 59, 19, 15])
maximumValue(in: [10, 20, 30, 80, 50, 40])
maximumValue(in: [-6, -5, -4, -3, -2, -1])
```


### Dictionary
- Element = Unique Key + Value
- Unordered Collection

- Dictionary Literal
``` Swift
//var dictFromLiteral = ["key 1": "value 1", "key 2": "value 2"]
//var dictFromLiteral = [1: "value 1", 2: "value 2"]
//var dictFromLiteral = ["1": 1, "2": 2]
//dictFromLiteral = [:]

// 오류
//var dictFromLiteral = [:]
```

- Dictionary Type
``` Swift
let words1: Dictionary<String, String> = ["A": "Apple", "B": "Banana", "C": "City"]
let words2: [String: String] = ["A": "Apple", "B": "Banana", "C": "City"]
let words3 = ["A": "Apple", "B": "Banana", "C": "City"]
```

Q1) 키가 String이고 값이 Int 타입인, 자료가 없는 상태의 빈 딕셔너리를 만드세요.
``` Swift
let testDic: Dictionary<String, Int> = [:]
```

Q2) Type Annotation 과 Type Inference 방식을 모두 이용해 여러 가지 데이터를 넣어 딕셔너리를 만들어보세요.
``` Swift
let testDic2 = ["Test1":"Yes", "Test2":"No"]
let testDic3: [Double:String] = [3.14:"wonwon", 5.18:"gwangju"]
```

- Number of Elements
``` Swift
var words = ["A": "Apple", "B": "Banana", "C": "City"]
let countOfWords = words.count

if !words.isEmpty {
	print("\(countOfWords) element(s)")
} else {
	print("empty dictionary")
}
```

- Retrieve an Element
``` Swift
//var words = ["A": "Apple", "B": "Banana", "C": "City"]
if let aValue = words["A"] {
	print(aValue)
} else {
	print("Not found")
}

let keys = Array(words.keys)
let values = Array(words.values)
```

- Enumerating an Dictionary
``` Swift
let dict = ["A": "Apple", "B": "Banana", "C": "City"]

for (key, value) in dict {
	print("\(key): \(value)")
}

for (key, _) in dict {
	print("Key :", key)
}

for (_, value) in dict {
	print("Value :", value)
}

for value in dict.values {
	print("Value :", value)
}
```

- Searching
//var words = ["A": "Apple", "B": "Banana", "C": "City"]
``` Swift
for (key, _) in words {
	if key == "A" {
		print("contains A key.")
	}
}

// OR
if words.contains(where: { (key, value) -> Bool in
	return key == "A"
}) {
	print("contains A key.")
}
```

- Add a New Element
``` Swift
words = ["A": "A"]

words["A"]    // Key -> Unique

words["A"] = "Apple"
words

words["B"] = "Banana"
words

words["C"] = "City"
words
```

- Change an Existing Element
``` Swift
print("\n---------- [ Change ] ----------\n")

words = [:]
words["A"] = "Application"
words

words["A"] = "App"
words


// 키가 없으면 데이터 추가 후 nil 반환,
// 키가 이미 있으면 데이터 업데이트 후 oldValue 반환

if let oldValue = words.updateValue("Apple", forKey: "A") {
	print("\(oldValue) => \(words["A"]!)")
} else {
	print("Insert \(words["A"]!)")
}
```

- Remove an Element
``` Swift
words = ["A": "Apple", "I": "IPhone", "S": "Steve Jobs", "T": "Timothy Cook"]
words["S"] = nil
words["Z"] = nil


// 지우려는 키가 존재하면 데이터를 지운 후 지운 데이터 반환, 없으면 nil
if let removedValue = words.removeValue(forKey: "T") {
	print("\(removedValue) removed!")
}
words

words.removeAll()
```

- Nested
``` Swift
var dict1 = [String: [String]]()
//dict1["arr"] = "A"

dict1["arr1"] = ["A", "B", "C"]
dict1["arr2"] = ["D", "E", "F"]
dict1


var dict2 = [String: [String: String]]()
dict2["user1"] = [
	"name": "나개발",
	"job": "iOS 개발자",
	"hobby": "코딩",
]
dict2["user2"] = [
	"name": "나코딩",
	"job": "Android 개발자",
	"hobby": "코딩",
]


[
	"name": "나개발",
	"job": "iOS 개발자",
	"age": 20,
	"hobby": "코딩",
	"apps": [
		"이런 앱",
		"저런 앱",
		"잘된 앱",
		"망한 앱",
	],
	"teamMember": [
		"designer": "김철수",
		"marketer": "홍길동",
	]
] as [String: Any]
```

- Question
Q1) Dictionary로 저장되어 있는 시험 성적의 평균 점수 구하기
``` Swift
let scoresDic = ["kor": 92,"eng": 88, "math": 96, "science": 89]

var sumScore: Int = 0
for index in scoresDic.values {
    sumScore += index
}
Double(sumScore) / Double(scoresDic.count)
```

Q2) Dictionary로 저장된 scores 데이터를 튜플 타입을 지닌 배열로 변환하여 저장하기
``` Swift
let scoresDic2 = ["kor": 92,"eng": 88, "math": 96, "science": 89]
var tupleArray : [(String, Int)] = []

// 1번 방법
for (key, value) in scoresDic2 {
	tupleArray.append((key, value))
}

// 2번 방법
for dict in scoresDic2 {
	tupleArray.append(dict)
}

// 3번 방법
tupleArray = Array(scoresDic2)
```


Q3) 주어진 자료를 보고 Dictionary 자료형에 맞게 데이터를 변수에 저장하기
``` Swift
let pastcampusList : Dictionary<String, Any> = [
	"패스트캠퍼스" : [
		"스쿨" : ["iOS 스쿨", "백엔드 스쿨", "프론트엔드. 스쿨"],
		"캠프" : ["A 강의", "B 강의"],
		"온라인" : ["C 강의", "D 강의"]
	]
]
```


Q4) 위 문제에서 정의한 변수의 데이터 중 스쿨 배열에 저장된 첫번째 데이터를 꺼내어 출력하기
``` Swift
fastcampus["패스트캠퍼스"]!["스쿨"]![0]
```

***
### Set
- Unordered Collection
- Unique Value
- Set Literal = Array Literal
- 배열 / 딕셔너리에 비해 중요도

<img src="https://github.com/1000JI/TIL/blob/master/picture/Set.png" width="300px" height="200px" title="Set_Array_Dictionary" alt="Smile"></img><br/>

``` Swift
let fruitsSet: Set<String> = ["Apple", "Orange", "Melon"]
let numbers: Set = [1, 2, 3, 3, 3]
let emptySet = Set<String>()
```

- Searching
``` Swift
let productSet: Set = ["iPhone", "iPad", "Mac Pro", "iPad Pro", "Macbook Pro"]

for element in productSet {
	if element.hasPrefix("i") {	// "i"로 시작되는지 체크
		print(element)
	}
}
```

- Add a New Element
``` Swift
var stringSet: Set<String> = []
stringSet.insert("Apple")
stringSet

stringSet.insert("Orange")
stringSet

stringSet.insert("Orange")
stringSet
```

- Remove an Element
``` Swift
stringSet = ["Apple", "Orange", "Melon"]
stringSet.remove("Apple")

if let removed = stringSet.remove("Orange") {
	print("\(removed) has been removed!")
}
stringSet.removeAll()
```

- Compare two sets
``` Swift
var favoriteFruits = Set(["Apple", "Orange", "Melon"])
var tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

if favoriteFruits == tropicalFruits {
	print("favoriteFruits == tropicalFruits")
} else {
	print("favoriteFruits != tropicalFruits")
}


var favoriteFruits1 = Set(["Orange", "Melon", "Apple"])
var favoriteFruits2 = Set(["Apple", "Melon", "Orange"])

favoriteFruits1 == favoriteFruits2 // true
favoriteFruits1.elementsEqual(favoriteFruits2) // false, 순서까지 비교


// 포함 관계 여부. 상위/하위 집합.
// group1 ⊇ group2
let group1: Set = ["A", "B", "C"]
let group2: Set = ["A", "B"]


// superset
group1.isSuperset(of: group2)		//true
group1.isStrictSuperset(of: group2)	//true

// strictSuperset - 자기 요소 외 추가 요소가 최소 하나 이상 존재해야 함
group1.isSuperset(of: group1)		//true
group1.isStrictSuperset(of: group1)	//false

// subset도 같은 방식
group2.isSubset(of: group1)			//true
group2.isStrictSubset(of: group1)	//true
group2.isStrictSubset(of: group2)	//false
```


- Fundamental Set Operations
	* intersection - 교집합
	* symmetricDifference - 교집합의 여집합
	* union - 합집합
	* subtracting - 차집합

- intersection
``` Swift
favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

// 교집합에 해당하는 요소를 반환
let commonSet = favoriteFruits.intersection(tropicalFruits)
commonSet

// 교집합에 해당하는 요소만 남기고 나머지 제거
tropicalFruits.formIntersection(favoriteFruits)
tropicalFruits
```

- symmetricDifference
``` Swift
favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

// 교집합의 여집합 요소들을 반환
let exclusiveSet = favoriteFruits.symmetricDifference(tropicalFruits)
exclusiveSet
```

- union
``` Swift
favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

// 합집합 반환
var unionSet = favoriteFruits.union(tropicalFruits)
unionSet
```

- subtracting
``` Swift
favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

// 차집합 반환
let uncommonSet = favoriteFruits.subtracting(tropicalFruits)
uncommonSet
```
