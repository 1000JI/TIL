
# 상속(Inheritance)
## 1. SWIFT 상속
- **클래스(Class)**, **프로토콜(Protocol)** 등 상속이 가능하다.
  > 열거형(enum)과 구조체(Struct)는 상속이 불가능하다.
- **클래스(Class)** 는 **단일 상속**으로, 다중 상속은 지원하지 않는다.

## 2. 클래스(Class) 상속 문법
``` Swift
class 이름: 상속 받을 클래스 이름 {
  // 구현
}
```

## 3. 상속 사용 및 키워드 활용
- **final** 키워드를 사용하면 **재정의(override)** 를 방지 할 수 있다.
- **static** 키워드를 사용하여 타입 메서드를 생성하면 재정의가 불가능하다.
- **class** 키워드를 사용하여 타입 메서드를 생성하면 재정의가 가능하다.
- **class** 앞에 **final**을 붙이면 마치 **static** 사용 한 것과 동일하게 동작한다.
- **override** 키워드를 사용하여 부모 클래스의 메서드를 재정의 할 수 있다.

## 4. 상속 사용 코드
``` Swift
// 기반 클래스 Person
class Person {
    var name: String = ""
    
    // 일반 메소드
    func selfSayHello() {
      print("안녕~ 나는 \(name)이야~")
    }
    
    final func finalSelfSayHello() {
      print("final 나는 \(name)이야~")
    }
    
    // 타입 메소드
    // 재정의 불가 타입 메소드 - static
    static func staticTypeMethod() {
      print("Hello~ type method - static")
    }
    
    // 재정의 가능 타입 메소드 - class
    class func classTypeMethod() {
      print("Hello~ type method - class")
    }
    
    // 재정의 가능 타입 메소드 - class + final => static 동일 동작
    final class func finalClassMethod() {
      print("type method - final class")
    }
}

// Person을 상속받는 Student
class Student: Person {
    var major: String = ""
    
    override func selfSayHello() {
        print("저는 \(name)이고, 전공은 \(major)입니다")
    }
    
    override class func classTypeMethod() {
        print("overriden type method - class")
    }
    
    // static을 사용한 타입 메서드는 재정의 할 수 없다.
//    override static func staticTypeMethod() { } // error
    
    // final를 사용한 메서드, 프로퍼티는 재정의 할 수 없다.
//    override func finalSelfSayHello() { } // error
//    override class func finalClassMethod() { } // error
}
```

## 5. 상속 적용 코드
``` Swift
// 인스턴스 생성
let personTest: Person = Person()
let studentTest: Student = Student()

personTest.name = "ji"

studentTest.name = "woon"
studentTest.major = "swift"

personTest.selfSayHello()
// 안녕~ 나는 ji이야~

studentTest.selfSayHello()
// 저는 woon이고, 전공은 swift입니다


Person.classTypeMethod()
// Hello~ type method - class

Person.staticTypeMethod()
// Hello~ type method - static

Person.finalClassMethod()
// type method - final class


Student.classTypeMethod()
// overriden type method - class

Student.staticTypeMethod()
// Hello~ type method - static

Student.finalClassMethod()
// type method - final class
```


***
###### 참조&강의내용: [커넥트재단](https://www.edwith.org/boostcamp_ios/)
***
