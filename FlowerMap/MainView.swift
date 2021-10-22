//
//  ContentView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/07/19.
//

import SwiftUI
import MapKit

struct MainView: View {
    @State var isOpenSideMenu: Bool = false
    @State var isOpenSearch : Bool = false
    @State var isOpenContent : Bool = false
    @State var isPost = false
    @State var isRank = false
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
                        isPost = true
                    }
                    .fullScreenCover(isPresented: $isPost){
                            PostView(isPost: $isPost)
                    }
                    
                    Spacer()
                    
                    //カメラボタン
                    MainMenuButton(buttonName: "カメラ"){
                        // ぼたんの処理をかく
                    }
                    
                    Spacer()
                    
                    //ランキング
                    MainMenuButton(buttonName: "ランク"){
                        isRank = true
                    }
//                    .fullScreenCover(isPresented: $isRank){
//                            PostView(isRank: $isRank)
//                    }
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
                
            SideMenuView(isOpenSideMenu: $isOpenSideMenu, isOpenSearch: $isOpenSearch)
                .edgesIgnoringSafeArea(.all)
            }//ZStack
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
