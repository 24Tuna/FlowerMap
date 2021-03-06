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
    @Binding var isShowAction : Bool
    
    let config: PostGridConfiguration
    @ObservedObject var mySubmissionViewModel: PostGridViewModel
    @ObservedObject var likeViewModel = LikeCellViewModel()
    
    init(config: PostGridConfiguration, isShowAction: Binding<Bool>) {
        self.config = config
        
        self.mySubmissionViewModel = PostGridViewModel(config: config)

        
        self._isShowAction = isShowAction
        
    }

    let photoWidth = UIScreen.main.bounds.size.width / 4
    let photoHeight = UIScreen.main.bounds.size.height / 10
    let photoFrameWidth = UIScreen.main.bounds.size.width / 2.5
    let photoFrameHeight = UIScreen.main.bounds.size.height / 6.5
    
    let favoriteWidth = UIScreen.main.bounds.size.width / 5
    let favoriteHeight = UIScreen.main.bounds.size.height / 0
    let favoriteFrameWidth = UIScreen.main.bounds.size.width / 3.7
    let favoriteFrameHeight = UIScreen.main.bounds.size.height / 6.5
    
    let submissionHeight = UIScreen.main.bounds.size.height / 4.5
    
    var body: some View {
        ZStack {
            Color("backColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack{
                    Spacer()
                    CloseButtonView(isOpen: $isShowAction)
                    Spacer()
                        .frame(width:20)
                }
                
                HStack {
                    Button(action: {
                        // 投稿一覧表示
                        isMyPhotos = true
                        isMyfavorite = false
                    }) {
                        ZStack {
                            if isMyPhotos {
                                Color(.white)
                                    .frame(width: photoFrameWidth, height: photoFrameHeight)
                                    .cornerRadius(30)
                            }
                            Image("Photo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: photoWidth, height: photoHeight)
                        }
                    }
                    .frame(width: photoFrameWidth, height: photoFrameHeight)

                    .padding()
                    
                    Button(action: {
                        // いいねした投稿一覧
                        isMyfavorite = true
                        isMyPhotos = false
                    }) {
                        ZStack {
                            if isMyfavorite {
                                Color(.white)
                                    .frame(width: favoriteFrameWidth, height: favoriteFrameHeight)
                                    .cornerRadius(30)
                            }
                            Image("favorite")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: favoriteWidth, height: favoriteHeight)
                        }
                    }
                    .frame(width: favoriteFrameWidth, height: favoriteFrameHeight)
                    .padding()
                    
                } //HStack
                
                
                ScrollView([.vertical]) {
                    ForEach (isMyPhotos ? mySubmissionViewModel.posts : likeViewModel.post) { post in
                        MySubmission(post: post)
                            .padding()
                            .frame(height: submissionHeight)
                    }
                } //ScrollView
                
            } //VStack
        } //ZStack
    }
}

//struct MyPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyPageView(isShowAction: .constant(true))
//    }
//}
