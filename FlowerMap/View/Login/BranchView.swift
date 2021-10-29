//
//  BranchView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/29.
//

import SwiftUI

struct BranchView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
                    if viewModel.userSession == nil {
                LoginView()
            } else {
                if let user = viewModel.currentUser {
                    MainView(user: user)
                }
            }
        }
}

struct BranchView_Previews: PreviewProvider {
    static var previews: some View {
        BranchView()
    }
}
