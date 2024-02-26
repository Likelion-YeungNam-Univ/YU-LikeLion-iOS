//
//  DetailBoardView.swift
//  YU-LikeLion-iOS
//
//  Created by 아우신얀 on 2/2/24.
//

import SwiftUI

struct DetailBoardView: View {
    
    var title: String
    var content: String
    @State var subcontent = ""
    @State var comments = [String]() //댓글 목록을 저장하는 배열
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            NavigationView {
                
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
                            Text(title)
                                .font(.title3)
                                .fontWeight(.bold)
                            Text(content)
                            
                        }
                    }
                    .padding(-3)
                    
                    ForEach(comments, id: \.self) { comment in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 10) {
                                Image("ProfileEx")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 45, height: 45)
                                    .clipped()
                                    .cornerRadius(5)
                                    .padding(3)
                                
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("이름")
                                        .font(.headline)
                                }
                            }
                            .padding(-3)
                            
                            VStack {
                                Text(comment)
                                    .padding(.leading, 5)
                            }
                        }
                        .padding(-3)
                        
                    }
                    
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("게시판")
            .padding(.horizontal)
            .navigationBarTitleDisplayMode(.inline)
            // HStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 365, height: 50)
                    .background(Color(red: 0.82, green: 0.82, blue: 0.82))
                    .cornerRadius(5)
                    .padding(.horizontal)
                
                
                HStack {
                    TextField("댓글을 입력하세요.", text: $subcontent, axis: .vertical)
                        .padding()
                    Spacer()
                    Button(action: {
                        if !subcontent.isEmpty {
                            comments.append(subcontent) // 댓글 목록에 텍스트 필드의 내용 추가
                            subcontent = "" // 텍스트 필드 초기화
                        }
                    }, label: {
                        Image("arrow-circle-right")
                            .resizable()
                            .frame(width: 35, height: 40, alignment: .trailing)
                        
                    })
                    .padding(.trailing, 20)
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .toolbar(.hidden, for: .tabBar)
        
    }
    
}

#Preview {
    DetailBoardView(title: "title", content: "content")
}
