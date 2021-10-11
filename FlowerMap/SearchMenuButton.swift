//
//  SearchMenuButton.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/04.
//

import SwiftUI

struct SearchMenuButton: View {
    let buttonName: String
    let action: () -> ()
    
    var body: some View {
        Button(action: {
            //FIXME: 後で検索機能とくっつける
            //ここに検索機能関連をつける
            action()
        }){
            HStack{
                Spacer()
                Text(buttonName)
                    .foregroundColor(.black)
                    .padding()
                Image(buttonName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:30,height: 30)
            }
        }
    }
}

struct SearchMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchMenuButton(buttonName: "ツバキ"){
            
        }
    }
}
