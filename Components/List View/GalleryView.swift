//
//  GalleryView.swift
//  Components
//
//  Created by Avinash on 13/11/2024.
//

import SwiftUI
import PhotosUI

struct GalleryView: View {
    
    @State var selectedItem: PhotosPickerItem?
    @State var selectedImage: Image?
    @State var openCamera: Bool = false

    var body: some View {
        VStack{
            if let selectedImage{
                selectedImage
                    .resizable()
                    .frame(width: 200, height: 200)
                    .aspectRatio(contentMode: .fit)
            }
            PhotosPicker("Please select your image", selection: $selectedItem, matching: .images)
                .onChange(of: selectedItem) {
                    Task{
                        selectedImage = try await selectedItem?.loadTransferable(type: Image.self)
                    }
                }
            
            Button(action: {
                openCamera.toggle()
                
            }, label: {
                Label("Camera", systemImage: "camera")
            })
            .buttonStyle(.borderedProminent)

        }
        .fullScreenCover(isPresented: $openCamera, content: {
            CameraView(selectedImage: $selectedImage)
        })

    }
    
}

#Preview {
    GalleryView()
}
