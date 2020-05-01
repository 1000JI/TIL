//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.frame.size = CGSize(width: 375, height: 667)
        view.backgroundColor = .white
        self.view = view
        
    }
    
    var greenView = UIView()
    var redView = UIView()
    var blackView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        greenView = setupSuperview()
        redView = setupSubview(superView: greenView)
        blackView = setupCenterView(superView: redView)

//        let orangeView = setupSubview2(superView: view)
//        blackView.center = greenView.center
        
        // 위치를 바꿀 때(frame.origin)
//        greenView.frame.origin = CGPoint(x: 0, y: 0)
//        redView.frame.origin = CGPoint(x: 0, y: 0)
//        greenView.bounds.origin = CGPoint(x: 50, y: 50)
        
        // 위치를 바꿀 때(bounds.origin)
//        greenView.bounds.origin = CGPoint(x: 100, y: 100)
        
        print("-- green View --")
        print(greenView.frame)
        print(greenView.bounds)
        
        print("-- red View --")
        print(redView.frame)
        print(redView.bounds)
        
//        print("-- orange View --")
//        print(orangeView.frame)
//        print(orangeView.bounds)
        
        let moveButton: UIButton = UIButton(type: .system)
        moveButton.setTitle("Move", for: .normal)
        moveButton.frame.size = CGSize(width: 200, height: 30)
        moveButton.center = view.center
        moveButton.addTarget(self, action: #selector(clickedMoveButton(_:)), for: .touchUpInside)
        
        view.addSubview(moveButton)
    }
    
    @objc private func clickedMoveButton(_ sender: UIButton) {
        var randomX: Int = Int.random(in: 0...Int(greenView.frame.size.width))
        var randomY: Int = Int.random(in: 0...Int(greenView.frame.size.height))
        
        if randomX > Int(greenView.frame.size.width - redView.frame.size.width) {
            randomX = Int(greenView.frame.size.width - redView.frame.size.width)
        }
        
        if randomY > Int(greenView.frame.size.height - redView.frame.size.height) {
            randomY = Int(greenView.frame.size.height - redView.frame.size.height)
        }
        
        redView.frame.origin = CGPoint(x: randomX, y: randomY)
        
//        redView.frame.origin = CGPoint(x: ) - Int(redView.frame.size.width), y: Int.random(in: 1...Int(greenView.frame.size.height)) - Int(redView.frame.size.height))
    }
    
    func setupSuperview() -> UIView {
        let greenView = UIView()
        greenView.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        return greenView
    }
    
    func setupSubview(superView: UIView) -> UIView {
        let redView = UIView()
        redView.frame.size = CGSize(width: 80, height: 80)
        
        let setWidth = redView.frame.size.width / 2
        let setHeight = redView.frame.size.height / 2
        
        redView.frame.origin = CGPoint(x: superView.frame.width / 2 - setWidth, y: superView.frame.height / 2 - setHeight)
        
        redView.backgroundColor = .red
        superView.addSubview(redView)
        return redView
    }
    
    func setupSubview2(superView: UIView) -> UIView {
        let orangeView = UIView()
        orangeView.frame = CGRect(x: 50, y: 50, width: 80, height: 80)
        orangeView.backgroundColor = .orange
        superView.addSubview(orangeView)
        return orangeView
    }
    
    func setupCenterView(superView: UIView) -> UIView {
        let blackView = UIView()
        blackView.frame = CGRect(x: superView.frame.width / 2 - 25, y: superView.frame.height / 2 - 25, width: 50, height: 50)
        blackView.backgroundColor = .black
        superView.addSubview(blackView)
        return blackView
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
