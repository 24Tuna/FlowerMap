//
//  LikesCellViewModel.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/27.
//

import SwiftUI
import Firebase

// いいね一覧につかう
class LikeCellViewModel: ObservableObject {
    @Published var post = [Post]()
    var likes = [Any]()

    init() {
        likePost()
    }

    func likePost() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }

        let query = COLLECTION_USERS.document(uid).collection("user-likes")

        query.getDocuments { snapshot, _ in

            guard let snapshot = snapshot else { return }

            let documents = snapshot.documents
            let _ = documents.compactMap{ snapshot in
                let query = COLLECTION_POSTS.document(snapshot.documentID)
                query.getDocument { snapshots, error in
                    guard let snapshots = snapshots else { return }

                    guard let data = try? snapshots.data(as: Post.self) else { return }

                    self.post.append(data)
                }
            }
        }
    }
}




