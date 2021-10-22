//
//  PhotoView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/18.
//

import SwiftUI

struct PhotoView: View {
    var body: some View {
        Image("picture")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
