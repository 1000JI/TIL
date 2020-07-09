//
//  ViewController.swift
//  SPMExample
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import Kingfisher


final class ViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView! {
    didSet {
//      withoutKingFisher()
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
        DispatchQueue.main.async {
          self.imageView.image = UIImage(data: data)
        }
      }
    }.resume()
  }
  
  
  // MARK: Action
  
  @IBAction private func setImageBasic(_ sender: Any) {
    imageView.kf.indicatorType = .activity
    
    // gif image indicator
//    let gifUrl = Bundle.main.url(forResource: "mina", withExtension: "gif")!
//    let imageData = try! Data(contentsOf: gifUrl)
//    imageView.kf.indicatorType = .image(imageData: imageData)
    
    
    imageView.kf.setImage(with: url)
    
    // Cache 때문에 새로운 이미지를 못 읽어올 때
//    imageView.kf.setImage(with: url, options: [.forceRefresh])
  }
  
  
  @IBAction private func imageOptions(_ sender: Any) {
    /*
     [ 옵션 예시 ]
     .forceRefresh - 캐시 이미지 무시하고 네트워크에서 다운로드
     .onlyFromCache - 캐시에서만 이미지 가져오기. 캐시 이미지가 없으면 네트워크에 접근하지 않고 즉시 Throw Error
     .forceTransition - 캐시 이미지는 transition 옵션이 미적용 되는데 이 때는 forceTransition 옵션 필요
     .transition(ImageTransition) - 애니메이션 지정. 트랜지션 종류: none, fade, flip, custom
     .keepCurrentImageWhileLoading - 새로운 이미지를 가져오는 동안 현재 이미지 유지
     .onFailureImage(Image) - 이미지를 가져오는데 실패했을 때 보여줄 이미지
     */
    
//    imageView.kf.setImage(
//      with: url,
//      options: [.forceRefresh, .keepCurrentImageWhileLoading]
//      options: [.forceTransition, .transition(.fade(1))],
//      options: [.forceTransition, .transition(.flipFromTop(1)), .onlyFromCache]
//    )
    
    
    // 잘못된 URL 또는 cancel로 요청이 취소되었을 때 failureImage 출력
//    imageView.kf.setImage(
//      with: URL(string: "WrongURL")!,
//      options: [.onFailureImage(randomImage)]
//    )
  }
  
  
  @IBAction private func parameters(_ sender: Any) {
    imageView.kf.setImage(
      with: url,
//      options: [.forceRefresh],
      progressBlock: { receivedSize, totalSize in
        // progressBlock은 네트워크에서 이미지를 가져올 때,
        // 서버 응답 헤더에 "Content-Length"가 있는 경우만 호출됨
        let percentage = (Float(receivedSize) / Float(totalSize)) * 100.0
        print("downloading progress: \(percentage)%")
    }) { result in
      switch result {
      case .success(let value):
        print(value.image)  // 가져온 이미지 객체
        print(value.cacheType)  // 캐싱 여부 및 출처 : none(네트워크에서 새로 다운로드), memory, disk
        print(value.source)  // 원본 출처 정보(url, cacheKey)를 가진 객체
      case .failure(let error):
        print(error)
      }
    }
  }
  
  
  @IBAction private func imageProcessor(_ sender: Any) {
    // 개별 프로세서 적용
//    let processor = RoundCornerImageProcessor(cornerRadius: 80)
//    let processor = BlurImageProcessor(blurRadius: 8)
//    imageView.kf.setImage(
//      with: url,
//      options: [.forceRefresh, .processor(processor)]
//    )
        
    
    // 프로세서 체이닝
//    let processorChain = BlurImageProcessor(blurRadius: 4) |>
//      RoundCornerImageProcessor(cornerRadius: 80)
    
//    imageView.kf.setImage(
//      with: url,
//      options: [.forceRefresh, .processor(processorChain)]
//    )
        
    
    // 다중 프로세서 체이닝
    var multipleProcessor: ImageProcessor =
      DownsamplingImageProcessor(size: imageView.frame.size)
    let imageProcessors: [ImageProcessor] = [
      CroppingImageProcessor(size: CGSize(width: 640, height: 640)),
      BlurImageProcessor(blurRadius: 2),
      BlackWhiteProcessor(),
      RoundCornerImageProcessor(cornerRadius: 50),
    ]
    for processor in imageProcessors {
      multipleProcessor = multipleProcessor |> processor
    }
    imageView.kf.setImage(
      with: url,
      options: [.forceRefresh, .processor(multipleProcessor)]
    )
  }
  
  
}
