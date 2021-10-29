//
//  ScrollView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/28.
//

import SwiftUI

struct PostTagListViewCell: View, Identifiable {
    let id = UUID()

//    let number : Int

    let tagName: String

    var body: some View {
        
    PostTagView(tagText: tagName)
        
    }

}

struct PostScrollView: View {
    
    let tags:[String] = ["タグ名","タグ名", "タグタグタグ","test"]

    var tagName: String = ""
    var number:Int = 0

    private var list: [PostTagListViewCell] = []
    init() {
        for number in 0..<tags.count {
            tagName = tags[number]
            list.append(PostTagListViewCell( tagName: tagName))
        }
    }
    var body: some View {
        
        ScrollView(.horizontal){
            HStack{
                ForEach(list) { item in
                    item
                }
            }//HStack
        }

    }
}

struct PostScrollView_Previews: PreviewProvider {
    static var previews: some View {
        PostScrollView()
    }
}
