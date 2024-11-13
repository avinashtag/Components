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
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = .camera
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}

class Coordinator: NSObject, UINavigationBarDelegate, UIImagePickerControllerDelegate{
    
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
