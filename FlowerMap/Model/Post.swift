////
////  Post.swift
////  FlowerMap
////
////  Created by cmStudent on 2021/10/28.
////
////
//import FirebaseFirestoreSwift
//import Firebase
//
//struct Post: Identifiable,Decodable {
//    @DocumentID var id: String?
//    let ownerUid: String        // 投稿者のID
//    let ownerUsername: String   // 投稿者のユーザーネーム
//    let ownerImageUrl: String   // 投稿者のアイコン画像のURL
//
<<<<<<< HEAD
//    var likes: Int              // 投稿についたいいねの数
//    let imageUrl: String        // 投稿された画像のURL
//    let timestamp: Timestamp    // 投稿時間
//    let location: String        // 位置情報
//    var tags: [String]          // タグ
//}
=======
//  Created by cmStudent on 2021/10/28.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable,Decodable {
    @DocumentID var id: String?
    let ownerUid: String        // 投稿者のID    
    var likes: Int              // 投稿についたいいねの数
    let imageUrl: String        // 投稿された画像のURL
    let timestamp: Timestamp    // 投稿時間
    let location: String        // 位置情報
    var tags: [String]          // タグ
}
>>>>>>> c39ce46f8466736296a89b3152fc72ffbc822c45