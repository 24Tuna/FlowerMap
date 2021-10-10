//
//  SearchMenuButton.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/04.
//

import SwiftUI

struct SearchMenuButton: View {
    //@State var isOpenSearch : Bool
    
    let buttonName: String
    let action: () -> ()
    
    var body: some View {
        Button(action: {
            //FIXME: 後で検索機能とくっつける
            //ここに検索機能関連をつける
            action()
        }){
            HStack{
                Image(buttonName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:30,height: 30)
                Text(buttonName)
                    .foregroundColor(.black)
            }
        }
//        .opacity(self.isOpenSearch ? 1.0 : 0.0)
//        .animation(.easeIn(duration: 0.25))
        
    }
}

struct SearchMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchMenuButton(/*isOpenSearch: true,*/ buttonName: "椿"){
            
        }
    }
}
