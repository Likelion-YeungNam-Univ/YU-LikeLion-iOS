//
//  MainBoardView.swift
//  YU-LikeLion-iOS
//
//  Created by 아우신얀 on 1/29/24.
//

import SwiftUI

struct MainBoardView: View {
    
    @State private var showing = false
    @State private var boardItems: [Board] = []
    
    var body: some View {
        ZStack {
            VStack {
                NavigationView {
                    
                    List {
                        ForEach(boardItems) { item in
                            NavigationLink(destination: DetailBoardView(title: item.title, content: item.subTitle)) {
                                Text(item.title)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                            }
                            
                        }
                    }
                    .listStyle(PlainListStyle())
                    .navigationBarTitle(Text("게시판"), displayMode: .inline)
                    .navigationBarItems(trailing:
                                            
                                            
                                            Button(action: {
                        self.showing = true
                    }) {
                        Image(systemName: "pencil.line")
                            .foregroundColor(Color("MainColor"))
                    })
                    .sheet(isPresented: $showing, content: {
                        CreateBoardView(items: $boardItems, showing: .constant(true))
                    })
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .frame(width: 393, height: 852)
        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
    }
}

#Preview {
    MainBoardView()
}
