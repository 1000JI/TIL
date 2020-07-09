//: [Previous](@previous)
import Foundation
//: # MemoryLeak

//print("\n---------- [ Lazy var closure ] ----------\n")

// Dog instance has bark property
//        ⬇︎     ⇡
// bark property has Dog instance

final class Dog {
    let name: String = "토리"
    
    lazy var bark: () -> () = {  [unowned self] in
        print(self.name + "가 짖습니다.", terminator: " ")
    }
    deinit { print("이 문장 보이면 아님 ->", terminator: " ") }
}

var dog: Dog? = Dog()
dog?.bark()
dog = nil
// 강한 순환 참조를 하고 있기 때문에 nil을 넣어줘도 Dog와 bark는 서로 연결되어 있어 종료되지 않는다.
// 따라서 unowned를 쓰거나, weak을 써줘서 약한 참조를 해줘야 된다.
print("메모리 릭!\n")

// print => "토리가 짖습니다. 이 문장 보이면 아님 -> 메모리 릭!"





print("\n---------- [ weak capture ] ----------\n")

final class Callee {
    deinit { print("🔫🔫 응. 아니야.") }
    var storedProperty: (() -> ())?
    
    func noEscapingFunc(closure: () -> Void) {
//        self.storedProperty = closure    // Compile Error
    }
    func escapingFunc(closure: @escaping () -> Void) {
        self.storedProperty = closure
    }
}


final class Caller {
    let callee = Callee()
    var name = "James"
    
    func memoryLeak() {
        // 1)
        // Caller has callee
        //    ⬇︎        ⬆︎
        // Callee has caller
//        callee.escapingFunc {
//            self.name = "Giftbot"
//        }
        
        // 2) weak을 줘서 강한 순환 참조를 끊어줌
//        callee.escapingFunc { [weak self] in
//            self?.name = "Giftbot"
//        }
    }
    
    func anotherLeak() {
        // 1)
//        callee.escapingFunc {
//            DispatchQueue.main.async { let _ = 1 + 1 }
//            // caller와 관련된게 없으면 캡처할게 없어서 메모리릭 발생하지 않는다.
//        }
        
        // 2)
//        callee.escapingFunc {
//            DispatchQueue.main.async { [weak self] in
//                self?.name = "Giftbot"
//                /*
//                 메모리릭 발생.. weak self를 써줬지만 시점이 문제다.
//                 DispatchQueue가 사용하는 self는 즉, < calle.escapingFunc { [self] in >
//                 이렇게 되어있다고 볼 수 있다. 1번에서도 마찬가지지만, 그 안에서 self를 참조하는 것이 없기 때문에
//                 메모리 릭이 발생하지 않았는데, 2번은 [weak self]에서 [self]를 참조하고 있기 때문에 메모리릭이 발생한다.
//                */
//            }
//        }
        
        // 3)
        callee.escapingFunc { [weak self] in
            DispatchQueue.main.async {
                self?.name = "Giftbot"
                /*
                 이번에는 DispatchQueue에서 [self]를 쓰더라도, [weak self]를 참조한 거라,
                 [weak self]가 종료되면 [self]도 종료된다.
                 */
            }
        }
    }
}

print("버그??? 🐛🐛🐛", terminator: "  ")

var caller: Caller? = Caller()
//caller?.memoryLeak()
caller?.anotherLeak()


DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
    caller = nil
}



//: [Next](@next)
