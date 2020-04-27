//
//  SceneDelegate.swift
//  20200427-Practice-ViewController
//
//  Created by 천지운 on 2020/04/27.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        //ios 13 이상이면서 스토리보드를 사용하지 않고 시작 하는 방법
        
        // 처음 시작할 때 맨 바닥에 깔아주는 뷰라고 생각하면 됨
        window = UIWindow(windowScene: windowScene)
        
        // window?.backgroundColor = .systemBackground
        // light = 흰색, dark mode = 검은색(물론 iOS 13 이상)
        window?.backgroundColor = .systemBackground
        
        //window를 ViewController()로 지정하여 ViewController에 해당하는 화면을 보여줌. 윈도우 위로.
        window?.rootViewController = ViewController()
        window?.frame = UIScreen.main.bounds
        
        window?.makeKeyAndVisible() //window가 하나가 아니라 여러개인경우, key윈도우를 지정.
    }

}

