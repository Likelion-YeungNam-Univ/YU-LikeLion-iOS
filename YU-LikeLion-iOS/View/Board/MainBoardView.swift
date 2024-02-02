//
//  MainBoardView.swift
//  YU-LikeLion-iOS
//
//  Created by 아우신얀 on 1/29/24.
//

import SwiftUI

struct MainBoardView: View {
    
    @State var boards: [String] = [
        "first", "second", "third"
    ]
    
    var body: some View {
        ZStack {

            VStack {
                
                NavigationView {
                    
                    
                    List {
                        
                        NavigationLink(destination: DetailBoardView()) {
                            Text("게시글 1")
                        }
                        
                        NavigationLink(destination: DetailBoardView()) {
                            Text("게시글 2")
                        }
                        
                        NavigationLink(destination: DetailBoardView()) {
                            Text("게시글 3")
                        }
//                        ForEach(boards, id: \.self) { board in
//                            Text(board.capitalized)
//                            
//                        }
//                        //게시글 삭제 할 때
//                        .onDelete(perform: { indexSet in
//                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
//                        })
                    }
                    .listStyle(PlainListStyle())
                    .navigationTitle("게시판")
                    .navigationBarItems(
                        trailing: NavigationLink(destination: CreateBoardView()) {
                            Text("글 작성")
                        }
                            .navigationBarTitleDisplayMode(.inline)
                        
                        
                    )
                }

                
            }
            
            
            
            
        }
        .frame(width: 393, height: 852)
        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
    }
}

#Preview {
    MainBoardView()
}
