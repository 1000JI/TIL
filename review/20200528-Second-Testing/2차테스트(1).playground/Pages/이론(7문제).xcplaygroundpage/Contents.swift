//: [Previous](@previous)
import Foundation


/*
 1) 업캐스팅과 다운캐스팅에 대하여 설명하고,
 2) 업캐스팅과 다운캐스팅을 시도할 때 사용하는 키워드에 대해 각각 설명
 
 - 답변 -
 업캐스팅은 부모의 클래스로 타입 변환할 때 사용 키워드는 as를 사용
 다운캐스팅은 Any -> String, Int이나 자식 클래스로 타입 변환할 때 사용하며, 키워드는 as? as! 를 사용함
 as는 자기자신이나 부모의 클래스 같이 분명하게 정해져있을 때 사용
 as?는 만약 캐스팅이 실패했을 경우 nil 반환
 as!는 실패했을 경우 런타임 에러 발생
 */




/*
 TableView에서 셀을 재사용할 때 사용되는 아래의 두 메서드가 각각
 1) 언제 사용되고  2) 차이점은 무엇인지에 대하여 작성
 - dequeueReusableCell(withIdentifier:)
 - dequeueReusableCell(withIdentifier:for:)
 */
/*
 cellForRowAt이라는 메소드에서 사용되고 재사용큐에서 셀을 가져올 때 사용하는 메소드임
 
 for에 indexPath(셀의 위치 정보)를 넘겨주는데, 전자는 identifier로 지정된 셀을 재사용 할 때 사용하며,
 후자는 identifier로 지정되어있으면서 셀의 위치 정보를 갖고 있는 셀을 재사용한다!
 */



/*
 safeAreaInsets  /  safeAreaLayoutGuide 의 차이점에 대해 작성
 
 safeAreaInsets -> view에 safeArea(top, bottom, leading, trailing)의 값을 갖고 있음
 safeAreaLayoutGuide -> safeAreaInsets 와 약간 비슷하나 autoLayout을 잡을 때 이 Guide를 사용하며 각 Anchor들이 있다.
 */




/*
 Strong Reference Cycle 에 대해 1) 설명하고 2) 예시 코드 작성
 
 - 답변
 ARC -> 메모리 자동 관리
 강한 참조이며, 참조할 경우 Reference Count가 1 증가함. 명시적으로 nil 값을 넣어주어야 함
 */
class AClass {
    var bClass: BClass? = nil
}

class BClass {
    var aClass: AClass? = nil
}

// 생성
var aClass: AClass? = AClass() // AClass Count - 1 / BClass Count - 0
var bClass: BClass? = BClass() // AClass Count - 1 / BClass Count - 1
aClass?.bClass = BClass() // AClass Count - 1 / BClass Count - 2
bClass?.aClass = AClass() // AClass Count - 2 / BClass Count - 2

// 해제
aClass?.bClass = nil // AClass Count - 2 / BClass Count - 1
bClass?.aClass = nil // AClass Count - 1 / BClass Count - 1
aClass = nil // AClass Count - 0 / BClass Count - 1
bClass = nil // AClass Count - 0 / BClass Count - 0



/*
 Strong, Unowned, Weak 각각의 특징과 차이점에 대해 설명
 
 답변
 Strong -> 강한 참조. Count 1증가, 명시적으로 nil 값을 넣어주어야 함
 Unowned -> 약한 참조. Count가 증가하지 않으나, 참조한 곳의 값이 없어도 주소 값을 유지하고 있음(런타임 에러 발생)
 Weak -> 약한 참조. Count가 증가하지 않으나, 참조한 곳의 값이 없으면 nil 값을 반환함
 */





/*
 Intrinsic Content Size란 무엇이고 어떤 특징을 가지는지 설명
 
 모릅..모릅니다.. Intrinsic Content Size가 뭐죠..?
 */




/*
 A, B, C 3개의 ViewController가 다음과 같은 상황일 때
 ============================
 A ---------> B ---------> C
    present      present
 ============================
 A, B, C 각각의 presentingViewController, presentedViewController의 상태는?
 
 A
    presentingViewController: nil
    presentedViewController: B
 
 B
     presentingViewController: A
     presentedViewController: C
 
 C
     presentingViewController: B
     presentedViewController: nil
 */



//: [Next](@next)
