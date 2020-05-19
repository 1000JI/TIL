//
//  BackupViewController.swift
//  20200519-MiniProj-Calculator
//
//  Created by 천지운 on 2020/05/19.
//  Copyright © 2020 jwcheon. All rights reserved.
//

//class BackupViewController: UIViewController {
    
//    @IBOutlet weak var resultLabel: UILabel!
//
//    @IBOutlet weak var button1: UIButton!
//    @IBOutlet weak var button2: UIButton!
//    @IBOutlet weak var button3: UIButton!
//    @IBOutlet weak var button4: UIButton!
//    @IBOutlet weak var button5: UIButton!
//    @IBOutlet weak var button6: UIButton!
//    @IBOutlet weak var button7: UIButton!
//    @IBOutlet weak var button8: UIButton!
//    @IBOutlet weak var button9: UIButton!
//    @IBOutlet weak var button0: UIButton!
//
//    @IBOutlet weak var plusButton: UIButton!
//    @IBOutlet weak var minusButton: UIButton!
//    @IBOutlet weak var multiButton: UIButton!
//    @IBOutlet weak var divButton: UIButton!
//    @IBOutlet weak var equalButton: UIButton!
//
//    @IBOutlet weak var clearButton: UIButton!
//
//    lazy var buttonList = [
//        button1, button2, button3, button4, button5,
//        button6, button7, button8, button9, button0,
//        plusButton, minusButton, multiButton, divButton,
//        equalButton, clearButton
//    ]
//
//    lazy var formatter: Formatter = {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .decimal    // 천 단위로 콤마(,)
//        formatter.minimumFractionDigits = 0    // 최소 소수점 단위
//        formatter.maximumFractionDigits = 3    // 최대 소수점 단위
//        //        let numString = formatter.string(from: number as NSNumber)
//        //        print(numString)
//        return formatter
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        layoutSetting()
//    }
//
//    // MARK: - Layout Setting
//    private func layoutSetting() {
//        buttonList.forEach { button in
//            button?.layer.cornerRadius = (button?.frame.size.width)! / 2
//            button?.addTarget(self, action: #selector(clickedButtonEvent(_:)), for: .touchUpInside)
//            button?.addTarget(self, action: #selector(clickedButtonAnimation(_:)), for: .touchUpInside)
//        }
//        resultLabel.text = "0"
//    }
//
//    // true: 두번째 숫자값 입력, false: 첫번째 숫자값 입력
//    private var isCalcSecond: Bool = false
//    // true: 부호가 정상적으로 눌렀을 경우, false: 반대
//    private var isCalcChance: Bool = false
//    // true: 시작, false: 추가
//    private var isStartFirst: Bool = true
//
//    private var firstString: String = "" {
//        didSet {
//            if let intValue = Int(firstString) {
//                resultLabel.text = formatter.string(for: intValue as NSNumber)
//            }
//        }
//    }
//    private var secondString: String = "" {
//        didSet {
//            if let intValue = Int(secondString) {
//                resultLabel.text = formatter.string(for: intValue as NSNumber)
//            }
//        }
//    }
//
//    // 부호 담을 Array
//    private var signArray: [String] = []
//
//    // MARK: - Button Event
//    @objc private func clickedButtonAnimation(_ sender: UIButton) {
//        UIView.animate(withDuration: 0.1, animations: {
//            sender.alpha -= 7
//            self.view.layoutIfNeeded()
//        }) { (_) in
//            sender.alpha += 7
//            self.view.layoutIfNeeded()
//        }
//    }
//
//    @objc private func clickedButtonEvent(_ sender: UIButton) {
//        guard let inputButon = sender.titleLabel?.text else { return }
//
//        switch inputButon {
//        case "+":
//            checkSignCalc(inputButon)
//        case "-":
//            checkSignCalc(inputButon)
//        case "×":
//            checkSignCalc(inputButon)
//        case "÷":
//            checkSignCalc(inputButon)
//        case "=":
//            clacNumberFunc()
//        case "AC":
//            initView()
//        default:
//            if !isCalcSecond {
//                if isStartFirst {
//                    firstString = inputButon
//                    isStartFirst = !isStartFirst
//                } else {
//                    if firstString.count < 13 {
//                        firstString.append(contentsOf: inputButon)
//                    }
//                }
//            } else {
//                if secondString.count < 13 {
//                    secondString.append(contentsOf: inputButon)
//                }
//            }
//        }
//        print("first: ", firstString, "second :", secondString)
//    }
//
//    // 계산 함수
//    private func clacNumberFunc() {
//        // 기호를 가져오는데 기호가 없다면 return
//        guard let lastSign = signArrayLast() else {
//            isStartFirst = true
//            return
//        }
//
//        // =을 눌렀지만 두번째 숫자가 입력되지 않았을 경우
//        if isCalcChance && secondString.count == 0 {
//            secondString = firstString
//        }
//
//        var resultIndex: Int = 0 // 결과 저장
//
//        switch lastSign {
//        case "+":
//            resultIndex = Int(firstString)! + Int(secondString)!
//        case "-":
//            resultIndex = Int(firstString)! - Int(secondString)!
//        case "×":
//            resultIndex = Int(firstString)! * Int(secondString)!
//        case "÷":
//            resultIndex = Int(firstString)! / Int(secondString)!
//        default:
//            return
//        }
//
//        secondString = ""
//        firstString = String(resultIndex)
//        signArray = []
//
//        isStartFirst = true
//        isCalcChance = false
//        isCalcSecond = false
//    }
//
//    // 부호 체크
//    private func checkSignCalc(_ sign: String) {
//        // 첫 부호가 - 가 들어 왔을 경우
//        if sign == "-" && firstString.count == 0 {
//            firstString = "-"
//            isStartFirst = false
//            return
//        } else if sign == "-" && firstString.last == "-" {
//            isStartFirst = true
//            firstString = ""
//            return
//        } else if firstString.last == "-" {
//            firstString = ""
//        }
//
//        if secondString.count > 0 {
//            clacNumberFunc()
//        }
//
//        signArrayPush(sign)
//        isCalcChance = true
//        isCalcSecond = true
//
//        if firstString.count == 0 { firstString = "0" }
//    }
//
//    // 부호 Push하는데 기존에 부호가 있으면 pop 후 push
//    private func signArrayPush(_ sign: String) {
//        if signArray.count > 0 {
//            let _ = signArray.popLast()
//        }
//        signArray.append(sign)
//    }
//
//    // 가장 마지막에 있는 부호 가져오기
//    private func signArrayLast() -> String? {
//        return signArray.last
//    }
//
//
//    private func initView() {
//        firstString = ""
//        secondString = ""
//        signArray = []
//        resultLabel.text = "0"
//
//        isStartFirst = true
//        isCalcChance = false
//        isCalcSecond = false
//    }
//}

