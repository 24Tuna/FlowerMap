//
//  PhotoView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/18.
//

import SwiftUI
import Kingfisher

struct PhotoView: View {

    let postURL: String
    
    init(postURL: String) {
        self.postURL = postURL
    }
    
    var body: some View {
 
        KFImage(URL(string: postURL))
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
