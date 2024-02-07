//
//  CreateBoardView.swift
//  YU-LikeLion-iOS
//
//  Created by 아우신얀 on 1/29/24.
//


import SwiftUI

struct Board: Identifiable {
    let id: UUID = UUID()
    var title : String
    var subTitle : String
}

struct CreateBoardView: View {
    @Environment(\.presentationMode) var presentationMode

    
    @State var title = ""
    @State var content = ""
    @State private var showingPopUp = false
    @Binding var items: [Board]
    @Binding var showing: Bool
    
    var body: some View {
        VStack {
            
            HStack(alignment: .center ,spacing: 100) {
                Text("글 쓰기")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                    .multilineTextAlignment(.center)
        
                Button("완료") {
                    showingPopUp = true
                    let newItem = Board(title: title, subTitle: content)
                    self.items.append(newItem)
                    self.presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.white)
                .padding(.leading, 11)
                .padding(.trailing, 12)
                .padding(.vertical, 6)
                .background(Color(red: 1, green: 0.47, blue: 0.06))

                .cornerRadius(16)
                .alert(isPresented: $showingPopUp) {
                    Alert(title: Text("완료"), message: Text("글이 등록되었습니다!"))
                } 
            }
            .frame(width: 360, height: 50, alignment: .trailing)
            .navigationBarTitleDisplayMode(.inline)
            
            
            
            TextField("제목", text: $title)
                .padding()
                .font(.title3)
                
            TextField("내용을 입력하세요.", text: $content)
                .padding()
        }
        
        Spacer()
        
            
    }
        
}

#Preview {
    CreateBoardView(items: .constant([]), showing: .constant(true))
}

