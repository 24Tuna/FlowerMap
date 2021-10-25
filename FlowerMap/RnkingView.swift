//
//  RnkingView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/13.
//

import SwiftUI

struct RnkingView: View {
    let submissionHeight = UIScreen.main.bounds.size.height / 4.5
    let ranking: [Ranking]
    init() {
        var work: [Ranking] = []
        for num in 4...5 {
            work.append(Ranking(number: num))
        }
        ranking = work
    }
    var body: some View {
        ZStack {
            Color("backColor")
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Spacer()
                }
                ScrollView {
                    Ranking1st()
                    
                    Ranking2nd()
                    
                    Ranking3rd()

                    ForEach(ranking) {num in
                        num
                            .padding()
                            .frame(height: submissionHeight)
                    }
                }
            }//ScrollView
        }//ZStack
        .onAppear(perform: {
            
        })
    }
}

struct RnkingView_Previews: PreviewProvider {
    static var previews: some View {
        RnkingView()
    }
}
