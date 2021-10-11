//
//  SubmissionView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/08.
//

import SwiftUI

struct SubmissionView: View {
    var body: some View {
        let tag: String = "タグ名"
        
        Button(action: {
            
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
                            Text(tag)
                                .background(Color("backColor"))
                                .foregroundColor(Color.white)
                                .frame(width: 60, height: 28, alignment: .center)
                            Text(tag)
                                .background(Color("backColor"))
                                .foregroundColor(Color.white)
                                .frame(width: 60, height: 28, alignment: .center)
                        }
                        
                        HStack {
                            Text(tag)
                                .background(Color("backColor"))
                                .foregroundColor(Color.white)
                                .frame(width: 60, height: 28, alignment: .center)
                            
                            Text(tag)
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
                    }// HStack
                    
                    Spacer()
                    
                }// VStack
            }// HStack
            
            .background(Color("buttonFontColor"))
            .frame(width: 280, height: 160, alignment: .center)
        }// Button
    }
}

struct SubmissionView_Previews: PreviewProvider {
    static var previews: some View {
        SubmissionView()
    }
}
