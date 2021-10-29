//
//  CreateAccountView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/29.
//

import SwiftUI

struct CreateAccountView: View {
    @State var inputEmail: String = ""
    @State var inputPassword: String = ""
    @State var inputPasswordAgain: String = ""
    
    let fieldWidth = UIScreen.main.bounds.width / 1.5
    let fieldHeight = UIScreen.main.bounds.height / 20
    let logoWidth = UIScreen.main.bounds.width / 3
    let logoHeight = UIScreen.main.bounds.width / 3
    let registrationBtnWidth = UIScreen.main.bounds.width / 2
    let registrationBtnHeight = UIScreen.main.bounds.height / 13
    let frameWidth = UIScreen.main.bounds.width / 1.5
    let under_Space = UIScreen.main.bounds.height / 2.5
    
    
    var body: some View {
        VStack {
            Image("ohanavi_logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: logoWidth, height: logoHeight)
            
            Text("会員登録")
                .font(.system(size: 20))
                .frame(width: 120, height: 30)

            VStack(spacing: 10)  {
                HStack {
                    Text("メールアドレス：")
                        .font(.system(size: 10))
                    Spacer()
                }
                TextField("メールアドレス", text: $inputEmail)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .frame(width: fieldWidth, height: fieldHeight)

                HStack {
                    Text("パスワード：")
                        .font(.system(size: 10))
                    Spacer()
                }

                SecureField("パスワード", text: $inputPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .frame(width: fieldWidth, height: fieldHeight)

                HStack {
                    Text("パスワード再入力：")
                        .font(.system(size: 10))
                    Spacer()
                }
                
                SecureField("パスワード再入力", text: $inputPasswordAgain)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .frame(width: fieldWidth, height: fieldHeight)
                
                
                Button(action: {
                    
                }) {
                    Text("登録")
                        .foregroundColor(.white)
                        .frame(width: registrationBtnWidth, height: registrationBtnHeight)
                        .background(Color(.orange))
                        .cornerRadius(10)
                }
                .padding()
            }
            .frame(width: frameWidth)

            Spacer()
                .frame(height: under_Space)
        }

    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
