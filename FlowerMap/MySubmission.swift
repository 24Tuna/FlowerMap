//
//  MySubmission.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/07.
//

import SwiftUI

struct MySubmission: View {
    let Location: String = "位置情報"
    let tags:[String] = ["新宿", "渋谷"]
    var body: some View {
        HStack {
            Image("picture")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150, alignment: .center)
            
            VStack {
                HStack {
                    ForEach(0..<tags.count) { num in TagButton(tagtext: tags[num])
                        .frame(width: 55, height: 25, alignment: .center)
                        // タグ数が3つ以上ならば改行(できたら)
                        if tags.count < 3 {
                            // 改行にする処理
                        }
                    }
                }
                
                .frame(width: 110, height: 70, alignment: .center)
                
                HStack {
                    Image("MapIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30, alignment: .center)
                    
                    Button(action: {
                        // 同じ位置情報の投稿一覧へ
                    }) {
                        Text(Location)
                            .foregroundColor(Color("fontColor"))
                            .frame(width: 80, height: 50, alignment: .center)
                    }
                }
                
                .frame(width: 0, height: 30, alignment: .center)
                
            }
        }
        
        .frame(width: 305, height: 160, alignment: .center)
        .background(Color("buttonFontColor"))
        .cornerRadius(5)
    }
}

struct MySubmission_Previews: PreviewProvider {
    static var previews: some View {
        MySubmission()
    }
}
