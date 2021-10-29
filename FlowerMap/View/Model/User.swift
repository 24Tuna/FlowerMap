////
////  User.swift
////  FlowerMap
////
////  Created by cmStudent on 2021/10/28.
////
//
import FirebaseFirestoreSwift
struct User: Identifiable, Decodable {
  @DocumentID var id: String?
  /// ユーザーのメール
  let email: String
  /// ユーザーの一意なID
  let uid: String
  var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
}
