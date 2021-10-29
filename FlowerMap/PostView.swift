//
//  PostManagerView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/11.
//
import UIKit
import SwiftUI

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
    
    @State private var showingAlert = false
    
    let tags:[String] = ["タグ名","タグ名", "タグタグタグ","test"]
    
    var sumWidth = 0.0
    let windowWidth = UIScreen.main.bounds.size.width / 1.2
    let windowHeight = UIScreen.main.bounds.size.height / 1.2
    
    var tagName: String = ""
    var number:Int = 0
    
    //選択された写真
    @State private var selectedImage:UIImage? = nil
    //投稿する写真
    @State var postImage: Image?
    
    @State var captureImage: UIImage?
    
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
                    if postImage == nil {
                                // 画像選択前
                        Image("picture")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:250)
                        
                    } else if let image = postImage {
                        // 画像選択後
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:250)
                    }
                }.sheet(isPresented: $isShowSheet){
                    if isPhotoLibrary{
                        PHPickerView(
                            isShowAlbum: $isShowSheet,
                            captureImage: $captureImage)
                    }else{
                        ImagePickerView(
                            isCamera: $isShowSheet,
                            captureImage: $captureImage)
                    }
                }
                .actionSheet(isPresented: $isShowAction){
                    ActionSheet(title: Text("確認"),
                                message: Text("選択してください"),
                                buttons: [
                                    .default(Text("カメラ"),action: {
                                        isPhotoLibrary = false
                                        if UIImagePickerController.isSourceTypeAvailable(.camera){
                                            isShowSheet = true
                                        }else{
                                            print("カメラは利用できません")
                                        }
                                    }),
                                    .default(Text("フォトライブラリー"),action:{
                                        isPhotoLibrary = true
                                    }),
                                    .cancel()
                                ]//buttons
                    )//ActionSheet
                }//actionSheet
                
                    
                    Spacer()
                    
                    //タグ
                    Group{
                        HStack{
                            Text("タグ")
                                .font(.title)
                            Spacer()
                        }
                        
                        PostScrollView()
                        
                        
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
                
                    //投稿ボタン
                    Button(action:{
                        showingAlert = true
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
                    .alert(isPresented: $showingAlert){
                        Alert(title: Text("投稿しますか？"),
                        primaryButton: .cancel(Text("キャンセル")),
                        secondaryButton: .default(Text("投稿"))/*,*/
                        //↓ここに投稿する処理を書く
//                        action:
                        )
                    }
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



struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(isPost: Binding.constant(true))
    }
}

