//
//  LoginView.swift
//  Components
//
//  Created by Avinash on 09/10/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLogin: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading, content: {
            Text("Username")
            TextField(text: $username) {
                Text("Username placeholder")
            }
            .textFieldStyle(.roundedBorder)
            .padding(.bottom, 10)
            Text("Password")
            SecureField(text: $password) {
                Text("Password placeholder")
            }
            .textFieldStyle(.roundedBorder)
            .padding(.bottom, 20)
            
            HStack{
                Spacer()
                Button(action: {
                    isLogin.toggle()
                }, label: {
                    Text("login".uppercased())
                })
                Spacer()
            }
        })
        .padding()
        .fullScreenCover(isPresented: $isLogin, content: {
            TabBar()
        })
//        .sheet(isPresented: , content: {
//        })
    }
    
}

#Preview {
    LoginView()
}

/* Assigment
 
 place a show/Hide button on password
 1. Show - show password
 2. Hide - hide password
 image name - eye
 */
