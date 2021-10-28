//
//  TagViewModel.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/29.
//

//import SwiftUI
//
//class TagViewModel: ObservableObject {
//    @Published var tags = [Tag]()
//    
//    init() {
//        fetchTags()
//    }
//    
//    // タグの取得
//    func fetchTags() {
//        COLLECTION_TAGS.getDocuments { snapshot, _ in
//            guard let documents = snapshot?.documents else { return }
//            self.tags = documents.compactMap({try? $0.data(as: Tag.self)})
//        }
//    }
//    
//    // タグの検索
//    func filteredTags(_ query: String) -> [Tag] {
//        let lowercasedQuery = query.lowercased()
//        return tags.filter({ $0.searchName.lowercased().contains(lowercasedQuery)})
//    }
//}

