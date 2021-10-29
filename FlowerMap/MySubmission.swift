//
//  MySubmission.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/07.
//

import SwiftUI
typealias Listcell = View & Identifiable

struct MySubmission: Listcell {
    @State var number: Int
    let id = UUID()

    let mypictureWidth = UIScreen.main.bounds.size.width / 2.5
    let mypictureHeight = UIScreen.main.bounds.size.height / 5.5

    let locationsWidth = UIScreen.main.bounds.size.width / 3
    let locationsHeight = UIScreen.main.bounds.size.height / 0

    let locationSize = UIScreen.main.bounds.size.width / 20
    
    let mapIconWidth = UIScreen.main.bounds.size.width / 10
    let mapIconHeight = UIScreen.main.bounds.size.height / 20

    let submissionWidth = UIScreen.main.bounds.size.width / 1.05
    let submissionHeight = UIScreen.main.bounds.size.height / 4.5
    
    let Location: String = "位置情報"
    let tags:[String] = ["新宿", "渋谷"]
    var body: some View {
        HStack {
            PhotoView()
                .frame(width: mypictureWidth, height: mypictureHeight)
            
            VStack {
                HStack {
                    ContentScrollView()
//                    ForEach(0..<tags.count) {
//                        num in TagButton(tagtext: tags[num])
//                    }
                }
                
                .frame(width: locationsWidth, height: locationsHeight)

                HStack {
                    Image("MapIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: mapIconWidth, height: mapIconHeight)

                    Button(action: {
                        // 同じ位置情報の投稿一覧へ
                    }) {
                        Text(Location)
                            .foregroundColor(Color("fontColor"))
                            .font(.system(size: locationSize))
                    }
                }
                
                .frame(width: locationsWidth, height: locationsHeight)

            }
        }
        
        .frame(width: submissionWidth, height: submissionHeight)
        .background(Color("buttonFontColor"))
        .cornerRadius(5)
    }
}

struct MySubmission_Previews: PreviewProvider {
    static var previews: some View {
        MySubmission(number: 0)
    }
}
