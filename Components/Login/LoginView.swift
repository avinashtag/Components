//
//  LoginView.swift
//  Components
//
//  Created by Avinash on 09/10/2024.
//

import SwiftUI

struct Credentials: Codable{
    var username: String
    var password: String
}

extension String{
    static let userdefaultCrentials: String = "Credentials"
}

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLogin: Bool = false
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, content: {
                Spacer()
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
                        //Save data in userdefault
                        
                        let credentials = Credentials(username: username, password: password)
                        let encoded = try? JSONEncoder().encode(credentials)
                        UserDefaults.standard.setValue(encoded, forKey: .userdefaultCrentials)
                        UserDefaults.standard.synchronize()
                    }, label: {
                        Text("login".uppercased())
                    })
                    Spacer()
                }
                Spacer()
            })
            .frame(height: UIScreen.main.bounds.height)
            .padding(.horizontal, 40)
//            .overlay(content: {
//                RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
//                    .background(.red)
//            })
            .shadow(color: .gray, radius: 10)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $isLogin, content: {
            TabBar()
        })
        .task {
            //Retrieve Data from Userdefault
            guard let data = UserDefaults.standard.value(forKey: .userdefaultCrentials) as? Data else { return }
            guard let credentials = try? JSONDecoder().decode(Credentials.self, from: data) else { return }
            
            username = credentials.username
            password = credentials.password
        }
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
