//
//  SideMenuButton.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/04.
//

import SwiftUI

struct SideMenuButton: View {
    
    let buttonName: String
    let action: () -> ()
    
    var body: some View {
        Button(action:{
            action()
        }){
            HStack{
                Image(buttonName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                Text(buttonName)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
}

struct SideMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuButton(buttonName: "投稿"){
            
        }
    }
}
