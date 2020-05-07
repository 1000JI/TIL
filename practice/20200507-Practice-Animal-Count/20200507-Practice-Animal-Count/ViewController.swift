//
//  ViewController.swift
//  20200507-Practice-Animal-Count
//
//  Created by 천지운 on 2020/05/07.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

/*
 [ 과제 ]
 1.
 - FirstVC 에 Dog, Cat, Bird 라는 이름의 Button을 3개 만들고 숫자를 표시하기 위한 Label 하나 생성
 - SecondVC 에 UIImageView 하나와 Dismiss 를 위한 버튼 하나 생성
 - FirstVC에 있는 버튼 3개 중 하나를 누르면 그 타이틀에 맞는 이미지를 SecondVC의 ImageView 에 넣기
   (이미지는 구글링 등을 통해 활용)
 - 각 버튼별로 전환 횟수를 세서 개는 8회, 고양이는 10회, 새는 15회가 초과되면 화면이 전환되지 않도록 막기
   (전환 횟수가 초과된 버튼은 그것만 막고, 횟수가 초과되지 않은 버튼으로는 전환 가능)
 - SecondVC에 추가로 UIButton 을 하나 생성하여 그 버튼을 누를 때마다 개와 고양이, 새 모두에 대해 전환 횟수가 각각 1회씩 추가되도록 구현
 */

class ViewController: UIViewController {
    
    @IBOutlet private var dogCountLabel: UILabel!
    @IBOutlet private var catCountLabel: UILabel!
    @IBOutlet private var birdCountLabel: UILabel!
    
    var dogCount: Int = 0 {
        didSet {
            dogCountLabel.text = "\(dogCount)"
        }
    }
    
    var catCount: Int = 0 {
        didSet {
            catCountLabel.text = "\(catCount)"
        }
    }
    
    var birdCount: Int = 0 {
        didSet {
            birdCountLabel.text = "\(birdCount)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let secondView = segue.destination as? SecondViewController else {
            return
        }
        
        if let segueValue = segue.identifier {
            switch segueValue {
            case "DogSegue":
                secondView.image = UIImage(named: "dog")!
                dogCount += 1
            case "CatSegue":
                secondView.image = UIImage(named: "cat")!
                catCount += 1
            case "BirdSegue":
                secondView.image = UIImage(named: "bird")!
                birdCount += 1
            default:
                return
            }
        }
    }
    
    @IBAction func unwindToViewController(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        // CODE
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        switch identifier {
        case "DogSegue":
            return dogCount < 8 ? true : false
        case "CatSegue":
            return catCount < 10 ? true : false
        case "BirdSegue":
            return birdCount < 15 ? true : false
        default:
            return false
        }
    }
    
}

