//
//  SideMenuView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/09/30.
//

import SwiftUI

struct SideMenuView: View {
    // レイアウト
    let spacer_Width = UIScreen.main.bounds.size.width / 2.5
    let scrollHeight = UIScreen.main.bounds.size.height / 1.8
    let animation_Width = 270
    
    let user: User
    
    @Binding var isOpenSideMenu : Bool
    @Binding var isOpenSearch : Bool
    //ActionSheetのsheet
    @State var isShowAction = false
    
    //入力中の文字列を保持する状態変数
    @State var inputText:String = ""
    //検索キーワードを保持する状態変数
    @State var dispSearchKey = ""
    
    @ObservedObject var viewModel = TagViewModel()
    

    
    var body: some View {
        
        
        ZStack{
            GeometryReader{ geometry in
                EmptyView()
            }
            .background(Color.gray.opacity(0.5))
            .opacity(self.isOpenSideMenu ? 1.0 : 0.0)
            .animation(.easeIn(duration: 0.25))
            .onTapGesture {
                self.isOpenSideMenu = false
            }
            
            HStack{
                List{
                    SideMenuButton(buttonName: "マイページ"){
                        self.isShowAction.toggle()
                        self.isOpenSideMenu = false
                    }
                    .fullScreenCover(isPresented:$isShowAction){
                        MyPageView(config: .profile(user.uid), isShowAction: $isShowAction)
                    }
                    
                    SideMenuButton(buttonName: "検索"){
                        self.isOpenSearch.toggle()
                    }
                    
                    ScrollView(.vertical){
                        TextField("住所検索",text:$inputText,onCommit:{
                            //入力が完了したので検索キーワードに設定する
                            dispSearchKey = inputText
                            //検索キーワードをデバックエリアに出力する
                            print("入力したキーワード："+dispSearchKey)
                        })
                        .frame(height:55)
                        .opacity(self.isOpenSearch ? 1.0 : 0.0)
                        .animation(.easeIn(duration: 0.25))
                
                        CaptionView(capText:"春")
                        ForEach(viewModel.tags) { tag in
                            
                            if tag.type == "spring" {
                                TagCell(tag: tag)
                            }
                        }
                        
                        CaptionView(capText:"夏")
                        ForEach(viewModel.tags) { tag in
                            
                            if tag.type == "summer" {
                                TagCell(tag: tag)
                            }
                        }

                        CaptionView(capText:"秋")
                        ForEach(viewModel.tags) { tag in
                            
                            if tag.type == "autumn" {
                                TagCell(tag: tag)
                            }
                        }
                        
                        CaptionView(capText:"冬")
                        ForEach(viewModel.tags) { tag in
                            
                            if tag.type == "winter" {
                                TagCell(tag: tag)
                            }
                        }
                    }//ScrollView
                    .opacity(self.isOpenSearch ? 1.0 : 0.0)
                    .animation(.easeIn(duration: 0.25))
                    .frame(height:scrollHeight)
                    
                }
                .background(Color("backColor"))
                .offset(x: CGFloat(self.isOpenSideMenu ? 0 : -animation_Width))
                .animation(.easeIn(duration: 0.25))
                Spacer()
                    .frame(width:spacer_Width)
            }
        }
    }
}
