//
//  BranchView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/28.
//

import SwiftUI

struct BranchView: View {
    @EnvironmentObject var viewModel: AuthViewModel
//    @State var selectedIndex = 0
    
    var body: some View {
        
     //   LikeView()
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                if let user = viewModel.currentUser {
                    ImagePickerView()
                }
            }
        }
    }
}

struct BranchView_Previews: PreviewProvider {
    static var previews: some View {
        BranchView()
    }
}
