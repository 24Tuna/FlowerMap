//
//  Post.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/26.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable,Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let tag: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    let ownerImageUrl: String
    
    var didLike: Bool? = false
}
