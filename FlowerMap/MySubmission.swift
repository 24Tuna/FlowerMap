//
//  MySubmission.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/07.
//

import SwiftUI

struct MySubmission: View {
    var body: some View {
        Button(action: {
            // 投稿先に飛ぶ
        }) {
            
            HStack {
                
                Spacer()
                
                Image("picture")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150, alignment: .center)
                
                VStack {
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            Text("タグ名")
                                .background(Color("backColor"))
                                .foregroundColor(Color.white)
                                .frame(width: 60, height: 28, alignment: .center)
                            Text("タグ名")
                                .background(Color("backColor"))
                                .foregroundColor(Color.white)
                                .frame(width: 60, height: 28, alignment: .center)
                        }
                        
                        HStack {
                            Text("タグ名")
                                .background(Color("backColor"))
                                .foregroundColor(Color.white)
                                .frame(width: 60, height: 28, alignment: .center)
                            
                            Text("タグ名")
                                .background(Color("backColor"))
                                .foregroundColor(Color.white)
                                .frame(width: 60, height: 28, alignment: .center)
                        }
                    }
                    
                    HStack {
                        
                        Image("MapIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30, alignment: .center)
                        
                        Text("位置情報")
                            .foregroundColor(Color("fontColor"))
                            .frame(width: 80, height: 50, alignment: .center)
                        
                    }
                    
                    Spacer()
                    
                }
            }
            
            .background(Color("buttonFontColor"))
            .frame(width: 280, height: 160, alignment: .center)
        }
    }
}

struct MySubmission_Previews: PreviewProvider {
    static var previews: some View {
        MySubmission()
    }
}
