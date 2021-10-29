//
//  TagListView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/29.
//

//import SwiftUI
//
//struct TagListView: View {
//    @ObservedObject var viewModel: TagViewModel
//    @Binding var tagName: String        // 仮表示のタグ
//    @Binding var searchTagText: String  // 検索テキスト
//    @Binding var isTagList: Bool        // TagListを開く
//
//    var tags: [Tag] {
//        return searchTagText.isEmpty ? viewModel.tags : viewModel.filteredTags(searchTagText)
//    }
//
//    var body: some View {
//        ScrollView {
//            LazyVStack {
//                ForEach(tags) { tag in
//                    TagCell(tag: tag)
//                        .padding(.leading)
//                        .onTapGesture {
//                            //押したときの処理
//                            tagsArray.append(tag.name)  // 配列にタグを追加する
//                            tagName = tag.name          // タグを仮表示する
//                            searchTagText = ""          // テキストフィールドをリセットする
//                            isTagList = false           // リストを閉じる
//                        }
//                }
//            }
//        }
//    }
//}
