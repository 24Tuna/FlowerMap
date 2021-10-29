//
//  UploadPostViewModel.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/29.
//

import SwiftUI
import Firebase

typealias FirestoreCompletion = ((Error?) -> Void)?

class UploadPostViewModel: ObservableObject {
    
    func uploadPost(tags: [Tag.ID], location: String, image: UIImage,
                    completion: FirestoreCompletion) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
            
            let data = ["tags": tags,
                        "location": location,
                        "timestamp": Timestamp(date: Date()),
                        "likes": 0,
                        "imageUrl": imageUrl,
                        "ownerUid": user.id ?? ""] as [String : Any]
            
            COLLECTION_POSTS.addDocument(data: data, completion: completion)
        }
    }
}

