
# 타입캐스팅(Type Casting)

## 1. Swift Type Casting
- **인스턴스 타입을 확인하는 용도** 로 사용한다.
- 클래스의 인스턴스를 **부모 혹은 자식 클래스의 타입으로 사용 할 수 있는지** 확인하는 용도로 사용한다.
- **is**, **as** 를 사용한다.
``` Swift
let intToDouble = Double(2)
```
> 형 변환은 타입캐스팅이 아니라 **새로운 값을 생성**하는 것이다.

## 2. 예제 클래스 소스
``` Swift
class Person {
    var name: String = ""
    func walk() {
        print("걸어갑니다")
    }
}

class Student: Person {
    var school: String = ""
    func doToStudy() {
        print("공부를 합니다")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToOT() {
        print("오리엔테이션을 갑니다")
    }
}

var jiwoon: Person = Person()
var jinsu: Student = Student()
var jiyun: UniversityStudent = UniversityStudent()
```

## 3. 타입 확인
> **is**를 사용하여 타입을 확인 할 수 있다.

``` Swift
var result: Bool

result = jiwoon is Person               // true
result = jiwoon is Student              // false
result = jiwoon is UniversityStudent    // false

result = jinsu is Person                // true
result = jinsu is Student               // true
result = jinsu is UniversityStudent     // false

result = jiyun is Person                // true
result = jiyun is Student               // true
result = jiyun is UniversityStudent     // true

if jiwoon is UniversityStudent {
    print("jiwoon 대학생입니다")
} else if jiwoon is Student {
    print("jiwoon 학생입니다")
} else if jiwoon is Person {
    print("jiwoon 사람입니다")
} // jiwoon 사람입니다

switch jinsu {
case is Person:
    print("jinsu 사람입니다")
case is Student:
    print("jinsu 학생입니다")
case is UniversityStudent:
    print("jinsu 대학생입니다")
default:
    print("jinsu 사람도, 학생도, 대학생도 아닙니다")
} // jinsu 사람입니다
```

## 4. 업캐스팅(Up Casting)
- **as**를 사용하여 **부모클래스의 인스턴스**로 사용 할 수 있도록 컴파일러에게 타입정보를 전환해준다.
- **Any** 혹은 **AnyObject**로도 타입정보를 변환 할 수 있다.
- 암시적로도 처리가 되므로 꼭 필요한 경우가 아니라면 생략해도 무방하다.

``` Swift
// UniversityStudent 인스턴스를 생성하여 Person 행세를 할 수 있도록 업 캐스팅
var gildong: Person = UniversityStudent() as Person

var heedong: Student = Student()
// var ddochi: UniversityStudent = Person() as UniversityStudent   // 컴파일 오류

// UniversityStudent 인스턴스를 생성하여 Any 행세를 할 수 있도록 업 캐스팅
var dulri: Any = Person() // as Any 생략 가능
```

## 5. 다운캐스팅(Down Casting)
- **as?** 또는 **as!** 를 사용하여 **자식 클래스의 인스턴스**로 사용 할 수 있도록 컴파일러에게 인스턴스의 타입정보를 전환해준다.

## 5-1. 조건부 다운 캐스팅
- **as?**를 사용한다.
- 조건부이기 때문에 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 ***nil***을 반환한다. 따라서 타입은 **옵셔널 타입**이다.
``` Swift
var optionalCasted: Student?

optionalCasted = gildong as? UniversityStudent
optionalCasted = heedong as? UniversityStudent // nil
optionalCasted = dulri as? UniversityStudent // nil
optionalCasted = dulri as? Student // nil
```

## 5-2. 강제 다운 캐스팅
- **as!**를 사용한다.
- 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 **런타임 오류**가 발생한다.
- 캐스팅에 성공하면 *옵셔널 타입*이 아닌 일반 타입을 반환한다.
``` Swift
var forcedCasted: Student

optionalCasted = gildong as! UniversityStudent
//optionalCasted = heedong as! UniversityStudent // 런타임 오류
//optionalCasted = dulri as! UniversityStudent // 런타임 오류
//optionalCasted = dulri as! Student // 런타임 오류
```

## 6. 캐스팅 활용
###### 추가 공부 필요.........



***
###### 참조&강의내용: [커넥트재단](https://www.edwith.org/boostcamp_ios/)
###### [애플 공식문서 - 타입캐스팅(Type Casting)](https://docs.swift.org/swift-book/LanguageGuide/TypeCasting.html)
***
