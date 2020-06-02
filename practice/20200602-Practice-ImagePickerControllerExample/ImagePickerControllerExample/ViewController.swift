//
//  ViewController.swift
//  ImagePickerControllerExample
//
//  Created by giftbot on 2020. 6. 1..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MobileCoreServices
import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    private lazy var imagePicker : UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        return imagePicker
    }() // ()하면 함수를 실행하는 형태가 됨
    
    // MARK: Action
    
    @IBAction private func pickImage(_ sender: Any) {
        print("\n---------- [ pickImage ] ----------\n")
        
        imagePicker.sourceType = .savedPhotosAlbum
//        imagePicker.sourceType = .photoLibrary // Default
        
        /*
         photoLibrary - 앨범을 선택하는 화면을 표시 후, 선택한 앨범에서 사진 선택
         camera - 새로운 사진 촬영
         savedPhotosAlbum - 최근에 찍은 사진들을 나열
         */
        
        imagePicker.mediaTypes = [kUTTypeImage, kUTTypeMovie] as [String]
        
        present(imagePicker, animated: true)
    }
    
    
    @IBAction private func takePicture(_ sender: Any) {
        print("\n---------- [ takePicture ] ----------\n")
        
        // 카메라 사용 할 수 있는지 체크
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        imagePicker.sourceType = .camera
        
        print(imagePicker.mediaTypes) // ["public.image"]
        let mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)
        print(mediaTypes) // Optional(["public.image", "public.movie"])
        
        imagePicker.mediaTypes = mediaTypes ?? []
        imagePicker.mediaTypes = ["public.image", "public.movie"]
        
        
        // import MobileCoreServices
        // kUTTypeVideo - 영상
        // kUTTypeMovie - 영상 + 소리 => 마이크로폰 권한이 필요함
        imagePicker.mediaTypes = [kUTTypeImage, kUTTypeMovie] as [String]
        
        if UIImagePickerController.isFlashAvailable(for: .rear) {
            imagePicker.cameraFlashMode = .auto
        }
        
        present(imagePicker, animated: true)
    }
    
    @IBAction private func takePictureWithDelay(_ sender: Any) {
        print("\n---------- [ takePictureWithDelay ] ----------\n")
        
        // 카메라 사용 할 수 있는지 체크
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        imagePicker.sourceType = .camera
        imagePicker.mediaTypes = [kUTTypeImage] as [String]
        
        present(imagePicker, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.imagePicker.takePicture()
            }
        }
    }
    
    @IBAction private func recordingVideo(_ sender: Any) {
        print("\n---------- [ recordingVideo ] ----------\n")
        // 카메라 사용 할 수 있는지 체크
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        imagePicker.sourceType = .camera
        imagePicker.mediaTypes = [kUTTypeMovie] as [String]
        
        imagePicker.cameraCaptureMode = .video // 기본 모드로 설정하는 것(photo, video)
        
        guard UIImagePickerController.isFlashAvailable(for: .rear) else { return }
        imagePicker.cameraDevice = .rear // .front 전면, .rear 후면
        
        present(imagePicker, animated: true)
        
//        imagePicker.startVideoCapture()
//        imagePicker.stopVideoCapture()
        
//        imagePicker.videoMaximumDuration = 60 // Video 시간 제한, Default 10분
//        imagePicker.videoQuality = .typeHigh // medium => Default
    }
    
    @IBAction private func toggleAllowsEditing(_ sender: Any) {
        print("\n---------- [ toggleAllowsEditing ] ----------\n")
        
        imagePicker.allowsEditing.toggle() // 사진을 가져올 때 편집 할 수 있도록 하는 것(크기 조절, 확대 등)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Cancel 메서드에서 할 작업이 없으면 생략해도 됨
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("\n---------- [ imagePickerControllerDidCancel ] ----------\n")
//        picker.presentingViewController?.dismiss(animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("\n---------- [ didFinishPickingMediaWithInfo ] ----------\n")
        
        
        let mediaType = info[.mediaType] as! NSString
        if UTTypeEqual(mediaType, kUTTypeImage) {
            let originalImage = info[.originalImage] as! UIImage
            let editedImage = info[.editedImage] as? UIImage
//            let selectedImage = editedImage != nil ? editedImage : originalImage
            let selectedImage = editedImage ?? originalImage
            imageView.image = selectedImage
            
            if picker.sourceType == .camera {
                
                UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil)
                
            }
        } else if UTTypeEqual(mediaType, kUTTypeMovie) {
            if let mediaPath = (info[.mediaURL] as? NSURL)?.path,
                UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(mediaPath) {
                
                UISaveVideoAtPathToSavedPhotosAlbum(mediaPath, nil, nil, nil)
                
            }
        }
        
//        picker.presentingViewController?.dismiss(animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
    }
    
}
