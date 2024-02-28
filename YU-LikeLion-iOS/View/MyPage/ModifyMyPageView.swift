//
//  ModifyMyPageView.swift
//  YU-LikeLion-iOS
//
//  Created by 아우신얀 on 2/7/24.
//

import SwiftUI



struct ModifyMyPageView: View {
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
                
            }
        }
    }

#Preview {
    ModifyMyPageView()
}
