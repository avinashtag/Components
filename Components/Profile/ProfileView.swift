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
    
    @Environment(\.dismiss) var dismiss

    @State private var dob: Date = Date()
    
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
            Section("Profile") {
                HStack{
                    //MARK: Try to give dates range play with it
                    DatePicker(selection: $dob, in: Date()..., displayedComponents: [ .date]) {
                        Text("Date Of Birth")
                            .font(.body)
                    }
                    .font(.body)
                }
            }
            Section {
                HStack{
                    Image(systemName: "power")
                        .tint(.red)
                    Text("Log Out")
                }
                .onTapGesture(perform: {
//                    print("\(dob.formatted(date: .long, time: .omitted))")
                    dismiss()
                })
//                .onTapGesture(count: 5, perform: {
//                    dismiss()
//                })
            }
        }
    }
}

#Preview {
    ProfileView()
}
