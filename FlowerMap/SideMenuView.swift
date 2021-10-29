//
//  SideMenuView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/09/30.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isOpenSideMenu : Bool
    @Binding var isOpenSearch : Bool
    //ActionSheetのsheet
    @State var isShowAction = false
    
    //入力中の文字列を保持する状態変数
    @State var inputText:String = ""
    //検索キーワードを保持する状態変数
    @State var dispSearchKey = ""
    
    //FIXME:後でデータベースに差し替える
    let springFlos:[String] = [""]
    let summerFlos:[String] = [""]
    let fallFlos:[String] = [""]
    let winterFlos:[String] = ["ツバキ"]
    
    let spacer_Width = UIScreen.main.bounds.size.width / 2.5
    let scrollHeight = UIScreen.main.bounds.size.height / 1.8
    let animation_Width = 270
    
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
                        MyPageView(isShowAction: $isShowAction)
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
                        ForEach(0..<springFlos.count){ num in
                                SearchMenuButton(buttonName: springFlos[num]){
                                    
                                }
                            }
                        
                        CaptionView(capText:"夏")
                        ForEach(0..<summerFlos.count){ num in
                            SearchMenuButton(buttonName: summerFlos[num]){
                                
                            }
                        }

                        CaptionView(capText:"秋")
                        ForEach(0..<fallFlos.count){ num in
                            SearchMenuButton(buttonName: fallFlos[num]){
                                
                            }
                        }
                        
                        CaptionView(capText:"冬")
                        ForEach(0..<winterFlos.count){ num in
                            SearchMenuButton(buttonName: winterFlos[num]){
                                
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

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(
            isOpenSideMenu: Binding.constant(true),
            isOpenSearch: Binding.constant(true)
        )
    }
}
