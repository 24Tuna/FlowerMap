//
//  MyPageView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/08.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        ZStack {
            Color("backColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: {
                        // ボタンを押した時の動き
                    }) {
                        Image("PhotoIcon")
                            
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 80, alignment: .center)
                            .cornerRadius(25)
                            .clipped()
                    }
                    
                    .padding()
                    
                    Button(action: {
                        // ボタンを押した時の動き
                    }) {
                        Image("favorite")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70, alignment: .center)
                    }
                } //HStack
                
                ScrollView {
                    SubmissionView()
                        
                        .padding()
                    
                    SubmissionView()
                        
                        .padding()
                    
                    SubmissionView()
                        
                        .padding()
                    
                    SubmissionView()
                        
                        .padding()
                    
                    SubmissionView()
                        
                        .padding()
                    
                    SubmissionView()
                        
                        .padding()
                    
                    SubmissionView()
                        
                        .padding()
                    
                    SubmissionView()
                        
                        .padding()
                    
                    SubmissionView()
                        
                        .padding()
                    
                    SubmissionView()
                        
                        .padding()
                } //ScrollView
            } //VStack
        } //ZStack
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
