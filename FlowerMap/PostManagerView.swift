//
//  PostManagerView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/14.
//

import SwiftUI
import Kingfisher


struct PostManagerView: View {
    // レイアウト
    let windowWidth = UIScreen.main.bounds.size.width / 1.2
    let windowHeight = UIScreen.main.bounds.size.height / 1.2

    //入力中の文字列を保持する状態変数
    @State var inputAddress:String = ""
    //検索キーワードを保持する状態変数
    @State var postAddress = ""
    
    @State private var showingAlert = false // 削除するか最終確認
    @State var good = "100"     // いいね数
    
//    時間が足りれば修正機能追加予定
//    @State var isOpenList : Bool = false
//    @State var isAddTag : Bool = false
    
    
    @ObservedObject var viewModel: ControlPostCellViewModel

    init(viewModel: ControlPostCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack{
            Color("backColor")
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                // 閉じるボタン
                HStack{
                    Spacer()
                    Button(action: {
                        //TODO:後でContentViewに戻る処理を書く
                    }){
                        Image(systemName:"xmark.circle")
                            .foregroundColor(Color("buttonColor"))
                            .font(.largeTitle)
                    }
                }
                
                
                // 投稿された画像
                KFImage(URL(string: viewModel.post.imageUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:250)
                
                
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
//                            self.isAddTag.toggle()
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
                }
                
                Spacer()
                
                //位置情報
                Group{
                    HStack{
                        Text("位置情報")
                            .font(.title)
                        Spacer()
                    }
                    
                    //修正間に合わなければ
                    Text(verbatim: viewModel.post.location)
                    
//                    修正間に合えば
//                    TextField("住所",text:$inputAddress,onCommit:{
//                        //入力が完了したので検索キーワードに設定する
//                        postAddress = inputAddress
//                        //検索キーワードをデバックエリアに出力する
//                        print("入力したキーワード："+postAddress)
//                    })
                    .frame(height: 30)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color("backColor"))
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                }
                
                Spacer()
                
                //評価数の表示
                Group{
                    HStack{
                        Image(systemName: "heart.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("appRed"))
                            .frame(width:35)
                        
//                        Text(viewModel.post.likes)
//                            .font(.title2)
                        
                        Spacer()
                    }
                }
                
                Spacer()
                
                //削除ボタン
                Button(action:{
                    //アラートのON/OFF
                    showingAlert = true
                }){
                    HStack{
                        Image(systemName:"trash")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:30)
                            .foregroundColor(Color.white)
                            .padding()
                        Text("削除する")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .padding()
                    }
                }
                .background(Color("appRed"))
                .alert(isPresented: $showingAlert){
                    Alert(title: Text("削除しますか？"),
                    primaryButton: .cancel(Text("キャンセル")),
                    secondaryButton: .destructive(Text("削除"),
//                    ↓ここに削除する処理を書く
                    action: {
                        viewModel.deletePost()
                    }))
                }
            }//VStack
            .frame(width: windowWidth, height: windowHeight)
            .padding()
            .background(Color("buttonFontColor"))
            
//            TagManegerListView(isOpenList: $isOpenList)
//                .edgesIgnoringSafeArea(.all)
        }//ZStack
    }
}
//
//struct PostManagerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostManagerView()
//    }
//}
