//
//  ViewController.swift
//  20200427-Practice-Switch-Segment
//
//  Created by 천지운 on 2020/04/27.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var topView: UIView!
    var bottomView: UIView!
    
    var switchLabel: UILabel!
    var segmentLabel: UILabel!
    
    var switchControl: UISwitch!
    var segmentControl: UISegmentedControl!

    let array = ["첫 번째", "두 번째", "세 번째", "네 번째"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topView = setViewSetting(view, location: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 2))
        bottomView = setViewSetting(view, location: CGRect(x: 0, y: view.frame.size.height / 2, width: view.frame.size.width, height: view.frame.size.height / 2))
        
        switchLabel = setLabelSetting(topView, location: CGRect(x: 0, y: 0, width: topView.frame.size.width, height: topView.frame.size.height / 2))
        segmentLabel = setLabelSetting(bottomView, location: CGRect(x: 0, y: 0, width: bottomView.frame.size.width, height: bottomView.frame.size.height / 2))
        
        switchControl = setSwitchSetting(topView, location: CGRect(x: topView.frame.size.width / 2, y: 0, width: topView.frame.size.width - 100, height: 100))
        switchControl.center = topView.center
        switchControl.addTarget(self, action: #selector(eventSwitch), for: .valueChanged)
        
        segmentControl = setSegmentSetting(bottomView, location: CGRect(x: 50, y: bottomView.frame.size.height / 2 - 25, width: bottomView.frame.size.width - 100, height: 50))
        segmentControl.addTarget(self, action: #selector(eventSegment), for: .valueChanged)
    }


    func setViewSetting(_ superView: UIView, location: CGRect) -> UIView {
        let setView = UIView(frame: location)
        setView.backgroundColor = .systemPink
        setView.layer.borderColor = UIColor.black.cgColor
        setView.layer.borderWidth = 5
        superView.addSubview(setView)
        return setView
    }

    func setLabelSetting(_ superView: UIView, location: CGRect) -> UILabel {
        let setLabel = UILabel(frame: location)
        setLabel.font = UIFont.boldSystemFont(ofSize: 25)
        setLabel.textAlignment = .center
        setLabel.backgroundColor = .white
        setLabel.layer.borderColor = UIColor.black.cgColor
        setLabel.layer.borderWidth = 5
        superView.addSubview(setLabel)
        return setLabel
    }

    func setSwitchSetting(_ superView: UIView, location: CGRect) -> UISwitch {
        let setSwitch = UISwitch(frame: location)
        superView.addSubview(setSwitch)
        switchLabel.text = "OFF"
        return setSwitch
    }

    @objc func eventSwitch(_ sender: UISwitch) {
        if sender.isOn {
            switchLabel.text = "ON"
        } else {
            switchLabel.text = "OFF"
        }
    }
    
    func setSegmentSetting(_ superView: UIView, location: CGRect) -> UISegmentedControl {
        let setSegment =  UISegmentedControl(items: array)
        setSegment.frame = location
        setSegment.backgroundColor = .white
        setSegment.selectedSegmentTintColor = .systemBlue
        superView.addSubview(setSegment)
        segmentLabel.text = "선택해주세요"
        return setSegment
    }
    
    @objc func eventSegment(_ sender: UISegmentedControl) {
        segmentLabel.text = array[sender.selectedSegmentIndex]
    }
}
