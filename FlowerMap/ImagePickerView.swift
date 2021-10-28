//
//  ImagePickerView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/22.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var isCamera : Bool
    @Binding var captureImage :UIImage?
    
    @State var isPost = false
    
    class Coordinator : NSObject,
                        UINavigationControllerDelegate,
                        UIImagePickerControllerDelegate{
        
        let parent : ImagePickerView
        
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(
            _ picker:UIImagePickerController,
            didFinishPickingMediaWithInfo info:
            [UIImagePickerController.InfoKey : Any]) {
            
            if let originalImage =
                info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                parent.captureImage = originalImage
                parent.isPost = true
//                PostView(isPost: parent.$isPost, captureImage: parent.captureImage!)
            }
            
            parent.isCamera = false
            
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isCamera = false
        }
        
    }//coordinator
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        let myImagePickerController = UIImagePickerController()
        myImagePickerController.sourceType = .camera
        myImagePickerController.delegate = context.coordinator
        return myImagePickerController
    }
    
    func updateUIViewController(
        _ uiViewController: UIImagePickerController,
        context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
}
