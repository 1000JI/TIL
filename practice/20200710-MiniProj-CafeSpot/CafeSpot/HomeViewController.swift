//
//  ViewController.swift
//  CafeSpot
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

/*
 [ 주제 ]
 성수동 주변에 위치한 카페 정보 탐색

 [  구현할 내용  ]
 - 스토리보드/코드 자유 (완성은 스토리보드로 구현할 예정임. 다음 완성 앱은 코드로 구현 예정)
 - 라이트모드/다크모드에서 모두 이상없도록 구현

 - json 파일 정보를 파싱하여 카페 정보 읽어오기

 - 홈 화면
   > 커스텀 레이아웃을 이용한 카페 정보 출력. 어려우면 일단 FlowLayout을 이용해 구현해도 무방
     * (카페 이미지, 카페명, 설명, 관심 버튼)
   > SearchController를 이용한 카페 검색 기능
   > 내비게이션 타이틀 변경 방법.  navigationItem.titleView = UILabel~~~~

 - 카페 상세 정보 화면
   > 카페 추가 이미지와 설명
     * 01~10 숫자가 뒤에 붙어서 10장씩 있음 (블루보틀은 6장). 단, 카페마다 이미지 개수가 달라져도 문제없도록 구현
   > 페이지 컨트롤을 이용한 전체 이미지 개수와 현재 페이지 표현
   > 맵뷰를 통한 카페 위치 표현
   > 추가 정보 영역 (iOS URLScheme에 대해 검색해보고 아래 링크 참고하여 구현)
     * 네이버 지도 앱으로 이동하여 현재 위치에서 카페 위치까지의 도보 경로 나타내기
       참고 - https://docs.ncloud.com/ko/naveropenapi_v3/maps/url-scheme/url-scheme.html
     * 인스타그램 앱으로 이동하여 카페 이름으로 태그 검색
       참고 - https://developers.facebook.com/docs/instagram/sharing-to-feed

 - 지도 검색 화면
   > 맵에 카페 위치가 나타나도록 구현
   > 현재 맵 안에서 보여지는 카페에 대한 정보 표현
   > 카페 정보는 보이거나 숨길 수 있도록 처리
   > 카페들에 대한 위치는 클러스터링 될 수 있도록 처리
     * 클러스터링 = 좁은 위치에 여러 개의 어노테이션뷰(핀)이 겹치면 묶어주는 기능
     * AnnotationView에 clusterIdentifier만 추가해주면 자동 구현
   > 어노테이션뷰(핀)를 선택하면 해당 카페만 보여주도록 처리 (단, 클러스터링된 것을 누르면 그 수만큼 표현)
 */

import UIKit

final class HomeViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var cafeList = [Cafe]() { didSet { collectionView.reloadData() } }
    private var searchCafeList = [Cafe]() { didSet { collectionView.reloadData() } }
    
    private var isSearchMode: Bool {
        return searchController.isActive &&
            !searchController.searchBar.text!.isEmpty
    }
    
    private let naviLabel: UILabel = {
        let label = UILabel()
        label.text = "C a f e S p o t"
        label.font = UIFont(name: "Zapfino", size: 18)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureSearchController()
        configureCollectionView()
        
        fetchCafeData()
    }
    
    // MARK: - API
    
    func fetchCafeData() {
        CafeService.shared.fetchCafeData { cafeList in
            self.cafeList = cafeList
        }
    }
    
    // MARK: - Helpers
    
    func configureUI() {
//        navigationItem.title = "CafeSpot"
        navigationItem.titleView = naviLabel
        navigationController?.navigationBar.barTintColor = .systemBackground
        navigationController?.navigationBar.isTranslucent = false
    }
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.placeholder = "검색..."
        
        navigationItem.searchController = searchController
        definesPresentationContext = false
        searchController.isActive = true
    }
    
    func configureCollectionView() {
        collectionView.backgroundColor = .systemBackground
        collectionView.register(HomeCustomCell.self, forCellWithReuseIdentifier: HomeCustomCell.identifier)
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isSearchMode ? searchCafeList.count : cafeList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCustomCell.identifier, for: indexPath) as! HomeCustomCell
        cell.cafe = isSearchMode ? searchCafeList[indexPath.item] : cafeList[indexPath.item]
        cell.delegate = self
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

//extension HomeViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width: CGFloat = (view.frame.width / 2) - 10
//        let height: CGFloat = 300
//        return CGSize(width: width, height: height)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//    }
//}

// MARK: - UISearchResultsUpdating

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        searchCafeList = cafeList.filter {
            $0.title.contains(searchText)
        }
    }
}

// MARK: - HomeCustomCellDelegate

extension HomeViewController: HomeCustomCellDelegate {
    func handleTapImage(_ cell: HomeCustomCell) {
        guard let cafe = cell.cafe else { return }
        let controller = CafeDetailController()
        controller.cafe = cafe
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func handleLikedEvent(_ cell: HomeCustomCell, isLike: Bool) {
        guard let cafeInfo = cell.cafe else { return }
        
        for (index, cafe) in cafeList.enumerated() {
            if cafe.title == cafeInfo.title {
                cafeList[index].isFavorite = isLike
                
                updateSearchResults(for: searchController)
                break
            }
        }
    }
}

// MARK: - HomeViewCustomLayoutDelegate

extension HomeViewController: HomeViewCustomLayoutDelegate {
    func homeCollectionView(_ collectionView: UICollectionView, layout collectionViewLayout: HomeViewCustomLayout, sizeForPhotoAt indexPath: IndexPath) -> CGSize {
        guard let image = UIImage(named: cafeList[indexPath.item].title) else { return .zero }
        return image.size
    }
}
