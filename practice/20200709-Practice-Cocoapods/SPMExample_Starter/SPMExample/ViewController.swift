//
//  ViewController.swift
//  SPMExample
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import Kingfisher

// 치트시트
// https://github.com/onevcat/Kingfisher/wiki/Cheat-Sheet

final class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView! {
        didSet {
//            withoutKingFisher()
        }
    }
    
    let url = URL(string: "https://picsum.photos/1024")!
    var randomImage: UIImage {
        ["cat", "IU", "suji", "tzuyu"].compactMap(UIImage.init(named:)).randomElement()!
    }
    
    func withoutKingFisher() {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil { return print(error!.localizedDescription) }
            if let data = data {
                DispatchQueue.main.sync {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }.resume()
    }
    
    
    // MARK: Action
    
    @IBAction private func setImageBasic(_ sender: Any) {
//        imageView.kf.indicatorType = .activity
        
        let gitUrl = Bundle.main.url(forResource: "mina", withExtension: "gif")!
        let imageData = try! Data(contentsOf: gitUrl)
        imageView.kf.indicatorType = .image(imageData: imageData) // indicator에 gif를 대신 사용

        // 이미지를 한번 가져오면 새로 눌렀을 때 안가져오는데 이건 Cache 문제가 있다.
        // 따라서 option에 .forceRefresh를 줘야한다.
//        imageView.kf.setImage(with: url)
//        imageView.kf.setImage(with: url, options: [.forceRefresh])
        imageView.kf.setImage(
            with: url,
            placeholder: randomImage, // Network에서 사진을 가져오기 전에 로딩 시간 동안 띄울 사진
            options: [.forceRefresh]
        )
    }
    
    
    @IBAction private func imageOptions(_ sender: Any) {
        imageView.kf.setImage(with: url,
                              options: [
                                .forceRefresh,
//                                .keepCurrentImageWhileLoading,
                                .transition(.flipFromRight(1)), // Cache에서 가져오면 fade 동작 안함
//                                .forceTransition, // Cache에서 가져오더라도 animate 동작
//                                .onlyFromCache, // 캐시에서만 가져오기
                                .onFailureImage(randomImage), // 가져오는데 실패했을때의 이미지
        ])
        
//        imageView.kf.cancelDownloadTask() // 중간에 취소 할 경우 사용하는 Task Failure로 들어감
    }
    
    
    @IBAction private func parameters(_ sender: Any) {
        imageView.kf.setImage(with: url,
                              options: [.forceRefresh],
                              progressBlock: { (receivedSize, totalSize) in
                                let percentage = (Float(receivedSize) / Float(totalSize)) * 100
                                print("downloading progress: \(percentage)%")
        }) { result in
            switch result {
            case .success(let value):
                print(value.image) // 이미지 객체
                print(value.cacheType) // 캐싱 여부
                print(value.source) // 출처
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    @IBAction private func imageProcessor(_ sender: Any) {
        // |> 커스텀 연산자, + 같은 느낌?
//        let processorChain = BlurImageProcessor(blurRadius: 10) |> RoundCornerImageProcessor(cornerRadius: 80)
//
//        imageView.kf.setImage(with: url,
//                              options: [.forceRefresh,
//                                        .processor(processorChain)])
        
        var multipleProcessor: ImageProcessor = DownsamplingImageProcessor(size: imageView.frame.size) // 이미지프레임 크기에 맞춰 줄이는 작업
        let imageProcessors: [ImageProcessor] = [
            CroppingImageProcessor(size: CGSize(width: 640, height: 640)), // 짤라내는 작업
            BlurImageProcessor(blurRadius: 2),
            BlackWhiteProcessor(), // 흑백 이미지 적용
            RoundCornerImageProcessor(cornerRadius: 50),
        ]
        for processor in imageProcessors {
            multipleProcessor = multipleProcessor |> processor
        }
        imageView.kf.setImage(with: url,
                              options: [.forceRefresh, .processor(multipleProcessor)]
        )
    }
}
