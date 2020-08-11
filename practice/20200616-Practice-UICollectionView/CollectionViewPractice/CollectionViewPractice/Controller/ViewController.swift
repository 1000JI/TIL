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
    
    // MARK: - Properties
    
    let flowLayout = UICollectionViewFlowLayout()
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
        cv.backgroundColor = .systemBackground
        return cv
    }()
    
    let gapSize = CGFloat(8)
    let spacingSize = CGFloat(8)
    let itemCount = CGFloat(2)
    
    var deleteMode = false
    
    var checkIndexPathArray: [IndexPath] = []
    var deleteIndexPathArray: [IndexPath] = []
    
    var catsList: [String] = []
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureCollectionView()
        fetchCatsList()
    }
    
    
    // MARK: - Helpers
    
    func fetchCatsList() {
        Service.fetchCats { cats in
            self.catsList = cats
        }
    }
    
    func configureUI() {
        configureNavi()
        view.backgroundColor = .systemBackground
    }
    
    func configureLayout(itemCount: CGFloat) {
        let widthSize = (collectionView.frame.width - (gapSize * (itemCount - 1)) - (spacingSize * 2)) / itemCount
        flowLayout.itemSize = CGSize(width: widthSize, height: widthSize)
        flowLayout.minimumLineSpacing = gapSize
        flowLayout.minimumInteritemSpacing = gapSize
        flowLayout.sectionInset = UIEdgeInsets(top: spacingSize, left: spacingSize, bottom: spacingSize, right: spacingSize)
    }
    
    func configureCollectionView() {
        configureLayout(itemCount: itemCount)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        allowCollectionViewSelected(false)
        view.addSubview(collectionView)
        
        collectionView.register(CatsCollectionViewCell.self,
                                forCellWithReuseIdentifier: CatsCollectionViewCell.cellIdentifier)
    }
    
    func configureNavi() {
        title = "CollectionView"
        
        let trashBarButton = UIBarButtonItem(
            barButtonSystemItem: .trash,
            target: self,
            action: #selector(handleTrash))
        
        let inputBarButton = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(handleInputItemCount))
        
        navigationItem.rightBarButtonItems = [trashBarButton, inputBarButton]
    }
    
    func saveSelectArray(with collectionView: UICollectionView, indexPath: IndexPath, isSelected: Bool) {
        let cell = collectionView.cellForItem(at: indexPath) as! CatsCollectionViewCell
        if isSelected {
            cell.isCheckMarkHidden = false
        } else {
            cell.isCheckMarkHidden = true
        }
        
        if let selectArray = collectionView.indexPathsForSelectedItems {
            checkIndexPathArray = selectArray
        }
    }
    
    // MARK: - selectors
    
    @objc func handleInputItemCount() {
        let alert = UIAlertController(title: "한 라인 갯수 입력", message: nil, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "숫자를 입력하세요."
            textField.keyboardType = .numberPad
        }
        
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            if let count = Int(alert.textFields?[0].text ?? "1") {
                guard count != 0 else { return }
                self.configureLayout(itemCount: CGFloat(count))
                self.collectionView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    @objc func handleTrash() {
        deleteMode.toggle()
        if deleteMode { allowCollectionViewSelected(true) }
        else {
            allowCollectionViewSelected(false)

            checkIndexPathArray.sorted(by: >).forEach {
                catsList.remove(at: $0.item)
            }
            collectionView.deleteItems(at: checkIndexPathArray)
            deleteIndexPathArray.append(contentsOf: checkIndexPathArray)
            checkIndexPathArray.removeAll()
            
            if catsList.isEmpty {
                fetchCatsList()
                collectionView.insertItems(at: deleteIndexPathArray)
                deleteIndexPathArray.removeAll()
            }
        }
    }
    
    // MARK: - actions
    
    private func allowCollectionViewSelected(_ allow: Bool) {
        collectionView.allowsSelection = allow
        collectionView.allowsMultipleSelection = allow
    }
    
}


// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatsCollectionViewCell.cellIdentifier, for: indexPath) as! CatsCollectionViewCell
        
        let catImageName = catsList[indexPath.item]
        cell.catImageView.image = UIImage(named: catImageName)
        
        if cell.isSelected { cell.isCheckMarkHidden = false }
        else { cell.isCheckMarkHidden = true }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        saveSelectArray(with: collectionView, indexPath: indexPath, isSelected: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        saveSelectArray(with: collectionView, indexPath: indexPath, isSelected: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        print(#function, deleteMode)
        if deleteMode {
            return true
        } else {
            return false
        }
    }
}

