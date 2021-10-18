//
//  TagView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/16.
//

import SwiftUI

struct TagView: View {
    let tag: String
    var body: some View {
        HStack{
            Text(tag)
                .padding()
                .foregroundColor(Color("buttonFontColor"))
            Spacer()
                .frame(width:0)
            Button(action: {
                //FIXME:削除処理を入れる
            }){
                Image(systemName: "xmark")
                    .padding(.trailing)
                    .foregroundColor(Color("buttonFontColor"))
            }
        }
        .background(Color("tagColor"))
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(tag: "タグ名")
    }
}
