//
//  TagView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/16.
//

import SwiftUI

struct PostTagView: View {
    let tagText: String
    //    let textWidth: Double
    
    var fontWidth: CGFloat {
        let font = UIFont(name: "HiraMaruProN-W4", size: 17)!
        let attributes = [NSAttributedString.Key.font : font]
        let size = tagText.size(withAttributes: attributes)
        
        return CGFloat(size.width)
    }
    
    var body: some View {
        HStack{
            
            Text("#\(tagText)")
                .padding()
                .foregroundColor(Color("buttonFontColor"))
                .font(.custom("HiraMaruProN-W4", size: 17))
            Spacer()
                .frame(width:0)
            Button(action: {
                //
            }){
                Image(systemName: "xmark")
                    .padding(.trailing)
                    .foregroundColor(Color("buttonFontColor"))
            }
        }
        .frame(width: self.fontWidth + 80)
        .background(Color("tagColor"))
        
        
    }
    
}

struct PostTagView_Previews: PreviewProvider {
    static var previews: some View {
        PostTagView(tagText: "タグ名")
    }
}
