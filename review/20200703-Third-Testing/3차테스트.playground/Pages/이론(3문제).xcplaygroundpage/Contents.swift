//: [Previous](@previous)



/*
 try, try?, try! 의 공통점과 차이점

 공통점으론 예외(에러) 처리를 위한 것이다.
 
 차이점은 try 같은 경우 do ~ catch 문이랑 같이 쓰지만,
 try? try! 는 홀로 쓸 수 있다.
 다만, try? 는 에러 발생 시 옵셔널을 반환하기에 별도 처리가 가능하지만
 try!는 crush를 발생한다는 점이 다르다.
 */



/*
 forEach, map, filter, reduce에 대해 설명
 
 forEach - 반환 값이 없는 for문이라고 보면 될 것 같다.
        [1,2,3,4,5].forEach( print($0) }
 map - 특정한 타입의 배열로 반환해주는 고차함수라고 보면 될 것 같다.
        [String].map { Int($0)! } -> [Int]
 filter - 특정 조건에 해당되는 애들만 반환해주는 고차함수
        [Int].filter { $0.isMultiple(of: 2) } -> 2의 배수만 반환
 reduce - 해당 변수의 초기 값과 연산자를 결정하여 이행하여 결과를 반환해주는 고차함수이다.
        [1,2,3,4,5].reduce(0, +) -> 15
 */



/*
 Geocode와 Reverse Geocode의 차이
 
 Geocode -> 주소를 가지고 해당 주소의 위도와 경도를 구할 수 있다.
 
 Reverse Geocode -> 해당 주소의 위도와 경도를 가지고 주소를 구할 수 있다.
 */


//: [Next](@next)
