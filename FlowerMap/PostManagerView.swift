//
//  PostManagerView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/14.
//

import SwiftUI

struct PostManagerView: View {
    //入力中の文字列を保持する状態変数
    @State var inputAddress:String = ""
    //検索キーワードを保持する状態変数
    @State var postAddress = ""
    
    @State var tags = "タグ名"
    
    let windowWidth = UIScreen.main.bounds.size.width / 1.2
    let windowHeight = UIScreen.main.bounds.size.height / 1.2
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
                
                    HStack{
                        TagView(tag: tags)
                    }
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
                .background(Color(red:223/255,green:86/255, blue:86/255))
            }//VStack
            .frame(width: windowWidth, height: windowHeight)
            .padding()
            .background(Color("buttonFontColor"))
        }//ZStack
    }
}

struct PostManagerView_Previews: PreviewProvider {
    static var previews: some View {
        PostManagerView()
    }
}
