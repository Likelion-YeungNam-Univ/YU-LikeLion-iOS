//
//  ContentView.swift
//  YU-LikeLion-iOS
//
//  Created by 윤강록 on 1/28/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {

            
            TabView {
                MainBoardView()
                    .tabItem {
                        Image(systemName: "bubble.left.and.bubble.right")
                    }
                Home()
                    .tabItem {
                        Image(systemName: "calendar")
                    }
                myPageTestView()
                    .tabItem {
                        Image(systemName: "person")
                }
            }
            .accentColor(Color("MainColor"))
        }
    
}

#Preview {
    ContentView()
}
