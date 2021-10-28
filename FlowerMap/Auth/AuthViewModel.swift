//
//  AuthViewModel.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/28.
//

//import SwiftUI
//import Firebase
//
//class AuthViewModel: ObservableObject {
//    @Published var userSession: Firebase.User?
//    @Published var currentUser: User?
//    @Published var didSendPasswordLink = false
//
//    static let shared = AuthViewModel()
//
//    init() {
//        userSession = Auth.auth().currentUser
//        fetchUser()
//    }
//
//    func login(withEmail email: String, password: String) {
//        Auth.auth().signIn(withEmail: email, password: password) { result, error in
//            if let error = error {
//                print(error.localizedDescription)
//                return
//            }
//
//            guard let user = result?.user else { return }
//            self.userSession = user
//            self.fetchUser()
//        }
//    }
//
//    func register(withEmail email: String, password: String, image: UIImage?, fullname: String, usename: String) {
//
//        guard let image = image else { return }
//
//        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
//
//            Auth.auth().createUser(withEmail: email, password: password) { result, error in
//                if let error = error {
//                    print(error.localizedDescription)
//                    return
//                }
//
//                guard let user = result?.user else { return }
//
//                let data = ["email": email, "username": usename, "fullname": fullname, "profileImageUrl": imageUrl, "uid": user.uid]
//
//                COLLECTION_USERS.document(user.uid).setData(data) { _ in
//                    self.userSession = user
//                    self.fetchUser()
//                }
//            }
//
//        }
//    }
//
//    func signout() {
//        self.userSession = nil
//        try? Auth.auth().signOut()
//    }
//
//    func resetPassword(withEmail email: String) {
//        Auth.auth().sendPasswordReset(withEmail: email) { error in
//            if let error = error {
//                print("error\(error.localizedDescription)")
//                return
//            }
//
//            self.didSendPasswordLink = true
//        }
//    }
//
//    func fetchUser() {
//        guard let uid = userSession?.uid else { return }
//        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
//            guard let snapshot = snapshot else { return }
//            guard let user = try? snapshot.data(as: User.self) else {
//                print("tryしっぱい")
//                return
//            }
//            self.currentUser = user
//        }
//    }
//}
