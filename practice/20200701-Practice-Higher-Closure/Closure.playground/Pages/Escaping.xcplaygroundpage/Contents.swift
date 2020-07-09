//: [Previous](@previous)
import Foundation
/*:
 ---
 # Escaping
 - 함수나 메서드의 파라미터 중 클로져 타입에 @escaping 키워드 적용
 - 해당 파라미터가 함수 종료(return) 이후 시점에도 어딘가에 남아 실행될 수 있음을 나타냄
   - outlives the lifetime of the function
 - 해당 파라미터가 함수 외부에 저장(stored)되거나 async(비동기)로 동작할 때 사용
 - self 키워드 명시 필요
 ---
 */

class Callee {
    deinit { print("Callee has deinitialized") }
    
    func noEscapingFunc(closure: () -> Void) { closure() }
    func escapingFunc(closure: @escaping () -> Void) { closure() }
}


class Caller {
    deinit { print("Caller has deinitialized") }
    let callee = Callee()
    var name = "James"
    
    func selfKeyword() {
        // self keyword (X)
        callee.noEscapingFunc { name = "Giftbot" }
        
        // self keyword  (O)
        callee.escapingFunc { self.name = "Giftbot" }
        
        /*
         [ print ]
         caller = nil
         Caller has deinitialized
         Callee has deinitialized
         */
    }
    
    
    func asyncTask() {
        callee.noEscapingFunc {
            DispatchQueue.main.async {
                self.name = "Giftbot"
            }
        }
        callee.escapingFunc {
            DispatchQueue.main.async {
                self.name = "Giftbot"
            }
        }
        
        /*
         [ print ]
         caller = nil
         Caller has deinitialized
         Callee has deinitialized
         */
    }
    
    
    func captureAsStrong() {
        callee.escapingFunc {
            print("-- delay 3seconds --")
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.name = "Giftbot"
                // 3초 동안 caller, callee를 유지하고 있음
                // 하지만 해지가 안되는 경우 메모리 낭비가 발생 할 수 있음
            }
        }
        
        /*
         [ print ]
         -- delay 3seconds --
         caller = nil
         Caller has deinitialized
         Callee has deinitialized
         */
    }
    
    func weakBinding() {
        callee.escapingFunc { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                print("-- after 3seconds with weak self --")
                self?.name = "Giftbot" // 이때 self는 nil임
                print(self?.name ?? "nil")
            }
        }
        
        /*
         [ print ]
         caller = nil
         Caller has deinitialized
         Callee has deinitialized
         -- after 3seconds with weak self --
         nil
         */
        
        callee.escapingFunc { [weak self] in
            guard let self = self else { return print("Caller no exist") }
            // 이런 경우 let self가 self를 참조하고 있기 때문에 종료되지 않는다.
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                print("-- after 2seconds with weak self --")
                self.name = "Giftbot"
            }
        }
        
        /*
         [ print ]
         caller = nil
         -- after 2seconds with weak self --
         Caller has deinitialized
         Callee has deinitialized
         */
    }
    
    func unownedBinding() {
        callee.escapingFunc { [unowned self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                print("-- after 3seconds with unowned self --")
                print("Oops!!")
                
                self.name = "Giftbot"
                print(self.name)
            }
        }
        
        /*
         [ print ]
         caller = nil
         Caller has deinitialized
         Callee has deinitialized
         -- after 3seconds with unowned self --
         Oops!!
         Fatal error: Attempted to read an unowned reference but object 0x600001654c00 was already deallocated
         */
    }
}


var caller: Caller? = Caller()
caller?.selfKeyword()
//caller?.asyncTask()
//caller?.captureAsStrong()
//caller?.weakBinding()
//caller?.unownedBinding()

print("caller = nil")
caller = nil




//: [Next](@next)
