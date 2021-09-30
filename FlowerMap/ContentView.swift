//
//  ContentView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/07/19.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                //MapView()
                    //.edgesIgnoringSafeArea(.all)
                Color(.white)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    
                    Spacer()
                    HStack{
                        CustomButton(buttonName: "投稿"){
                            // ぼたんの処理をかく
                        }
                        
                        //カメラボタン
                        CustomButton(buttonName: "カメラ"){
                            // ぼたんの処理をかく
                            
                        }
                        
                        //ランキング
                        CustomButton(buttonName: "ランキング"){
                            // ぼたんの処理をかく
                        }
                        
                        
                    }//HStack
                    .frame(height: 120)
                    .background(Color("backColor"))
                    .frame(height:0)
                }//VStack
                
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                                
                        }){
                            Image("MenuIcon")
                        }
                    }
                })//toolbar
            }//ZStack
        }//NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
