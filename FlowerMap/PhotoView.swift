//
//  PhotoView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/18.
//

import SwiftUI
import Kingfisher

struct PhotoView: View {
    let post: String
    init(post: String) {
        self.post = post
    }
    var body: some View {
        KFImage(URL(string: post))
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

//
//struct PhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoView()
//    }
//}
