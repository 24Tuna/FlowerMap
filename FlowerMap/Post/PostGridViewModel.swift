//
//  PostGridView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/26.
//

import SwiftUI

enum PostGridConfiguration {
    case explore
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    /// 投稿の配列
    @Published var posts = [Post]()
    
    let config: PostGridConfiguration
    
    init(config: PostGridConfiguration) {
        self.config = config
        fetchPosts(forConfig: config)
    }
    
    // なんの投稿をとってくるか
    func fetchPosts(forConfig config: PostGridConfiguration) {
        switch config {
        case .explore:
            fetchExplorePsgePosts()
        case .profile(let uid):
            fetchUserPosts(forUid: uid)
        }
    }
    
    // 全ユーザーの全ての投稿をとってくる。Viewを見た限り使わなさそうな気がする
    func fetchExplorePsgePosts() {
        COLLECTION_POSTS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self )})
            
//            print("nekochan222\(documents)")
//
//            for document in snapshot!.documents {
//                print("\(document.documentID) => \(document.data())")
//            }
        }
    }
    
    // ログインした人がアップした投稿を表示する（MyPage用？）
    func fetchUserPosts(forUid uid: String) {
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let posts = documents.compactMap({ try? $0.data(as: Post.self )})
            self.posts = posts.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
            
//            print("nekochan\(documents)")
        }
    }
}
