//
//  PostManagerView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/11.
//
import UIKit
import SwiftUI

class PostViewModel: ObservableObject {
    var sum: CGFloat = 0
    
    func makeTag(tagName: String, width: CGFloat) -> (isShow: Bool, view: PostTagView){
        let tag = PostTagView(tagText: tagName)
        sum += tag.fontWidth + 80
        
        if sum > width - 25 {
            return (false, tag)
        } else {
            return (true, tag)
        }
        
    }
    
}

struct PostView: View {
    @Binding var isPost : Bool
    //入力中の文字列を保持する状態変数
    @State var inputAddress:String = ""
    //検索キーワードを保持する状態変数
    @State var postAddress = ""
    
    @State var isOpenList : Bool = false
    @State var isAddTag : Bool = false
    
    @State var isShowSheet = false
    @State var isPhotoLibrary = false
    @State var isShowAction = false
    
    let tags:[String] = ["タグ名","タグ名", "タグタグタグ","test"]
    
    var sumWidth = 0.0
    let windowWidth = UIScreen.main.bounds.size.width / 1.2
    let windowHeight = UIScreen.main.bounds.size.height / 1.2
   
    
    let postViewModel = PostViewModel()
    
    
    @State var postImage: Image?
    
    
//    let captureImage: UIImage
//    //投稿する写真(showImage)
//    @State var postImage:UIImage?
    
    
    
    var body: some View {
        ZStack{
            Color("backColor")
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                HStack{
                    Spacer()
                    CloseButtonView(isOpen: $isPost)
                }
                
                Button(action: {
                    isShowAction = true
                }){
                    
                    Image("picture")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                }.sheet(isPresented: $isShowSheet){
//                    if isPhotoLibrary{
//                        PHPickerView(
//                            isShowSheet: $isShowSheet,
//                            captureImage: $captureImage)
//                    }else{
//                        ImagePickerView(
//                            isShowSheet: $isShowSheet,
//                            captureImage: $captureImage)
//                    }
                }
                .actionSheet(isPresented: $isShowAction){
                    ActionSheet(title: Text("")）
                }
                
                    
                    Spacer()
                    
                    //タグ
                    Group{
                        HStack{
                            Text("タグ")
                                .font(.title)
                            Spacer()
                        }
                    
                        
                        HStack{
                            ForEach(0..<tags.count){num in
                                    
                                let tag: (isShow: Bool, view: PostTagView) = postViewModel.makeTag(tagName: tags[num], width: windowWidth)
                                    
                                if tag.isShow {
                                    tag.view
                                }else{
                                    Button(action: {
                                        self.isOpenList.toggle()
                                    }){
                                        Image(systemName: "list.bullet")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25)
                                            .padding()
                                            .foregroundColor(Color("tagColor"))
                                    }
                                    
                                    
                                }
                            }//ForEach
                            
                        }//HStack
                        
                        Spacer()
                            .frame(height:20)
                        
                        HStack{
                            Button(action: {
                                ///TODO:タグの追加処理を書く
                                self.isAddTag.toggle()
                            }){
                                HStack{
                                    Image(systemName: "plus")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:25)
                                        .foregroundColor(Color("tagColor"))
                                    Text("タグを追加する")
                                        .foregroundColor(Color("tagColor"))
                                }
                            }
                            .frame(height:40)
                            .background(Color(.white))
                            
                            Spacer()
                        }//HStack
                    }//Group
                    
                    Spacer()
                        .frame(height:20)
                    //位置情報
                    Group{
                        HStack{
                            
                            Text("位置情報")
                                .font(.title)
                            Spacer()
                        }
                        TextField("住所",text:$inputAddress,onCommit:{
                            //入力が完了したので検索キーワードに設定する
                            postAddress = inputAddress
                            //検索キーワードをデバックエリアに出力する
                            print("入力したキーワード："+postAddress)
                        })
                        .frame(height: 30)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color("backColor"))
                            .padding(.leading, 16)
                            .padding(.trailing, 16)
                    }
                    
                    Spacer()
                    
                    Button(action:{
                        
                    }){
                        HStack{
                            Image(systemName:"plus.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:30)
                                .foregroundColor(Color.white)
                                .padding()
                            Text("投稿する")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .padding()
                        }
                    }
                    .background(Color(red:58/255,green:171/255, blue:210/255))
                }//VStack
                .frame(width: windowWidth, height: windowHeight)
                .padding()
                .background(Color("buttonFontColor"))
            TagManegerListView(isOpenList: $isOpenList)
                .edgesIgnoringSafeArea(.all)
            AddTagView(isAddTag: $isAddTag)
                .edgesIgnoringSafeArea(.all)
            }//ZStack
    }//body
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView(isPost: Binding.constant(true)
//                 ,captureImage: )
//    }
//}

