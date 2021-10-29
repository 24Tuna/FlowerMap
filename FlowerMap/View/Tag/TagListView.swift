//
//  TagListView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/29.
//

import SwiftUI

struct TagListView: View {
    @ObservedObject var viewModel: TagViewModel
    @Binding var searchTagText: String  // 検索テキスト
    @Binding var tagsArray: [String]    // タグの配列
    @Binding var isTagList: Bool        // TagListを開く
    
    var tags: [Tag] {
        return searchTagText.isEmpty ? viewModel.tags : viewModel.filteredTags(searchTagText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(tags) { tag in
                    TagCell(tag: tag)
                        .padding(.leading)
                        .onTapGesture {
                            //押したときの処理
                            tagsArray.append(tag.name)  // 配列にタグを追加する
                            searchTagText = ""          // テキストフィールドをリセットする
                            isTagList = false           // リストを閉じる
                        }
                }
            }
        }
    }
}
