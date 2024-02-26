//
//  MyPageView.swift
//  YU-LikeLion-iOS
//
//  Created by 아우신얀 on 2/7/24.
//

import SwiftUI

struct MyPageView: View {
    @State var showingPhoto = false
    @State var image : UIImage?
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.main)
                    .frame(width: 398, height: 300)
                
                Button(action: {
                    self.showingPhoto.toggle()
                }, label: {
                    let selected = image == nil ? Image("Image") : Image(uiImage : image!)
                    selected
                        .resizable()
                        .frame(width: 150, height: 150)
                        
                })
                .clipShape(Circle())
                .sheet(isPresented: $showingPhoto) {
                    UIImagePicker(sourceType: .photoLibrary) { (image) in
                        self.image = image
                    }
                }
                
            }
            
            VStack {
                
            }
            
        }
    }
}

struct UIImagePicker: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIImagePickerController
    
    @Environment(\.presentationMode)
    private var presentationMode // 해당 뷰컨트롤러의 노출 여부
    let sourceType: UIImagePickerController.SourceType
    let imagePicked: (UIImage) -> () // 이미지가 선택됐을때 결과 호출
    

    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let parent: UIImagePicker
        
        init(parent: UIImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[.originalImage] as? UIImage {
                parent.imagePicked(image)
                parent.presentationMode.wrappedValue.dismiss()
            }
            
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        
        let picker = UIImagePickerController()
        
        picker.delegate = context.coordinator
        
        return picker
        
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }

}

#Preview {
    MyPageView()
}
