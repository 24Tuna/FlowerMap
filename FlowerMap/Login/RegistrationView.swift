//
//  RegistrationView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/27.
//

import SwiftUI

// ユーザー登録画面
struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var username = ""
    @State private var pass = ""
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State var imagePickerPresented = false
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                ZStack {
                    if let image = image {
                        image
                            .resizable()
                            .scaleEffect()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                    } else {
                        Button {
                            imagePickerPresented.toggle()
                        } label: {
                            Image("shokupan")
                                .resizable()
                                .scaleEffect()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .foregroundColor(.white)
                            
                        }.sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content:{
                            ImagePicker(image: $selectedImage)
                        })
                        .padding()
                    }
                }
                    
                    
                    VStack(spacing: 20) {
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal,32)
                        
                        CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal,32)
                        
                        CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal,32)
                        
                        CustomSecreField(text: $pass, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal,32)
                    }
                    
                    Button(action: { viewModel.register(withEmail: email, password: pass, image: selectedImage, fullname:  fullname, usename: username) }, label: {
                        Text("Sign in")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .clipShape(Capsule())
                            .background(Color.purple)
                            .padding()
                    })
                    
                    Spacer()
                    
                    
                    Button(action: { mode.wrappedValue.dismiss() }, label: {
                        HStack {
                            Text("Already have an account?")
                                .font(.system(size: 14))
                            Text("Sign in")
                                .font(.system(size: 14, weight: .semibold))
                        }.foregroundColor(.white)
                    })
                }
            }
        }
    }
}

extension RegistrationView {
    func loadImage() {
        guard  let selectedImage = selectedImage else { return }
            image = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

