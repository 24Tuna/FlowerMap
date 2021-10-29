//
//  PostAlertView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/29.
//

import SwiftUI

struct PostAlertView: View {
    @Binding var showingAlert : Bool
    var body: some View {
        ZStack{
            GeometryReader{ geometry in
                EmptyView()
            }
            .background(Color.gray.opacity(0.6))
            .opacity(self.showingAlert ? 1.0 : 0.0)
            .animation(.easeIn(duration: 0.25))
            .onTapGesture {
                self.showingAlert = false
            }
            
            VStack{
                Text("投稿しますか？")
                
                HStack{
                    //キャンセルボタン
                    Button(action: {
                        showingAlert = false
                    }){
                        Text("キャンセル")
                            .padding()
                            .frame(width: 200)
                            .foregroundColor(.black)
                            .background(Color(.white))
                            .cornerRadius(3.0)
                    }
                    
                    //投稿ボタン
                    Button(action: {
                        //投稿する処理を書く
                        showingAlert = false
                    }){
                        Text("投稿")
                            .padding()
                            .frame(width: 200)
                            .foregroundColor(Color("appBlue"))
                            .background(Color(.white))
                    }
                    
                }//HStack
            }//VStack
            .padding()
            .background(Color("buttonFontColor"))
        }
    }
}

struct PostAlertView_Previews: PreviewProvider {
    static var previews: some View {
        PostAlertView(showingAlert: Binding.constant(true))
    }
}
