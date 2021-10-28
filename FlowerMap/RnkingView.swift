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
    
    @Binding var isRank : Bool
    
    init(isRank: Binding<Bool>) {
        var work: [Ranking] = []
        for num in 4...5 {
            work.append(Ranking(number: num))
        }
        ranking = work
        self._isRank = isRank
    }
    var body: some View {
        ZStack {
            Color("backColor")
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Spacer()
                    CloseButtonView(isOpen: $isRank)
                    Spacer()
                        .frame(width:20)
                }
                ScrollView {
                    HStack{
                        Ranking1st()
                        
                    }
                    
                    HStack{
                        Ranking2nd()
                    }
                    
                    HStack{
                        Ranking3rd()
                    }

                    ForEach(ranking) {num in
                        HStack{
                            num
                                .padding()
                                .frame(height: submissionHeight)
                        }
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
        RnkingView(isRank: .constant(true))
    }
}
