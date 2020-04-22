import UIKit

/*
 문제 설명
 프로그래머스 팀에서는 기능 개선 작업을 수행 중입니다. 각 기능은 진도가 100%일 때 서비스에 반영할 수 있습니다.

 또, 각 기능의 개발속도는 모두 다르기 때문에 뒤에 있는 기능이 앞에 있는 기능보다 먼저 개발될 수 있고, 이때 뒤에 있는 기능은 앞에 있는 기능이 배포될 때 함께 배포됩니다.

 먼저 배포되어야 하는 순서대로 작업의 진도가 적힌 정수 배열 progresses와 각 작업의 개발 속도가 적힌 정수 배열 speeds가 주어질 때 각 배포마다 몇 개의 기능이 배포되는지를 return 하도록 solution 함수를 완성하세요.

 제한 사항
 작업의 개수(progresses, speeds배열의 길이)는 100개 이하입니다.
 작업 진도는 100 미만의 자연수입니다.
 작업 속도는 100 이하의 자연수입니다.
 배포는 하루에 한 번만 할 수 있으며, 하루의 끝에 이루어진다고 가정합니다. 예를 들어 진도율이 95%인 작업의 개발 속도가 하루에 4%라면 배포는 2일 뒤에 이루어집니다.
 
 입출력 예
 progresses    speeds       return
 [93,30,55]    [1,30,5]     [2,1]
 
 입출력 예 설명
 첫 번째 기능은 93% 완료되어 있고 하루에 1%씩 작업이 가능하므로 7일간 작업 후 배포가 가능합니다.
 두 번째 기능은 30%가 완료되어 있고 하루에 30%씩 작업이 가능하므로 3일간 작업 후 배포가 가능합니다. 하지만 이전 첫 번째 기능이 아직 완성된 상태가 아니기 때문에 첫 번째 기능이 배포되는 7일째 배포됩니다.
 세 번째 기능은 55%가 완료되어 있고 하루에 5%씩 작업이 가능하므로 9일간 작업 후 배포가 가능합니다.

 따라서 7일째에 2개의 기능, 9일째에 1개의 기능이 배포됩니다.
 */

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var progress = progresses       // 배열 복사
    var point: Int = -1             // 작업 완료된 위치 알기 위해서
    var resultArray: [Int] = []     // 작업 완료된 갯수 저장
    
    while point != (progresses.count - 1) { // 작업 완료 위치가 배열 끝까지 확인 할 때 까지
        for (index, value) in progress.enumerated() where (value < 100) && (point < index) {
            // 작업량이 100 이하면서 작업 완료 위치보다 현재 작업 위치가 클 경우만 하루 일량을 더해줌
            // 작업 위치가 클 경우만 넣는 이유는 작업 위치(point) 전에는 모두 작업이 완료되었다고 볼 수 있음
            progress[index] = (value + speeds[index] > 100) ? 100 : value + speeds[index]
        }
        
        if progress[point + 1] == 100 { // 작업 완료된 위치보다 다음 작업량이 완료됐을 경우
            var distCount: Int = 0  // 작업 완료 카운트
            for movePoint in (point+1)..<progress.count {   // 이후 작업량에서도 완료된게 있는지 체크
                guard progress[movePoint] == 100 else { break } // 없다면 브레이크
                distCount += 1  // 있다면 작업량 + 1
                point = movePoint   // 작업완료 위치 조정
            }
            resultArray.append(distCount)
        }
    }
    return resultArray
}
solution([93,30,55], [1,30,5])
//solution([99,99,99,99,99], [3,3,3,3,3])
solution([0,0,0], [3,1,1])
