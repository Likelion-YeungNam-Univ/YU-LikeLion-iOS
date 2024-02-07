//
//  FSCalendarView.swift
//  YU-LikeLion-iOS
//
//  Created by 윤강록 on 2/7/24.
//

import SwiftUI
import UIKit
import FSCalendar

struct FSCalendarView: View {
    
    @State var selectedDate = Date()
    
    var body: some View {
        CalendarViewRepresentable(selectedDate: $selectedDate)
    }
}

#Preview {
    FSCalendarView()
}

struct CalendarViewRepresentable: UIViewRepresentable {
    typealias UIViewType = FSCalendar
    
    @Binding var selectedDate: Date
    
    func makeUIView(context: Context) -> FSCalendar {
        return FSCalendar()
    }
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject,
                       FSCalendarDelegate, FSCalendarDataSource {
        var parent: CalendarViewRepresentable
        
        init(_ parent: CalendarViewRepresentable) {
            self.parent = parent
        }
    }
}


