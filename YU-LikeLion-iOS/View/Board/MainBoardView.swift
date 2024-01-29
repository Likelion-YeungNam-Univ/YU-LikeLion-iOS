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
        NavigationView {
            List {
                ForEach(boards, id: \.self) { board in
                    Text(board.capitalized)
                    
                }
                //게시글 삭제 할 때
                .onDelete(perform: { indexSet in
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
                })
            }
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

#Preview {
    MainBoardView()
}
