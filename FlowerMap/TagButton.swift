//
//  TagButton.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/14.
//

import SwiftUI

struct TagButton: View {
    let tagSize = UIScreen.main.bounds.size.width / 20
    let tagtext: String
    var body: some View {
        Button(action: {
            
        }) {
            VStack {
                Text("#\(tagtext)")
                    .background(Color("backColor"))
                    .foregroundColor(Color.white)
                    .font(.system(size: tagSize))
            }
        }
    }
}

struct TagButton_Previews: PreviewProvider {
    static var previews: some View {
        TagButton(tagtext: "")
    }
}
