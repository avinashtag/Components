//
//  CameraView.swift
//  Components
//
//  Created by Avinash on 13/11/2024.
//

import SwiftUI
import UIKit

struct CameraView: UIViewControllerRepresentable {
    
    @Binding var selectedImage: Image?
    @Environment(\.presentationMode) var isPresented
    let controller = UIImagePickerController()

    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        controller.sourceType = .camera
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var picker: CameraView
    
    init(picker: CameraView) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = Image(uiImage: selectedImage)
        self.picker.isPresented.wrappedValue.dismiss()
    }
}

//#Preview {
//    CameraView()
//}
