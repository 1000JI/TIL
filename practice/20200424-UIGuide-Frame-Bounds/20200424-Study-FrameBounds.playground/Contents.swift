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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let greenView = setupSuperview()
        let redView = setupSubview(superView: greenView)
//        let orangeView = setupSubview2(superView: view)
        let blackView = setupCenterView(superView: view)
        blackView.center = greenView.center
        
        // 위치를 바꿀 때(frame.origin)
//        greenView.frame.origin = CGPoint(x: 0, y: 0)
//        redView.frame.origin = CGPoint(x: 0, y: 0)
        
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
        redView.frame = CGRect(x: 50, y: 50, width: 80, height: 80)
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
        blackView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        blackView.backgroundColor = .black
//        blackView.center = superView.center
        superView.addSubview(blackView)
        return blackView
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
