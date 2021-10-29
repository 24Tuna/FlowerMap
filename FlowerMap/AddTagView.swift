//
//  AddTagView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/25.
//

import SwiftUI

struct AddTagView: View {
    @State var inputTag:String = ""
    @State var tagName:String = ""
    @State var tag: String = ""
    
    @State var isTagList = false
    @Binding var tagsArray: [String]    // タグの配列
    @State var searchText = ""          // タグ検索のテキスト
    
    @Binding var isAddTag:Bool
    
    @ObservedObject var viewModel: TagViewModel
    
    var body: some View {
        ZStack{
            GeometryReader{ geometry in
                EmptyView()
            }
            .background(Color.gray.opacity(0.6))
            .opacity(self.isAddTag ? 1.0 : 0.0)
            .animation(.easeIn(duration: 0.25))
            .onTapGesture {
                self.isAddTag = false
            }
            VStack{
                Text("タグを追加する")
                
//                選択されたタグの一時表示
//                レイアウトの修正お願いします
                Text(tag)
                
                TextField("追加するタグ",text:$inputTag,onCommit:{
                    tagName = inputTag
                })
                .onTapGesture {
                    // TagListを開く
                    isTagList = true
                }
                
                if isTagList {
//                     レイアウトの修正お願いします
                    
                    TagListView(viewModel: viewModel,
                                tagName: $tag, searchTagText: $searchText, isTagList: $isTagList)
                        .frame(width: 140, height: 140)
                        .background(Color.white)
                }
                
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color("backColor"))
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
       
                // 追加確定ボタン
                Button {
                    // 配列にタグを追加する
//                    tagsArray.append(tag.name)
                } label: {

                //タグを追加するボタン
                Button(action: {
                    
                }){

                    HStack{
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:25)
                            .foregroundColor(Color("tagColor"))
                        Text("タグを追加する")
                            .foregroundColor(Color("tagColor"))
                            .padding()
                    }
                }
                .background(Color.white)
                .frame(height:55)

            }//VStack
        }
            .padding()
            .background(Color("buttonFontColor"))

        }//ZStack

        .opacity(self.isAddTag ? 1.0 : 0.0)
        .animation(.easeIn(duration: 0.25))
    }
}

//struct AddTagView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddTagView(isAddTag: .constant(true), tagsArray: <#Binding<[String]>#>)
//    }
//}
