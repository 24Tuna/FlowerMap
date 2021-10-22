//
//  CloseButtonView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/21.
//

import SwiftUI

struct CloseButtonView: View {
    @Binding var isOpen : Bool
    var body: some View {
        Button(action: {
            isOpen = false
        }){
            Image(systemName:"xmark.circle")
                .foregroundColor(Color("buttonColor"))
                .font(.largeTitle)
        }
    }
}

struct CloseButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CloseButtonView(isOpen: Binding.constant(true))
    }
}
