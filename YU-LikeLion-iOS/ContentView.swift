//
//  ContentView.swift
//  YU-LikeLion-iOS
//
//  Created by 윤강록 on 1/28/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        
        NavigationView {
            
//            TabView {
//                MainBoardView()
//                    .tabItem {
//                        VStack {
//                            Image(systemName: "bubble.left.and.bubble.right")
//                        }
//                        
//                    }
//                    .tag(0)
//                
//                
//                Home()
//                    .tabItem {
//                        VStack {
//                            Image(systemName: "calendar")
//                        }
//                        
//                    }
//                    .tag(1)
//                
//                MyPageView()
//                    .tabItem {
//                        VStack {
//                            Image(systemName: "person")
//                        }
//                        
//                    }
//                    .tag(2)
//            }
//            .accentColor(Color("MainColor"))
            WelcomeView()
        }
    }
}

#Preview {
    ContentView()
}
