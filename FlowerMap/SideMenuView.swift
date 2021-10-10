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
    
    //入力中の文字列を保持する状態変数
    @State var inputText:String = ""
    //検索キーワードを保持する状態変数
    @State var dispSearchKey = ""
    
    //FIXME:後でデータベースに差し替える
    let spring_Flos:[String] = [""]
    let summer_Flos:[String] = [""]
    let fall_Flos:[String] = [""]
    let winter_Flos:[String] = ["椿"]
    
    let spacer_Width = UIScreen.main.bounds.size.width / 2.5
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
                        //TODO: 後でマイページに飛ぶ処理を書く
                    }
                    SideMenuButton(buttonName: "検索"){
                        self.isOpenSearch.toggle()
                    }
                    TextField("キーワードを入力してください",text:$inputText,onCommit:{
                        //入力が完了したので検索キーワードに設定する
                        dispSearchKey = inputText
                        //検索キーワードをデバックエリアに出力する
                        print("入力したキーワード："+dispSearchKey)
                    })
                    List{
                        Text("春")
                            .font(.headline)
                        ForEach(0..<spring_Flos.count){ num in
                                SearchMenuButton(buttonName: spring_Flos[num]){
                                    
                                }
                            }

                        Text("夏")
                            .font(.headline)
                        ForEach(0..<summer_Flos.count){ num in
                            SearchMenuButton(buttonName: summer_Flos[num]){
                                
                            }
                        }

                        Text("秋")
                            .font(.headline)
                        ForEach(0..<fall_Flos.count){ num in
                            SearchMenuButton(buttonName: fall_Flos[num]){
                                
                            }
                        }

                        Text("冬")
                            .font(.headline)
                        ForEach(0..<winter_Flos.count){ num in
                            SearchMenuButton(buttonName: winter_Flos[num]){
                                
                            }
                        }
                    }//List
                    .opacity(self.isOpenSearch ? 1.0 : 0.0)
                    .animation(.easeIn(duration: 0.25))
                    
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
