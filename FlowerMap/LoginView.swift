//
//  LoginView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/29.
//

import SwiftUI

struct LoginView: View {
    @State var inputEmail: String = ""
    @State var inputPassword: String = ""
    @State private var showCreateAccount = false
    
    let fieldSize = UIScreen.main.bounds.width / 1.5
    let logoWidth = UIScreen.main.bounds.width / 1.5
    let logoHeight = UIScreen.main.bounds.width / 1.5
    let loginBtnWidth = UIScreen.main.bounds.width / 2
    let loginBtnHeight = UIScreen.main.bounds.height / 13
    let passWidth = UIScreen.main.bounds.width / 1.5
    let passHeight = UIScreen.main.bounds.height / 20
    
    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                Image("ohanavi_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: logoWidth, height: logoHeight)
                
                VStack(spacing: 25)  {
                    TextField("メールアドレス", text: $inputEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .frame(width: fieldSize)
                    
                    
                    SecureField("パスワード", text: $inputPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .frame(width: fieldSize)
                }
                
                VStack(spacing: 20) {
                    //ログインボタン
                    Button(action: {
                        
                    }) {
                        Text("ログイン")
                            .foregroundColor(.white)
                            .frame(width: loginBtnWidth, height: loginBtnHeight)
                            .background(Color(.orange))
                            .cornerRadius(10)
                    }
                    
                    NavigationLink (
                        
                        destination: CreateAccountView()) {
                        Text("新規登録")
                            .foregroundColor(.orange)
                    }
                }
                Spacer()
                    .frame(height: 150)
                
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
