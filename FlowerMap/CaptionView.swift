//
//  CaptionView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/11.
//

import SwiftUI

struct CaptionView: View {
    let capText : String
    
    var body: some View {
        HStack{
            Text(capText)
                .font(.headline)
                .foregroundColor(Color("buttonFontColor"))
                .padding()
            Spacer()
        }
        .background(Color("buttonColor"))
    }
}

struct CaptionView_Previews: PreviewProvider {
    static var previews: some View {
        CaptionView(capText: "冬")
    }
}
