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
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        initialButton()
    }
    
    // MARK: - Layout Views
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleToFill
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        imageView.layer.borderWidth = 0.5
        return imageView
    }()
    
    private lazy var imagePickButton: UIButton = {
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
    
    private lazy var prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("←", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 35)
        button.addTarget(self, action: #selector(prevClickedButton), for: .touchUpInside)
        return button
    }()

    @objc func prevClickedButton(_ sender: UIButton) {
        guard imageIndex > 0 else { return }
        imageIndex -= 1
    }
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("→", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 35)
        button.addTarget(self, action: #selector(nextClickedButton), for: .touchUpInside)
        return button
    }()

    @objc func nextClickedButton(_ sender: UIButton) {
        guard imageIndex < saveImages.count - 1 else { return }
        imageIndex += 1
    }
    
    let prevImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.alpha = 0
        imageView.backgroundColor = .systemFill
        return imageView
    }()
    
    let nextImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.alpha = 0
        imageView.backgroundColor = .systemFill
        return imageView
    }()
    
    // MARK: Save Property
    private var saveImages: [UIImage] = []
    private var imageIndex: Int = -1 {
        didSet {
            imageView.image = saveImages[imageIndex]
        }
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
        
        view.addSubview(prevButton)
        view.addSubview(nextButton)
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(prevImageView)
        view.addSubview(nextImageView)
        prevImageView.translatesAutoresizingMaskIntoConstraints = false
        nextImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        ])
        
        NSLayoutConstraint.activate([
            imagePickButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            imagePickButton.leadingAnchor.constraint(equalTo: prevButton.trailingAnchor, constant: 16),
            imagePickButton.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor, constant: -16),
            imagePickButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
        
        NSLayoutConstraint.activate([
            prevButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            prevButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            prevButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            prevButton.widthAnchor.constraint(equalTo: nextButton.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
        
        NSLayoutConstraint.activate([
            prevImageView.topAnchor.constraint(equalTo: prevButton.bottomAnchor, constant: 8),
            prevImageView.centerXAnchor.constraint(equalTo: prevButton.centerXAnchor),
            prevImageView.widthAnchor.constraint(equalToConstant: 100),
            prevImageView.heightAnchor.constraint(equalTo: prevImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nextImageView.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 8),
            nextImageView.centerXAnchor.constraint(equalTo: nextButton.centerXAnchor),
            nextImageView.widthAnchor.constraint(equalToConstant: 100),
            nextImageView.heightAnchor.constraint(equalTo: nextImageView.widthAnchor)
        ])
    }
    
    private func initialButton() {
        let prevInteraction = UIContextMenuInteraction(delegate: self)
        prevButton.addInteraction(prevInteraction)
        prevButton.isUserInteractionEnabled = true
        
        let nextInteraction = UIContextMenuInteraction(delegate: self)
        nextButton.addInteraction(nextInteraction)
        nextButton.isUserInteractionEnabled = true
    }
}

extension PracticeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaType = info[.mediaType] as! NSString
        
        if UTTypeEqual(mediaType, kUTTypeImage) {
            let originalImage = info[.originalImage] as! UIImage
            let editedImage = info[.editedImage] as? UIImage
            let selectedImage = editedImage ?? originalImage
            saveImages.append(selectedImage)
            imageIndex += 1
        }
        
//        self.dismiss(animated: true, completion: nil)
        picker.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UIContextMenuInteractionDelegate
extension PracticeViewController: UIContextMenuInteractionDelegate {
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        
        print("\n---------- [ contextMenuInteraction ] ----------\n")
        return UIContextMenuConfiguration()
        
//        return UIContextMenuConfiguration(
//            identifier: nil,
//            previewProvider: nil) { _ in
//                let pickImage = UIAction(
//                title: "Pick Image",
//                image: UIImage(systemName: "photo")) { _ in
//
//                    print("\n---------- [ Pick Image ] ----------\n")
//                    self.present(self.imagePicker, animated: true)
//                }
//
//                let isAllowedEditing = self.imagePicker.allowsEditing
//
//                let toggleEditing = UIAction(
//                title: "Toggle Editing",
//                image: UIImage(systemName: "repeat"),
//                attributes: [.destructive],
//                state: isAllowedEditing ? .on : .off) { _ in
//                    self.imagePicker.allowsEditing.toggle()
//                }
//
//                let submenu = UIMenu(
//                    title: "Submenu",
//                    image: UIImage(systemName: "list.number"),
//                    options: [.displayInline],
//                    children: [toggleEditing])
//
//                return UIMenu(title: "ContextMenu", children: [pickImage, submenu])
//        }
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.present(self.imagePicker, animated: true)
//        }
    }

    // 원하는 뷰를 타겟 프리뷰로 지정
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, previewForHighlightingMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        
        if prevButton.interactions.contains(where: { $0 as? UIContextMenuInteraction == interaction }) {
            guard imageIndex > 0 else { return nil }
            prevImageView.alpha = 1
            prevImageView.image = saveImages[imageIndex - 1]
            return UITargetedPreview(view: prevImageView)
        } else {
            guard imageIndex < saveImages.count - 1 else { return nil }
            nextImageView.alpha = 1
            nextImageView.image = saveImages[imageIndex + 1]
            return UITargetedPreview(view: nextImageView)
        }
        
//        return UITargetedPreview(view: self.imageView)
    }
    
    // Interaction이 종료되려고 직전에 호출
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willEndFor configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?) {
        print("\n---------- [ willEndFor configuration ] ----------\n")
        if prevButton.interactions.contains(where: { $0 as? UIContextMenuInteraction == interaction }) {
            UIView.animate(withDuration: 1.5) {
                self.prevImageView.alpha = 0
            }
        } else {
            UIView.animate(withDuration: 1.5) {
                self.nextImageView.alpha = 0
            }
        }
    }
}
