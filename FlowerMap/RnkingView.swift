//
//  RnkingView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/13.
//

import SwiftUI

struct RnkingView: View {
    var body: some View {
        ZStack {
            Color("backColor")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                Ranking1st()
                    .padding()
                
                Ranking2nd()
                    .padding()
                
                Ranking3rd()
                    .padding()
            }
        }
    }
}

struct RnkingView_Previews: PreviewProvider {
    static var previews: some View {
        RnkingView()
    }
}
