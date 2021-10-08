//
//  MyPageView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/04.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        ZStack {
            Color("backColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    
                    Image("PhotoIcon")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 95, alignment: .center)
                        .cornerRadius(35)
//                        .clipped()
                    
                        Spacer()
                    
                    Image("favorite")
                        .resizable()
                        .frame(width: 70, height: 70, alignment: .center)
                        
                        Spacer()
                }
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
