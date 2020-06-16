//
//  ViewController.swift
//  CollectionViewPractice
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

/*
 [ 과제 ]
 > 10장의 이미지를 x 2 해서 20개 아이템으로 만들어 콜렉션뷰에 표시 (세로 방향 스크롤)
 > 각 아이템을 선택했을 때 체크 아이콘 표시 (체크 이미지 : SF Symbol - checkmark.circle.fill)
   + 선택되어 있는 느낌이 나도록 별도 효과 주기 (영상 참고, 효과는 변경 가능)
 > 삭제 버튼을 눌렀을 때 체크표시 되어 있는 아이템들을 삭제
 > 20개의 아이템이 모두 삭제되었을 경우는 다시 반복할 수 있도록 처음 20개 상태로 복구
 > 손가락 2개로 터치 후 드래그했을 때 아이템이 다중 선택/해제될 수 있도록 구현  (이 기능은 샘플 영상에 없음)
 > 한 라인에 지정된 개수만큼의 아이템이 나타나도록 처리 (4를 지정하면 한 라인에 4개의 아이템 출력)


 [ 과제 관련 힌트 ]
 > allowsMultipleSelection 프로퍼티
 > deleteItems, insertItems 메서드
 > UICollectionViewDelegate - shouldBeginMultipleSelectionInteractionAt
 > 아이템 선택에 관련된 처리 방법 (다음 3가지 중 하나를 이용해서 처리 가능)
 1. isSelected 프로퍼티
 2. UICollectionViewDelegate의 didSelect/didDeselect 메서드 사용
 3. selectedBackgroundView 프로퍼티
 */

import UIKit

final class ViewController: UIViewController {
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Action
    
}


// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
