# 2020년 05월 04일(월)



## Type Check

[ 타입 확인 - type(of: ) ]

- Any 타입: 컴파일러가 알기 어렵기 때문에 Int, String의 메소드를 사용할 수 없다.

``` swift
// Any
let anyArr: [Any] = [1, 2.0, "3"]
type(of: anyArr[0])
type(of: anyArr[1])
type(of: anyArr[2])
```



* Generic: 밑에 코드에서 보면 T는 동적으로 타입이 변경되는 것으로 보면 된다.

``` swift
// Generic
func printGenericInfo<T>(_ value: T) {
  let types = type(of: value)
  print("'\(value)' of type '\(types)'")
}
printGenericInfo(1)
printGenericInfo(2.0)
printGenericInfo("3")

/*
print
//-------------------//
'1' of type 'Int'
'2.0' of type 'Double'
'3' of type 'String'
//-------------------//

T랑 Any가 비슷한데 왜 나눠서 쓰냐? T 로 쓰게 되면 함수 내에서 고정된 타입으로 사용 할 수 있다.
Int로 정해지면 Int의 메소드나 프로퍼티를 사용 할 수 있고, Any는 Any 타입이기때문에 해당 메소드나 프로퍼티를 사용 할 수 없다.
Any를 쓸 경우 as 같은 타입캐스팅이 필요하다.
*/
```

***

[ 타입 비교 - is ]

``` swift
/***************************************************
 객체 is 객체의 타입 -> Bool (true or false)
 ***************************************************/

let number = 1
number == 1    // 값 비교
number is Int  // 타입 비교


let someAnyArr: [Any] = [1, 2.0, "3"]

for data in someAnyArr {
  if data is Int {
    print("Int type data :", data)
  } else if data is Double {
    print("Double type data : ", data)
  } else {
    print("String type data : ", data)
  }
}
```

***

[ 상속 관계 ]

- 자식 클래스 is 부모 클래스 -> true
- 부모 클래스 is 자식 클래스 -> false

```` swift
print("\n---------- [ Subclassing ] ----------\n")

class Human {
  var name: String = "name"
}
class Baby: Human {
  var age: Int = 1
}
class Student: Human {
  var school: String = "school"
}
class UniversityStudent: Student {
  var univName: String = "Univ"
}


/*
    Human
   /     \
 Baby   Student
          |
    UniversityStudent
 */

let student = Student()
student is Human // true
student is Baby // false
student is Student // true

let univStudent = UniversityStudent()
student is UniversityStudent // false
univStudent is Student // true
````

- 배열 상속 타입

````swift
let babyArr = [Baby()]
type(of: babyArr)
// Array<__lldb_expr_66.Baby>.Type

let someArr = [Human(), Baby(), UniversityStudent()]
type(of: someArr)
// Array<__lldb_expr_66.Human>.Type
// Human으로 공통적으로 묶일 수 있음 따라서 [Human] 타입으로 타입추론이 되는 것이다.

someArr[0] is Human    // true
someArr[0] is Student  // false
someArr[0] is UniversityStudent  // false
someArr[0] is Baby     // false

someArr[1] is Human    // true
someArr[1] is Student  // false
someArr[1] is UniversityStudent  // false
someArr[1] is Baby     // true

someArr[2] is Human    // true
someArr[2] is Student  // true
someArr[2] is UniversityStudent  // true
someArr[2] is Baby     // false
````

* 해당 변수의 타입 vs 실제 데이터의 타입
  * 부모 클래스 타입은 자식 클래스 타입을 가질 수 있음

```` swift
var human: Human = Student()
type(of: human) // Student Type
// 컴파일 타임, 런타임 => type(of :)는 런타임

// Q. human 변수의 타입, name 속성의 값, school 속성의 값은?
human.name    // "name" / 컴파일 타임
human.school  // error, No member / 런타임 현재 human은 Human 타입으로 알기 때문에 school을 찾을 수 없다.

// Q. Student의 인스턴스가 저장된 human 변수에 다음과 같이 Baby의 인스턴스를 넣으면?
// Human Type으로 변수를 선언하면 자식 클래스인 인스턴스를 넣을 수 있다.
human = Baby() // success
human = UniversityStudent() // success

//------------------------------------

var james = Student()
james = UniversityStudent()
//james = Baby()    // Fail

// Q. 다음 중 james 가 접근 가능한 속성은 어떤 것들인가
james.name // Human 속성
//james.age // Baby 속성
james.school // Student 속성
//james.univName // UniversityStudent 속성

//-----------------------------------

// Q. 그럼 Student 타입인 james 객체가 univName을 사용할 수 있도록 하려면 뭘 해야 할까요
if let james2 = james as? UniversityStudent {
  james2.univName
}
````

***

## Type Casting

- ```as```: 타입 변환이 확실하게 가능한 경우(업캐스팅, 자기 자신 등)에만 사용 가능. 그 외에는 컴파일 에러
- ``as?``: 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
- ```as!```: 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생

```` swift
import UIKit

class Shape {
  var color = UIColor.black
  
  func draw() {
    print("draw shape")
  }
}

class Rectangle: Shape {
  var cornerRadius = 0.0
  override var color: UIColor {
    get { return .white }
    set { }
  }
  
  override func draw() {
    print("draw rect")
  }
}

class Triangle: Shape {
  override func draw() {
    print("draw triangle")
  }
}

/*
 Shape
  - Rectangle
  - Triangle
 모두 draw() 오버라이드
 */
````

***

[ Upcasting ]

- 상속 관계에 있는 자식 클래스가 부모 클래스로 형 변환하는 것
- 업캐스팅은 항상 성공하며 as 키워드를 사용(자기 자신에 대한 타입 캐스팅도 항상 성공하므로 as 키워드 사용)

```` swift
// Shape - black, Rectangle - white
let rect = Rectangle()
rect.color
rect.cornerRadius

let t1 = rect as Shape
let t2 = rect as Rectangle

(rect as Shape).color
//(rect as Shape).cornerRadius

(rect as Rectangle).color
(rect as Rectangle).cornerRadius
````

``` swift
let upcastedRect: Shape = Rectangle()
type(of: upcastedRect)   // Rectangle

upcastedRect.color
//upcastedRect.cornerRadius // 타입 캐스팅 필요

(upcastedRect as Shape).color
(upcastedRect as! Rectangle).color // 자기자신이거나 부모클래스 인 경우가 아니기 때문에 !를 써야함

// 부모 클래스 타입으로는 항상 변경할 수 있는데, 자식 클래스로 변경할 수는 없는 이유?
// 자식 클래스 타입 <= 부모 클래스 타입
// 자식 클래스 타입 => 부모 클래스 타입
// 자식 클래스가 더 많은 속성이나 메소드를 가질 수 있기 때문에 범위가 달라서 변경할 수 없다.
```



***

[ Downcasting ]

- 형제 클래스나 다른 서브 클래스 등 수퍼 클래스에서 파생된 각종 서브 클래스로의 타입 변환 의미
- 반드시 성공한다는 보장이 없으므로 옵셔널. as? 또는 as! 를 사용

``` swift
let shapeRect: Shape = Rectangle()
var downcastedRect = Rectangle()

//downcastedRect = shapeRect // fail, 부모 타입을 자식 타입에 넣으려고 해서 오류가 발생
//downcastedRect: Rectangle = shapeRect as? Rectangle  // 옵셔널으로 반환하거나 nil을 반환하기 때문에 type을 옵셔널로 선언해줘야 한다.
downcastedRect = shapeRect as! Rectangle

//as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
//as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생



//Q. 아래 value 에 대한 Casting 결과는?
let value = 1
(value as Float) is Float   //
(value as? Float) is Float  // false, Optional이 아니라서 false가 나온다. is Float? 하면 된다.
(value as! Float) is Float  // nil이 나와서 런타임 에러 발생
```

***

[ Type Check Operator ]

``` swift
let shape = Shape()
let rectangle = Rectangle()
let triangle = Triangle()

let list = [shape, rectangle, triangle]
type(of: list)  // Shape
```

- 아래 for 문에 대한 실행 결과는?

``` swift
for elem in list {
  if elem is Shape {
    print("shape instance")
  } else if elem is Rectangle {
    print("rect instance")
  } else if elem is Triangle {
    print("triangle instance")
  }
}
// "shape instance"
// "shape instance"
// "shape instance"
// 순서를 주의해야 한다.

//-----------------------------------

for element in list  {
  element.draw()
}
// "draw shape"
// "draw rect"
// "draw triangle"
```



