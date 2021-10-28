//
//  ImageUploader.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/29.
//

//import UIKit
//import Firebase
//
//enum UploadType {
//    case profile
//    case post
//
//    var filePath: StorageReference {
//        let filename = NSUUID().uuidString
//        switch self {
//            case .profile:
//                return Storage.storage().reference(withPath: "/profile_images/\(filename)")
//            case .post:
//                return Storage.storage().reference(withPath: "/ppst_images/\(filename)")
//        }
//    }
//}
//
//struct ImageUploader {
//    static func uploadImage(image: UIImage, type: UploadType, completion: @escaping(String) -> Void) {
//        // 画像の圧縮
//        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
//        let ref = type.filePath
//
//        // 画像のアップロード
//        ref.putData(imageData, metadata: nil) { _, error in
//            if let error = error {
//                print("画像のアップロードに失敗しました\n\(error.localizedDescription)")
//                return
//            }
//
//            print("画像のアップロードに成功しました")
//
//            ref.downloadURL { url, _ in
//                guard let imageUrl = url?.absoluteString else { return }
//                completion(imageUrl)
//            }
//
//        }
//    }
//}
//
