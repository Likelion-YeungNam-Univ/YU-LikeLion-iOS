//
//  CreateBoardView.swift
//  YU-LikeLion-iOS
//
//  Created by 아우신얀 on 1/29/24.
//

import SwiftUI

struct CreateBoardView: View {
    
    var body: some View {
        VStack {
            
            HStack(alignment: .center ,spacing: 100) {
                Text("글 쓰기")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                    .multilineTextAlignment(.center)
        
                
                Button("완료") {
                    print("글쓰기 완료")
                }
                .foregroundColor(.white)
                .padding(.leading, 11)
                .padding(.trailing, 12)
                .padding(.vertical, 6)
                .background(Color(red: 1, green: 0.47, blue: 0.06))

                .cornerRadius(16)
            }
            .frame(width: 360, height: 50, alignment: .trailing)
            .navigationBarTitleDisplayMode(.inline)
            
            
            
            TextField("제목", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding()
                .font(.title3)
                
            TextField("내용을 입력하세요.", text: .constant(""))
                .padding()
        }
        
        Spacer()
        
            
    }
        
}

#Preview {
    CreateBoardView()
}

