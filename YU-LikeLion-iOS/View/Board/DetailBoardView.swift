//
//  DetailBoardView.swift
//  YU-LikeLion-iOS
//
//  Created by 아우신얀 on 2/2/24.
//

import SwiftUI

struct DetailBoardView: View {
    
    @State var subcontent = ""
    var body: some View {
        
        VStack(alignment: .center, spacing: 8) {
            
            Text("게시판")
              .font(
                Font.custom("Pretendard", size: 20)
                  .weight(.bold)
              )
//              .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
              .padding(8)
            
            List {
                VStack(alignment: .leading, spacing: 10) { // 게시글, 댓글 나열
                    
                    HStack(spacing: 10) { //프로필, 닉네임
                            Image("ProfileEx")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 45, height: 45)
                                .clipped()
                                .cornerRadius(5)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("이름")
                                    .font(.headline)
                                Text("날짜")
                                    .font(Font.custom("Pretendard", size: 12))
                                    .foregroundColor(Color(red: 0.66, green: 0.66, blue: 0.66))
                                
                            }

                        }
                    
                    VStack (alignment: .leading, spacing: 10) {
                        Text("제목")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text("내용")
                            
                    }
                        
                        
                        
                    
                    
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 10) { //프로필, 닉네임
                        Image("ProfileEx")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 45, height: 45)
                            .clipped()
                            .cornerRadius(5)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("이름")
                                .font(.headline)
                        }
                        
                        
                    }
                    
                    VStack (alignment: .leading, spacing: 10) {
                        Text("댓글")
                            
                        
                        Text("날짜")
                            .font(Font.custom("Pretendard", size: 12))
                            .foregroundColor(Color(red: 0.66, green: 0.66, blue: 0.66))
                    }
                }
                .padding()
                
            }
            .listStyle(PlainListStyle())
            
            ZStack {
                
                TextField(" 댓글을 입력하세요.", text: $subcontent)
                  .foregroundColor(.clear)
                  .frame(width: 355, height: 47)
                  .background(Color(red: 0.82, green: 0.82, blue: 0.82))
                  .cornerRadius(5)
                  .padding(0.0)
                
                
                Button(action: {
                    //댓글이 달리는 action...
                }, label: {
                    Image("arrow-circle-right")
                        .frame(width: 340, height: 47, alignment: .trailing)
                })
                
            }
            .navigationBarTitleDisplayMode(.inline)
            
            

        }
        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

#Preview {
    DetailBoardView()
}
