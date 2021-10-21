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
    var body: some View {
        NavigationView{
            ZStack{
                
                //MapView()
                    //.edgesIgnoringSafeArea(.all)
                //FIXME:↓のColorはマップを実装するまでの仮置き
                
            Color(.white)
                .edgesIgnoringSafeArea(.all)
                
            VStack{
                    
                Spacer()
                HStack{
                    
                    Spacer()
                    
                    MainMenuButton(buttonName: "投稿"){
                        // ぼたんの処理をかく
                    }
                    
                    Spacer()
                    
                    //カメラボタン
                    MainMenuButton(buttonName: "カメラ"){
                        // ぼたんの処理をかく
                    }
                    
                    Spacer()
                    
                    //ランキング
                    MainMenuButton(buttonName: "ランク"){
                        // ぼたんの処理をかく
                    }
                    
                    Spacer()
                    
                }//HStack
                .frame(width:.infinity,height: 120)
                .background(Color("backColor"))
            }//VStack
                
            .toolbar(content: {
                ToolbarItem(placement:.navigationBarLeading) {
                    Button(action: {
                        //TODO:サイドメニューを開く
                        self.isOpenSideMenu.toggle()
                    }){
                        Image("MenuIcon")
                    }
                }
            })//toolbar
                
            SideMenuView(isOpenSideMenu:  $isOpenSideMenu,                     isOpenSearch: $isOpenSearch)
                .edgesIgnoringSafeArea(.all)
        }//ZStack
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
