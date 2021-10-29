//
//  ContentScrollView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/29.
//

import SwiftUI

struct ContentTagListViewCell: View, Identifiable {
    let id = UUID()

    let tagName: String

    var body: some View {
        
        TagButton(tagtext: tagName)
        
    }

}

struct ContentScrollView: View {
    
    let tags:[String] = ["タグ名","タグ名", "タグタグタグ","test"]

    var tagName: String = ""
    var number:Int = 0

    private var list: [ContentTagListViewCell] = []
    init() {
        for number in 0..<tags.count {
            tagName = tags[number]
            list.append(ContentTagListViewCell( tagName: tagName))
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

struct ContentScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ContentScrollView()
    }
}
