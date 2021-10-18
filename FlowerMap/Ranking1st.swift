//
//  Ranking1st.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/14.
//

import SwiftUI

struct Ranking1st: View {
    var body: some View {
        HStack {
            HStack {
                Image("1st")
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

struct Ranking1st_Previews: PreviewProvider {
    static var previews: some View {
        Ranking1st()
    }
}
