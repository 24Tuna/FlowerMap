//
//  Ranking2nd.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/14.
//

import SwiftUI

struct Ranking2nd: View {
    var body: some View {
        HStack {
            HStack {
                Image("2nd")
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

struct Ranking2nd_Previews: PreviewProvider {
    static var previews: some View {
        Ranking2nd()
    }
}
