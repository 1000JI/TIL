//
//  PracticeViewController.swift
//  ImagePickerControllerExample
//
//  Created by 천지운 on 2020/06/02.
//  Copyright © 2020 giftbot. All rights reserved.
//

import MobileCoreServices
import UIKit

final class PracticeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        initialImageView()
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
//        imageView.layer.borderColor = UIColor.black.cgColor
//        imageView.layer.borderWidth = 3
//        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    lazy var imagePickButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Image Pick", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 35)
        button.addTarget(self, action: #selector(clickedButton), for: .touchUpInside)
        return button
    }()

    @objc func clickedButton(_ sender: UIButton) {
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.mediaTypes = [kUTTypeImage] as [String]
        present(imagePicker, animated: true)
    }
    
    private lazy var imagePicker: UIImagePickerController = {
       let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        return imagePicker
    }()
    
    // MARK: - Setup Layout
    private func setupLayout() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imagePickButton)
        imagePickButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        ])
        
        NSLayoutConstraint.activate([
            imagePickButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            imagePickButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            imagePickButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            imagePickButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
    }
    
    private func initialImageView() {
        let interaction = UIContextMenuInteraction(delegate: self)
        imageView.addInteraction(interaction)
        imageView.isUserInteractionEnabled = true
    }
}

extension PracticeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaType = info[.mediaType] as! NSString
        
        if UTTypeEqual(mediaType, kUTTypeImage) {
            let originalImage = info[.originalImage] as! UIImage
            let editedImage = info[.editedImage] as? UIImage
            let selectedImage = editedImage ?? originalImage
            imageView.image = selectedImage
        }
        
//        self.dismiss(animated: true, completion: nil)
        picker.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UIContextMenuInteractionDelegate
extension PracticeViewController: UIContextMenuInteractionDelegate {
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        
        print("\n---------- [ contextMenuInteraction ] ----------\n")
        
        
        
        return UIContextMenuConfiguration(
            identifier: nil,
            previewProvider: nil) { _ in
                let pickImage = UIAction(
                title: "Pick Image",
                image: UIImage(systemName: "photo")) { _ in
                    
                    print("\n---------- [ Pick Image ] ----------\n")
                    self.present(self.imagePicker, animated: true)
                }
                
                let isAllowedEditing = self.imagePicker.allowsEditing
                
                let toggleEditing = UIAction(
                title: "Toggle Editing",
                image: UIImage(systemName: "repeat"),
                attributes: [.destructive],
                state: isAllowedEditing ? .on : .off) { _ in
                    self.imagePicker.allowsEditing.toggle()
                }
                
                let submenu = UIMenu(
                    title: "Submenu",
                    image: UIImage(systemName: "list.number"),
                    options: [.displayInline],
                    children: [toggleEditing])
                
                return UIMenu(title: "ContextMenu", children: [pickImage, submenu])
        }
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.present(self.imagePicker, animated: true)
//        }
    }
    
    // 원하는 뷰를 타겟 프리뷰로 지정
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, previewForHighlightingMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        return UITargetedPreview(view: self.view)
    }
    
    // Interaction이 종료되려고 직전에 호출
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willEndFor configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?) {
        
    }
}
