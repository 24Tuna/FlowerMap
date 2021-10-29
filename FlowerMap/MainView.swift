//
//  ContentView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/07/19.
//

import SwiftUI
import MapKit

struct MainView: View {
    
    let user: User
    
    @State var isOpenSideMenu: Bool = false
    @State var isOpenSearch : Bool = false
    @State var isOpenContent : Bool = false
    
    @State var isPost = false
    @State var isRank = false
    @State var isCamera = false
    
    @State var captureImage : UIImage? = nil
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
                    .sheet(isPresented: $isPost,content:{
                            PostView(isPost: $isPost)
                    })
                    
                    Spacer()
                    
                    //カメラボタン
                    MainMenuButton(buttonName: "カメラ"){
                        // ぼたんの処理をかく
                        if UIImagePickerController.isSourceTypeAvailable(.camera){
                            isCamera = true
                        }else{
                            
                        }
                    }
                    .sheet(isPresented: $isCamera, content: {
                        ImagePickerView(isCamera: $isCamera, captureImage: $captureImage)
                    })
                    
                    Spacer()
                    
                    //ランキング
                    MainMenuButton(buttonName: "ランク"){
                        isRank = true
                    }
                    .fullScreenCover(isPresented: $isRank){
                            RnkingView(isRank: $isRank)
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
                
                SideMenuView(user: user, isOpenSideMenu: $isOpenSideMenu, isOpenSearch: $isOpenSearch)
                .edgesIgnoringSafeArea(.all)
            }//ZStack
        }
    }
}
