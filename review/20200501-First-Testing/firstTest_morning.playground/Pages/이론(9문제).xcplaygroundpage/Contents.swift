//: [Previous](@previous)
import UIKit

/***************************************************
 1. Array, Set, Dictionary 의 차이점에 대해 설명하고 예시 코드 작성
 ***************************************************/
/*
 Array는 순서있는 Collection
 */
let arrayValue : Array<Int> = Array(1...5)
print(arrayValue)

/*
 Set는 순서 없고, 중복 값이 없는 Collection
 */
let setValue : Set<Int> = [1, 2, 3, 4, 5, 1, 2, 3]
print(setValue)

/*
 Dictionary는 키와 밸류로 이루어져 있는 Collection
 */
let dictionaryValue : Dictionary<String, Any> = ["test1": 12345, "test2": 3.5]
print(dictionaryValue)


/***************************************************
 2. Value Type, Reference Type 에 대한 예시와 그 차이점에 대해 설명
 ***************************************************/
/*
 Value Type은 값만 복사하기 때문에 원본 데이터에 영향을 줄 수 없다.
 Reference Type은 주소 값을 참조하기 때문에 원본 데이터를 수정 할 수 있다.
 */
// Value Type
var valueTypeA = 5
var valueTypeB = valueTypeA
valueTypeB = valueTypeB + 1

print(valueTypeA, valueTypeB)   // valueTypeA != valueTypeB

// Reference Type
class TestClass {
    var testValue: Int = 0
}
var referTypeA = TestClass()
var referTypeB = referTypeA
referTypeB.testValue += 1

print(referTypeA.testValue, referTypeB.testValue) // referTypeA.testValue == referTypeB.testValue



/***************************************************
 3. Application의 LifeCycle의 각 상태에 대해 설명
 ***************************************************/
/*
 Not Running
    - 말 그대로 실행되지 않고 있는 상태
 
 Foreground
    - Active: 앱이 실행되고 있으며 이벤트를 받고 있는 상태
    - inActive: 앱이 실행되고는 있지만 이벤트를 받고 있지 않은 상태
                예를 들면, 실행 중 알람 창으로 덮어지는 경우
 
 Background
    - 음악 재생 같이 화면에는 보이지 않지만 동작하고 있는 상태
 
 
 Suspend
    - 빠른 재실행을 위해 메모리에는 적재되어 있지만 동작하고 있지 않는 상태
 
 */



/***************************************************
 4. ViewController LifeCycle의 각 상태에 대해 설명
 ***************************************************/
/*
 viewDidLoad()
    - outlet들은 이미 메모리에 올라가 있는 상태이며, 뷰를 구성하기 위한 데이터를 가져오는 작업을 함(네트워크 통신 같은..?)
 
 viewWillAppear()
    - View controller 화면이 올라온 후 호출되는 메소드
    - UI내에 소리를 재생한다거나 애니메이션을 넣을 때 사용함
 
 viewDidAppear()
    - View, 데이터가 모두 화면에 나타나고 호출되는 메소드
 
 viewWillDisAppear()
    - view가 사라지기 직전에 동작하는 메소드(Original View Controller 가 사라지기전에 호출)
 
 viewDidDisAppear()
    - view가 사라진 직후 동작하는 메소드(자원 해제 같은 역할을 함)
    - 예를 들어 notification을 듣는 행위를 멈추기, 다른 객체의 속성을 observing하는것을 멈추기, 디바이스의 센서를 점검하거나 네트워크를 호출하는 행위들은 화면이 사라지고 나서는 필요 없는 작업들
 */



/***************************************************
 5. 다음 4개의 키워드 (continue, break, return, fallthrough)가 쓰이는 위치와 역할에 대해 각각 설명
 ***************************************************/
/*
 1. continue
    - for문 같이 반복문 중간에 다음 인덱스로 넘어가거나 할 때 사용 함
 2. break
    - for문 같이 반복문 중간에 조건에 충족할 시 반복문에서 빠져나오거나 할 때 사용함
 3. return
    - 함수를 종료시키거나 함수를 종료하며 데이터를 반환 할 때 사용함
 4. fallthrough
    - switch 문에서 하나의 case 실행 후 그 밑에 있는 case 또는 default까지 실행하고 싶을 때 사용
    swtich x {
        case 1:
            print("aa")
            fallthrough
        case 2:
            print("bb")
        ...
    }
    // 출력 -> "aa" \n "bb"
 */



/***************************************************
 6. Init 메서드가 필요한 경우와 그렇지 않은 경우의 차이점에 대해 설명
 ***************************************************/
/*
 Protocol 같이 설계만 잡아주는 경우에는 Init 메서드를 사용할 필요가 없지만
 Class 같은 경우 Init을 하여 값을 초기화(값을 넣어주거나 옵셔널 선언) 해줘야 한다.
 */



/***************************************************
 7. Access Level 을 각 단계별로 나열하고 그 차이점에 대해 설명
 ***************************************************/
/*
 Open(가장 개방적): Public + can subclass/override
 Public: External modules have access to you
 Internal(Default): within module
 Fileprivate: within .swift file
 Private(가장 제한적): Within enclosing scope
 */



/***************************************************
 8. OOP 4대 특성에 대해 나열하고 각 특성에 대해 아는 만큼 설명 및 예시 코드 작성
 ***************************************************/
/*
 1. 추상화
    - struct 같이 비슷한 특징을 모아 하나의 타입으로 만드는 것을 말함
 */
struct ChuTest {
    var intValue: Int
    var stringValue: String
}
    
/*
 2. 캡슐화
    - 데이터 은닉을 위해 사용함(보안성)
 */

class CapTest {
    private var value: Int = 0  // 데이터 은닉
    
    func valueGet() -> Int {
        return value
    }
    
    func valueSet(_ index: Int) {
        value = index
    }
}
let testCap = CapTest()
testCap.valueGet()
testCap.valueSet(5)
testCap.valueGet()

/*
 3. 상속성
    - 상위 클래스를 상속 받아 부모 클래스에 있는 프로퍼티 또는 메소드를 사용할 수 있다
 */
class ParentClass {
    var intValue: Int = 0
    var stringValue: String = ""
    
    func printHello() {
        print("Hello, World!")
    }
}

class ChildClass: ParentClass {
    var doubleValue: Double = 3.5
}

let classValue = ChildClass()
classValue.intValue
classValue.stringValue
classValue.printHello()
classValue.doubleValue


/*
 4. 다형성
    - overriding 이나 overloading 같은 것을 말하며 오버라이딩(한글로 씀)은 부모 클래스에 정의된 메소드를 재정의하여 사용하는 것이며,
    - 오버로딩은 같은 메소드 이름에 매개변수만 달리하여 정의할 때 사용함
 */

// overriding (위에 데이터를 사용함)
class ChildClass2: ParentClass {
    override func printHello() {
        print("No Hello....")
    }
}
let classValue2 = ChildClass2()
classValue2.printHello()


// overloading
class OverLoadClass {
    func printTest() {
        print("Hi, there~")
    }
    
    func printTest(_ index: Int) {
        print("Hi, \(index)")
    }
    
    func printTest(_ index: Int, _ string: String) {
        print("Hi, \(index) : \(string)")
    }
}
let overLoadValue = OverLoadClass()
overLoadValue.printTest()
overLoadValue.printTest(5)


/***************************************************
 9. Frame 과 Bounds가 무엇이고, 둘의 차이점은 어떤 것이 있는지 설명
 ***************************************************/
/*
 Frame
    - 상위(부모뷰) 뷰에서의 좌표를 나타내며 selfView.frame.origin = CGPoint(0, 0)을 하면 부모뷰의 0,0 좌표로 selfView가 이동한다.
 Bounds
    - 자기 자신의 좌표를 나타내며 selfView.bounds.origin = CGPoint(5, 5)를 하면 자식 뷰들이 -5, -5 만큼 이동한다.
    - 마치 자식 뷰들이 움직이는 것 처럼 보임
 */



/***************************************************
 위 개념들은 아직 익숙치 않아서 답변하지 못한 분들이 많을 수 있지만
 중요한 내용들이니 답하지 못한 질문들은 체크해두었다가 천천히 공부하세요.
 ***************************************************/


//: [Next](@next)
