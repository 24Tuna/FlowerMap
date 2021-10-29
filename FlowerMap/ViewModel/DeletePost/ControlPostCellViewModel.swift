//
//  ControlPostCellViewModel.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/29.
//

import SwiftUI

class ControlPostCellViewModel: ObservableObject {
    @Published var post: Post

    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: post.timestamp.dateValue(), to: Date()) ?? ""
    }

    init(post: Post) {
        self.post = post
    }
    
    // 投稿の削除
    func deletePost() {
        COLLECTION_POSTS.document(post.id! ).delete(){ error in
            if let error = error {
                    print("Error removing document: \(error)")
                } else {
                    print("Document successfully removed!")
                }
        }
    }
}
