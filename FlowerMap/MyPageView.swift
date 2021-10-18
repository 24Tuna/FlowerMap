//
//  MyPageView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/08.
//

import SwiftUI

struct MyPageView: View {
    @State var isMyPhotos = true
    @State var isMyfavorite = false
    var body: some View {
        ZStack {
            Color("backColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: {
                        // 投稿一覧表示
                        isMyPhotos = true
                        isMyfavorite = false
                    }) {
                        ZStack {
                            if isMyPhotos {
                                Color(.white)
                                    .frame(width: 120, height: 85, alignment: .center)
                                    .cornerRadius(30)
                            }
                            Image("Photo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 50, alignment: .center)
                        }
                    }
                    .frame(width: 120, height: 85)
                    
                    .padding()
                    
                    Button(action: {
                        // いいねした投稿一覧
                        isMyfavorite = true
                        isMyPhotos = false
                    }) {
                        ZStack {
                            if isMyfavorite {
                                Color(.white)
                                    .frame(width: 85, height: 85, alignment: .center)
                                    .cornerRadius(30)
                            }
                            Image("favorite")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60, alignment: .center)
                        }
                    }
                    .frame(width: 85, height: 85, alignment: .center)
                    
                    .padding()
                    
                } //HStack
                
                ScrollView {
                    MySubmission()
                } //ScrollView
            } //VStack
        } //ZStack
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
