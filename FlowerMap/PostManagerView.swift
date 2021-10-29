//
//  PostManagerView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/14.
//

import SwiftUI

class PostManagerViewModel: ObservableObject {
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

struct PostManagerView: View {
    //入力中の文字列を保持する状態変数
    @State var inputAddress:String = ""
    //検索キーワードを保持する状態変数
    @State var postAddress = ""
    
    @State var good = "100"
    @State var isOpenList : Bool = false
    @State var isAddTag : Bool = false
    let tags:[String] = ["タグ名","タグ名", "タグタグタグ"]
    
    let windowWidth = UIScreen.main.bounds.size.width / 1.2
    let windowHeight = UIScreen.main.bounds.size.height / 1.2
    

    let postManagerViewModel = PostManagerViewModel()
    
    var body: some View {
        ZStack{
            Color("backColor")
                .edgesIgnoringSafeArea(.all)
            VStack{
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
                Image("picture")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
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
                }
                
                Spacer()
                
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
                
                //評価数の表示
                Group{
                    HStack{
                        Image(systemName: "heart.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("appRed"))
                            .frame(width:35)
                        Text(good)
                            .font(.title2)
                        Spacer()
                    }
                }
                
                Spacer()
                
                Button(action:{
                    
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
            }//VStack
            .frame(width: windowWidth, height: windowHeight)
            .padding()
            .background(Color("buttonFontColor"))
            
            TagManegerListView(isOpenList: $isOpenList)
                .edgesIgnoringSafeArea(.all)
        }//ZStack
    }
}

struct PostManagerView_Previews: PreviewProvider {
    static var previews: some View {
        PostManagerView()
    }
}
