//: [Previous](@previous)
import Foundation
/*:
 # Compatibility
 */
/*
 (O) @noescaping -> @noescaping
 (X) @noescaping -> @escaping
 (O) @escaping   -> @noescaping, @escaping
 
 밑에 있는 코드로 정리하자면 매개 변수 param이 함수 종료후에도 유지가 되냐 안되냐에 차이인 것 같다.
 유지가 되야한다면 @escaping이 필요한거고, 아니라면 @noescaping이다.
 */

class Test {
    var storedProperty: (() -> ())?
    
    func someFunction(_ param: () -> ()) {
        noEscapingClosure(param)    // (O) NoEscaping -> NoEscaping
        
//        self.storedProperty = param    // (X) required @escaping
//        escapingClosure(param)   // (X) NoEscaping -> Escaping
    }
    
    func noEscapingClosure(_ param: () -> ()) {
        param()
        
//        self.storedProperty = param   // (X)
        // noEcsapingClosure가 종료되어도 안에 있는 param이 storedProperty가 갖고 있기 때문에, @escaping을 붙이라고 에러가 발생한다.
    }
    
    func escapingClosure(_ param: @escaping () -> ()) {
        self.storedProperty = param
    }
}



//: [Next](@next)
