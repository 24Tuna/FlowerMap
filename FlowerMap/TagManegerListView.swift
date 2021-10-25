//
//  TagListView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/21.
//

import SwiftUI

struct TagManegerListView: View {
    
    
    let windowWidth = UIScreen.main.bounds.size.width / 1.2
    
    let tags:[String] = ["タグ名","タグ名", "タグタグタグ","ホゲホゲ","ア","test","hogehoge"]
    
//    init(){
//        //List全体の背景色の設定
//        UITableView.appearance().backgroundColor = .clear
//    }
    
    @Binding var isOpenList : Bool
    
    var body: some View {
        ZStack{
            GeometryReader{ geometry in
                EmptyView()
            }
            .background(Color.gray.opacity(0.5))
            .opacity(self.isOpenList ? 1.0 : 0.0)
            .animation(.easeIn(duration: 0.25))
            .onTapGesture {
                self.isOpenList = false
            }
            VStack{
                HStack{
                    Spacer()
                    CloseButtonView(isOpen: $isOpenList)
                }//HStack
                List{
                    ForEach(0..<tags.count){num in
                        PostTagView(tagText: tags[num])
                            .listRowBackground(Color("buttonFontColor"))
                    }
                }
            }//Vstack
            .frame(width: windowWidth)
            .padding()
            .background(Color("buttonFontColor"))
        }//ZStack
        .opacity(self.isOpenList ? 1.0 : 0.0)
        .animation(.easeIn(duration: 0.25))
        .onAppear(perform: {
            UITableView.appearance().backgroundColor = .clear
        })
    }
}

struct TagListView_Previews: PreviewProvider {
    
    static var previews: some View {
        TagManegerListView(isOpenList: .constant(true))
    }
}
