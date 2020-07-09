//: [Previous](@previous)
//: # CaptureList
/*:
 ---
 ## Value Type
 ---
 */
print("\n---------- [ Value Type ] ----------\n")

var a = 0
var b = 0
var c = 0
var result = 0


let valueCapture1 = {
    result = a + b + c
    print("내부 값 :", a, b, c, result)
}

(a, b, c) = (1, 2, 3)
result = a + b + c
print("초기 값 :", a, b, c, result)

valueCapture1()  //  1,2,3,6

print("최종 값 :", a, b, c, result)
print()


// Capture List : [a, b]

let valueCapture2 = { [a, b] in // a: 1, b: 2 이것을 "Capture"
    result = a + b + c
    print("내부 값 :", a, b, c, result)
}

(a, b, c) = (7, 8, 9)
result = a + b + c
print("초기 값 :", a, b, c, result)  // 7, 8, 9, 24

valueCapture2()  // 0,0,9,4   1,2,9,12

print("최종 값 :", a, b, c, result)  // 7,8,9,12



/*:
 ---
 ## Reference Type
 ---
 */
print("\n---------- [ Reference Type ] ----------\n")

final class RefType {
    var number = 0
}
var x = RefType()
var y = RefType()
print("초기 값 :", x.number, y.number)  // 0, 0

let refCapture = { [x] in
    print("내부 값 :", x.number, y.number)
}
x.number = 5
y.number = 7
print("변경 값 :", x.number, y.number)  // 5, 7

refCapture()  // 5, 7
print("최종 값 :", x.number, y.number)  // 5, 7


/*:
 ---
 ## Binding an arbitrary expression
 ---
 */
print("\n---------- [ binding ] ----------\n")
let captureBinding = { [z = x] in
    print(z.number)
}
let captureWeakBinding = { [weak z = x] in
    print(z?.number ?? 0)
}
let captureUnownedBinding = { [unowned z = x] in
    print(z.number)
}

captureBinding() // 5
captureWeakBinding() // 5
captureUnownedBinding() // 5



//: [Next](@next)
