//
//  ProfileView.swift
//  Components
//
//  Created by Avinash on 15/10/2024.
//

import SwiftUI

struct ProfileView: View {
    //Read Environment on developer . apaple
    // Def: TODO
    
    @Environment  (\.dismiss) var dismiss

    var body: some View {
        List {
            Section {
                HStack{
                    Spacer()
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Spacer()
                }
            }
            Section {
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Log Out")
                        .font(.body)
                })
            }
        }
    }
}

#Preview {
    ProfileView()
}
