//
//  CustomButton.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/07/21.
//

import SwiftUI

struct CustomButton: View {
    let buttonName: String
    let action: () -> ()
    
    var body: some View {
        
        Spacer()
        VStack{
            
            //投稿ボタン
            Button(action:{
                action()
            }){
                VStack{
                    Image(buttonName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                    Text(buttonName)
                        .fontWeight(.bold)
                        .padding(.all,25)
                        .padding(.top,-70)
                        .font(.title3)
                        .foregroundColor(.white)
                }
                
                
            }
        }
        Spacer()
        
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(buttonName: "投稿") {
            
        }
    }
}
