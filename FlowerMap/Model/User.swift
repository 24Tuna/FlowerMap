////
////  User.swift
////  FlowerMap
////
////  Created by cmStudent on 2021/10/28.
////
//
//import FirebaseFirestoreSwift
//
//struct  User: Identifiable, Decodable {
//    @DocumentID var id: String?
//    
//    let username: String
//    let email: String
//    let profileImageUrl: String
//    
//    var stats: UserStats?
//    var isFollowed: Bool? = false
//    
//    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
//}
//
//struct UserStats: Decodable {
//    var following: Int
//    var posts: Int
//    var followers: Int
//}
