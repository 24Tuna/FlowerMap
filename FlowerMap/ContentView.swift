//
//  ContentView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/07/19.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var isOpenSideMenu: Bool = false
    @State var isOpenSearch : Bool = false
//    @State var select : Bool = false
    var body: some View {
        ZStack{
                
                //MapView()
                    //.edgesIgnoringSafeArea(.all)
                //FIXME:↓のColorはマップを実装するまでの仮置き
                
            Color(.white)
                .edgesIgnoringSafeArea(.all)
                
            VStack{
                    
                Spacer()
                    .frame(height:20)
                    
                HStack{
                    Button(action: {
                            //TODO:サイドメニューを開く
                        self.isOpenSideMenu.toggle()
                    }){
                        Image("MenuIcon")
                    }
                    .padding()
                    Spacer()
                }
                    
                Spacer()
                HStack{
                    MainMenuButton(buttonName: "投稿"){
                        // ぼたんの処理をかく
                    }
                    
                    //カメラボタン
                    MainMenuButton(buttonName: "カメラ"){
                        // ぼたんの処理をかく
                    }
                    
                    //ランキング
                    MainMenuButton(buttonName: "ランキング"){
                        // ぼたんの処理をかく
                    }
                    
                }//HStack
                .frame(height: 120)
                .background(Color("backColor"))
                .frame(height:0)
            }//VStack
                
            SideMenuView(isOpenSideMenu:  $isOpenSideMenu,                     isOpenSearch: $isOpenSearch)
                .edgesIgnoringSafeArea(.all)
        }//ZStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
