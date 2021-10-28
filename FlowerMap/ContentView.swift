//
//  ContentView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/21.
//

import SwiftUI

//struct ListViewCell: View, Identifiable {
//    let id = UUID()
//    
//    let number : Int
//    
//    let tagName: String
//    
//    var body: some View {
//        
//        VStack {
//            PostTagView(tagText: tagName)
//        }
//    }
//    
//}

struct ContentView: View {
    @Binding var isOpenContent: Bool
    
    let tags:[String] = ["タグ名","タグ名"]
    let good = "100"
    
    var sumWidth = 0.0
    let windowWidth = UIScreen.main.bounds.size.width / 1.2
    let windowHeight = UIScreen.main.bounds.size.height / 1.2
    
    var body: some View {
        ZStack{
            Color("backColor")
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                HStack{
                    Spacer()
                    CloseButtonView(isOpen:$isOpenContent)
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
                
//                    ScrollView(.horizontal){
//                        HStack{
//                            ForEach(tagsFilter()) { item in
//                                item
//                            }
//                        }
//                    }
                    
                }
                
                Spacer()
                
                //位置情報
                Group{
                    HStack{
                        
                        Text("位置情報")
                            .font(.title)
                        Spacer()
                    }
                    
                    HStack{
                        Text("aaaaaa")
                            
                        Spacer()
                    }
                }
                
                Spacer()
                
                //いいねボタン
                Button(action: {
                        //TODO:後でいいね数を加算する処理を入れる
                }){
                    Image(systemName: "heart.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("appRed"))
                        .frame(width:35)
                    Text(good)
                        .font(.title2)
                }
                
                Spacer()
                
            }//VStack
            .frame(width: windowWidth, height: windowHeight)
            .padding()
            .background(Color("buttonFontColor"))
        }
    }
    
//    func tagsFilter() -> [ListViewCell] {
//        var result: [ListViewCell] = []
//            list.forEach { item in
//                result.append(item)
//            }
//        return result
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isOpenContent: Binding.constant(true))
    }
}
