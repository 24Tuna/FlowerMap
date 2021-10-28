//
//  User.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/26.
//

import FirebaseFirestoreSwift

/// ユーザー情報
struct  User: Identifiable, Decodable {
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    let uid: String
    @DocumentID var id: String?
    var bio: String
    var isFollowed: Bool? = false
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
}
