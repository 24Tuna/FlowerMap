//
//  Ranking3rd.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/14.
//

import SwiftUI

struct Ranking3rd: View {
    var body: some View {
        HStack {
            HStack {
                Image("3rd")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 65, height: 50, alignment: .center)
                
                // ランキング1位の投稿
                
            }
            .frame(width: 305, height: 130, alignment: .leading)
            .background(Color("buttonFontColor"))
            .cornerRadius(5)
        }
    }
}

struct Ranking3rd_Previews: PreviewProvider {
    static var previews: some View {
        Ranking3rd()
    }
}
