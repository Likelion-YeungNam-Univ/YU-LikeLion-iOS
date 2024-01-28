//
//  Home.swift
//  YU-LikeLion-iOS
//
//  Created by 윤강록 on 1/28/24.
//

import SwiftUI

struct Home: View {
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 20) {
                
                CalenderView(currentDate: $currentDate)
            }
        }
    }
}

#Preview {
    Home()
}
