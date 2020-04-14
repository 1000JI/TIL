/*
 게임 화면은 1 x 1 크기의 칸들로 이루어진 N x N 크기의 정사각 격자이며 위쪽에는 크레인이 있고 오른쪽에는 바구니가 있습니다. (위 그림은 5 x 5 크기의 예시입니다). 각 격자 칸에는 다양한 인형이 들어 있으며 인형이 없는 칸은 빈칸입니다. 모든 인형은 1 x 1 크기의 격자 한 칸을 차지하며 격자의 가장 아래 칸부터 차곡차곡 쌓여 있습니다. 게임 사용자는 크레인을 좌우로 움직여서 멈춘 위치에서 가장 위에 있는 인형을 집어 올릴 수 있습니다. 집어 올린 인형은 바구니에 쌓이게 되는 데, 이때 바구니의 가장 아래 칸부터 인형이 순서대로 쌓이게 됩니다. 다음 그림은 [1번, 5번, 3번] 위치에서 순서대로 인형을 집어 올려 바구니에 담은 모습입니다.
 
 만약 같은 모양의 인형 두 개가 바구니에 연속해서 쌓이게 되면 두 인형은 터뜨려지면서 바구니에서 사라지게 됩니다. 위 상태에서 이어서 [5번] 위치에서 인형을 집어 바구니에 쌓으면 같은 모양 인형 두 개가 없어집니다.
 
 크레인 작동 시 인형이 집어지지 않는 경우는 없으나 만약 인형이 없는 곳에서 크레인을 작동시키는 경우에는 아무런 일도 일어나지 않습니다. 또한 바구니는 모든 인형이 들어갈 수 있을 만큼 충분히 크다고 가정합니다. (그림에서는 화면표시 제약으로 5칸만으로 표현하였음)

 게임 화면의 격자의 상태가 담긴 2차원 배열 board와 인형을 집기 위해 크레인을 작동시킨 위치가 담긴 배열 moves가 매개변수로 주어질 때, 크레인을 모두 작동시킨 후 터트려져 사라진 인형의 개수를 return 하도록 solution 함수를 완성해주세요.
 
 [제한사항]
 - board 배열은 2차원 배열로 크기는 5 x 5 이상 30 x 30 이하입니다.
 - board의 각 칸에는 0 이상 100 이하인 정수가 담겨있습니다.
    - 0은 빈 칸을 나타냅니다.
    - 1 ~ 100의 각 숫자는 각기 다른 인형의 모양을 의미하며 같은 숫자는 같은 모양의 인형을 나타냅니다.
 - moves 배열의 크기는 1 이상 1,000 이하입니다.
 - moves 배열 각 원소들의 값은 1 이상이며 board 배열의 가로 크기 이하인 자연수입니다.
 */

import Foundation

// 2차 풀이!! 모두 성공 :)
func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var boardTable  : [[Int]]   = board     // 사용할 2차원 배열 복사(
    var stackTable  : [Int]     = []        // moves[]에 해당되는 인형 뽑아서 쌓아둘 배열
    var popCount    : Int       = 0         // 삭제되는 인형 갯수를 저장할 변수
    
    for index in moves {    // moves에 있는 index 순으로 진행
        for row in 0..<board.count {    // 해당 index에 해당되는 배열 중 stackTable로 가져오기 위한 배열
            guard boardTable[row][index-1] != 0 else { continue }   // 만약 해당 공간이 0이라면 집게를 더 깊게 내려감
            
            stackTable.append(boardTable[row][index-1]) // 인형이 있다면 stackTable에 가져옴
            boardTable[row][index-1] = 0    // 가져온 공간은 0으로 Set
            break   // 인형을 가져 왔으니 목적 완료!! 반복문 break
        }
        
        if (stackTable.count >= 2) && (stackTable[stackTable.endIndex-2] == stackTable[stackTable.endIndex-1]) { // 인형이 2개 이상 쌓여 있고, 마지막 인형과 그 전 인형이 같다면?
            stackTable = stackTable.dropLast(2) // 인형 두개 삭제 후 stackTable에 반환
            popCount += 2   // 삭제한 인형 갯수 저장
        }
    }
    
    return popCount
}
solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4])

//--------1차 풀이... 테스트 결과 모두 실패함....ㅠㅠ
//func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
//    var boardTable  : [[Int]]   = board
//    var stackTable  : [Int]     = []
//    var popCount    : Int       = 0
//
//    for i in 0...4 {
//        for j in (0...4).reversed() {
//            if board[j][i] == 0 {
//            }
//            boardTable[i][4-j] = board[j][i]
//        }
//    }
//
//    for index in moves {
//        if boardTable[index-1].firstIndex(of: 0) != 0 {
////            print(boardTable[index-1][boardTable[index-1].firstIndex(of: 0)!-1])
//            stackTable.append(boardTable[index-1][boardTable[index-1].firstIndex(of: 0)!-1])
//            boardTable[index-1][boardTable[index-1].firstIndex(of: 0)!-1] = 0
//
//            // stackTable에 같은 인형이 쌓여있는지 확인 후 삭제
//            if (stackTable.endIndex > 2) && (stackTable[stackTable.endIndex-2] == stackTable[stackTable.endIndex-1]) {
////                print("같다\(stackTable[stackTable.endIndex-2]) == \(stackTable[stackTable.endIndex-1])")
//
//                stackTable = stackTable.dropLast(2)
//                popCount += 2
//            }
//        }
//    }
//    return popCount
//}

//solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4])



