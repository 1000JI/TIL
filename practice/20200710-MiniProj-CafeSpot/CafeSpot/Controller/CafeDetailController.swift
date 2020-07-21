//
//  CafeDetailController.swift
//  CafeSpot
//
//  Created by 천지운 on 2020/07/10.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import MapKit

class CafeDetailController: UITableViewController {
    
    // MARK: - Properties
    
    var cafe: Cafe?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        guard let cafe = cafe else { return }
        
        view.backgroundColor = .systemBackground
        navigationItem.title = cafe.title
    }
    
    func configureTableView() {
        tableView.register(DetailPictureCell.self,
                           forCellReuseIdentifier: DetailPictureCell.identifier)
        tableView.register(DetailMapCell.self,
                           forCellReuseIdentifier: DetailMapCell.identifier)
        tableView.register(DetailMoreInfoCell.self,
                           forCellReuseIdentifier: DetailMoreInfoCell.identifier)
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
    }
}

// MARK: - UITableViewDataSource

extension CafeDetailController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return CafeDetailModel.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch CafeDetailModel(rawValue: indexPath.section) {
        case .pictures:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: DetailPictureCell.identifier,
                for: indexPath) as! DetailPictureCell
            cell.cafe = cafe
            return cell
        case .location:
            let cell = tableView.dequeueReusableCell(
            withIdentifier: DetailMapCell.identifier,
            for: indexPath) as! DetailMapCell
            cell.cafe = cafe
            return cell
        case .infoSite:
            let cell = tableView.dequeueReusableCell(
            withIdentifier: DetailMoreInfoCell.identifier,
            for: indexPath) as! DetailMoreInfoCell
            cell.delegate = self
            return cell
        case .none: break
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == CafeDetailModel.allCases.count - 1 { return 0 }
        return 16
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch CafeDetailModel(rawValue: indexPath.section) {
        case .pictures: return 550
        case .location: return 400
        case .infoSite: return 200
        case .none: break
        }
        return 0
    }
}

extension CafeDetailController: DetailMoreInfoCellDelegate {
    func handleInstagram() {
        guard let cafe = cafe else { return }
        let encodeTitle = cafe.title.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        let url = URL(string: "instagram://tag?name=\(encodeTitle!)")
        
        if let appUrl = url {
            if UIApplication.shared.canOpenURL(appUrl) {
                UIApplication.shared.open(appUrl,
                                          options: [:],
                                          completionHandler: nil)
            }
        } else {
            print("DEBUG: Error")
            
        }
    }
    
    func handleNaverMap() {
        guard let cafe = cafe else { return }
        let encodeTitle = cafe.title.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        let bundleID = "com.JWiOS.CafeSpot"
        let url = URL(string: "nmap://route/walk?dlat=\(cafe.location.lat)&dlng=\(cafe.location.lng)&dname=\(encodeTitle!)&appname=\(bundleID)")
        let appStoreURL = URL(string: "http://itunes.apple.com/app/id311867728?mt=8")!
        
        if let appUrl = url {
            if UIApplication.shared.canOpenURL(appUrl) {
                UIApplication.shared.open(appUrl,
                                          options: [:],
                                          completionHandler: nil)
            }
        } else {
            print("DEBUG: Error")
            UIApplication.shared.open(appStoreURL)
        }
    }
}
