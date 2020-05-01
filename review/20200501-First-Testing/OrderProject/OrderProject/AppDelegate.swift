//
//  AppDelegate.swift
//  OrderProject
//
//  Created by 천지운 on 2020/05/01.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    /*
     
     ✓ UI 구현 : 스토리보드와 코드를 이용해 정확한 UI 구현                         // 완료
     ✓ 주문하기 기능 : 특정 아이템의 수량이 1씩 증가하며, 결제금액에 반영              // 완료
     ✓ 결제하기 기능                                                      // 완료
        - 소지금에서 결제금액이 정확히 차감. 소지금은 -가 될 수 없음
        - 소지금이 결제금액보다 작을때, 같을 때, 클 때 각각의 상황 모두 체크
     ✓ 초기화하기 기능 : 소지금, 결제금액, 주문수량의 정보가 모두 정확히 0으로 초기화       // 완료
     ✓ AlertController 동작                                               // 완료
        - 결제 성공 : "총 결제금액은 ****원입니다.". 버튼 종류는 확인, 취소 버튼 2개
        - 결제 실패 : "소지금액이 부족합니다"메시지. 버튼 종류는 확인 버튼 하나
     */

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

