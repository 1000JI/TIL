import UIKit

/*
 1. width, height 속성을 가진 Rectangle 클래스 정의 v
 2. 생성자(초기화 메서드)에서 width, height 프로퍼티 값을 설정할 수 있도록 구현 v
 3. 사각형의 가로 세로 길이를 변경할 수 있는 메서드 구현 v
 4. 사각형 가로와 세로의 길이를 반환하는 메서드 구현 v
 5. 사각형의 넓이를 반환하는 메서드 구현 v
 6. 다음과 같은 속성을 지닌 인스턴스 생성
 - 직사각형 1개 속성: width = 10, height = 5
 - 정사각형 1개 속성: width = 7, height = 7
 */

class Rectangle {
    var width   : Int
    var height  : Int
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
    
    func setWidth(width: Int) {
        self.width = width
    }
    
    func setHeight(height: Int) {
        self.height = height
    }
    
    func getWidth() -> Int {
        return self.width
    }
    
    func getHeight() -> Int {
        return self.height
    }
    
    func calcArea() -> Int {
        return self.width * self.height
    }
}

let rectangle = Rectangle(width: 10, height: 5)
rectangle.calcArea()
rectangle.getWidth()
rectangle.setWidth(width: 5)
rectangle.getWidth()

let square = Rectangle(width: 7, height: 7)


/*
 1. 채널 정보, Volume 값, 전원 설정여부를 속성으로 가지는 클래스 정의 v
 2. TV 의 현재 채널 및 볼륨을 변경 가능한 메서드 구현 v
 3. TV 의 현재 채널 및 볼륨을 확인할 수 있는 메서드 구현 v
 4. TV 전원이 꺼져있을 때는 채널과 볼륨 변경을 할 수 없도록 구현
    (직접 프로퍼티에 값을 설정할 수 없다고 가정)
 5. 채널과 볼륨 정보를 확인했을 때 TV 전원이 꺼져있으면 -1 이 반환되도록 구현
 */

class TV {
    private var channelValue    : Int
    private var volumeValue     : Int
    var isPower                 : Bool
    
    init() {
        self.channelValue = 15
        self.volumeValue = 5
        self.isPower = false
    }
    
    func setChannel(channel: Int) {
        if isPower { self.channelValue = channel }
    }
    
    func setVolume(volume: Int) {
        if isPower { self.volumeValue = volume }
    }
    
    func getChannel() -> Int {
        guard isPower else { return -1 }
        return self.channelValue
    }
    
    func getVolume() -> Int {
        guard isPower else { return -1 }
        return self.volumeValue
    }
}
let tv = TV()
tv.getChannel()
tv.getVolume()
tv.isPower = true
tv.getChannel()
tv.getVolume()
tv.setVolume(volume: 7)
tv.setChannel(channel: 11)
tv.getChannel()
tv.getVolume()



/*
 1. 사각형의 길이를 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 2. 원의 반지름을 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 */

class Square {
    var width   : Int
    var height  : Int
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
    
    func getCircumference() -> Int {
        return 2 * (self.width + self.height)
    }
    
    func getCalcArea() -> Int {
        return self.width * self.height
    }
}


class Circle {
    var radius  : Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func getCircumference() -> Double {
        return (2 * self.radius * 3.14)
    }
    
    func getCalcArea() -> Double {
        return (self.radius * self.radius * 3.14)
    }
}

var circle = Circle(radius: 5)
circle.getCalcArea()
circle.getCircumference()



// Study

/*
 1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
    구현 내용은 자유롭게
  
  ** 강아지 (Dog)
  - 속성: 이름, 나이, 몸무게, 견종
  - 행위: 짖기, 먹기
 */
class Dog {
    var name    : String
    var age     : Int
    var weight  : Double
    var kind    : String
    
    init(test: String, age: Int, weight: Double, kind: String) {
        self.name = test
        self.age = age
        self.weight = weight
        self.kind = kind
    }
    
    func brakFunc() {
        print("wall!! wall!!!!")
    }
    
    func eatFunc() {
        self.weight += 0.5
        print("weight + 0.5kg")
    }
}


/*
  ** 학생 (Student)
  - 속성: 이름, 나이, 학교명, 학년
  - 행위: 공부하기, 먹기, 잠자기
 */
class Student {
    var name    : String
    var age     : Int
    var school  : String
    var grade   : Int
    
    init(name: String, age: Int, school: String, grade: Int) {
        self.name = name
        self.age = age
        self.school = school
        self.grade = grade
    }
    
    func doStudy() {
        print("study...")
    }
    
    func doEat() {
        print("eat...")
    }
    
    func doSleep() {
        print("sleep")
    }
}
    
/*
  ** 아이폰(IPhone)
  - 속성: 기기명, 가격, faceID 기능 여부(Bool)
  - 행위: 전화 걸기, 문자 전송

  ** 커피(Coffee)
  - 속성: 이름, 가격, 원두 원산지
 */



/*
 2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
  
  ** 계산기 (Calculator)
  - 속성: 현재 값
  - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
  
  ex)
  let calculator = Calculator() // 객체생성
  
  calculator.value  // 0

  calculator.add(10)    // 10
  calculator.add(5)     // 15
  
  calculator.subtract(9)  // 6
  calculator.subtract(10) // -4
  
  calculator.multiply(4)   // -16
  calculator.multiply(-10) // 160
  
  calculator.divide(10)   // 16
  calculator.reset()      // 0
 */
class Calculator {
    var presentValue: Int = 0
    
    func add(_ value: Int) -> Int {
        self.presentValue += value
        return self.presentValue
    }
    
    func subtract(_ value: Int) -> Int {
        self.presentValue -= value
        return self.presentValue
    }
    
    func multiply(_ value: Int) -> Int {
        self.presentValue *= value
        return self.presentValue
    }
    
    func divide(_ value: Int) -> Int {
        self.presentValue /= value
        return self.presentValue
    }
    
    func reset() {
        self.presentValue = 0
    }
}

let calculator = Calculator() // 객체생성

calculator.presentValue  // 0

calculator.add(10)    // 10
calculator.add(5)     // 15

calculator.subtract(9)  // 6
calculator.subtract(10) // -4

calculator.multiply(4)   // -16
calculator.multiply(-10) // 160

calculator.divide(10)   // 16
calculator.reset()      // 0

/*
 3. 첨부된 그림을 참고하여 각 도형별 클래스를 만들고 각각의 넓이, 둘레, 부피를 구하는 프로퍼티와 메서드 구현하기
 */
