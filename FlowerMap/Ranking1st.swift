//
//  Ranking1st.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/14.
//

import SwiftUI

struct Ranking1st: View {
    let Width = UIScreen.main.bounds.size.width / 1.05
    let Height = UIScreen.main.bounds.size.height / 4.5
    let width = UIScreen.main.bounds.size.width / 5
    let height = UIScreen.main.bounds.size.height / 11
    var body: some View {
        HStack {
            HStack {
                Image("1st")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                // ランキング1位の投稿
            }
            .frame(width: Width, height: Height, alignment: .leading)
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
