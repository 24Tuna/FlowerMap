//
//  FlowerPostViewModel.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/29.
//

import SwiftUI
import Firebase

class FlowerViewModel: ObservableObject {
    /// タグ付けされた花の一覧
    @Published var post = [Post]()
    @Published var tag: Tag!

    init(flowerName: String, tag: Tag) {
        self.tag = tag
        flowerPost()
    }
    
    init() {
        flowerPost()
    }

    func flowerPost() {
        //guard let tagId = tag.id else { return }
        let query = COLLECTION_POSTS.whereField("tags", arrayContains: "菊")

        query.getDocuments { snapshots, _ in
            guard let snapshots = snapshots else { return }
            
            let _ = snapshots.documents.compactMap { snapshot in
                guard let document = try? snapshot.data(as: Post.self) else { return }
                dump(document.tags)
                
                self.post.append(document)
                
            }


            
            
            
//            let _ = documents.compactMap{ snapshot in
//                let query = COLLECTION_POSTS.document(snapshot.documentID)
//                query.getDocument { snapshots, error in
//                    guard let snapshots = snapshots else { return }
//
//                    guard let data = try? snapshots.data(as: Post.self) else { return }
//
//                    self.post.append(data)
//
//                    print("")
//                }
//            }
        }
    }
    
}
