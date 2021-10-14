//
//  TagButton.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/14.
//

import SwiftUI

struct TagButton: View {
    let tagtext: String
    var body: some View {
        Button(action: {
            
        }) {
            VStack {
                Text("#\(tagtext)")
                    .background(Color("backColor"))
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct TagButton_Previews: PreviewProvider {
    static var previews: some View {
        TagButton(tagtext: "")
    }
}
