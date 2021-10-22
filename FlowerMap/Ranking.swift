//
//  Ranking.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/21.
//

import SwiftUI
typealias ranking = View & Identifiable

struct Ranking: ranking {
    @State var number: Int
    let id = UUID()
    let Width = UIScreen.main.bounds.size.width / 1.05
    let Height = UIScreen.main.bounds.size.height / 4.5
    let width = UIScreen.main.bounds.size.width / 5
    let height = UIScreen.main.bounds.size.height / 11
    var body: some View {
        ZStack {
            HStack {
                Text(String(number))
                    .font(.largeTitle)
                    .foregroundColor(Color("backColor"))
                    .frame(width: width, height: height)
            }
            .frame(width: Width, height: Height, alignment: .leading)
                .background(Color("buttonFontColor"))
                .cornerRadius(5)
        }
    }
}

struct Ranking_Previews: PreviewProvider {
    static var previews: some View {
        Ranking(number: 4)
    }
}
