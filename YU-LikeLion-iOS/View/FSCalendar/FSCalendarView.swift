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
    @State var calendar = Calendar.current
    
    var body: some View {
        ZStack (alignment: .top) {
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray)
                .frame(width: 390, height: 700)
            
            VStack {
                HStack {
                    Text(getYearMonthText(for: selectedDate))
                        .font(.title.bold())
                        .padding()
                    
                    
                    Spacer()
                    
                    Button(action: {
                        self.selectedDate = self.calendar.date(byAdding: .month, value: -1, to: self.selectedDate) ?? self.selectedDate
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                        
                    }
                    .padding()
                    Button(action: {
                        self.selectedDate = self.calendar.date(byAdding: .month, value: 1, to: self.selectedDate) ?? self.selectedDate
                    }) {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.black)
                            
                    }
                    .padding()
                }
                CalendarViewRepresentable(selectedDate: $selectedDate)
                    .frame(width:360, height: 600)
                
            }
            
        }
        
    }
    func getYearMonthText(for date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "YYYY년 M월"
            return formatter.string(from: date)
        }
}

#Preview {
    FSCalendarView()
}

struct CalendarViewRepresentable: UIViewRepresentable {
    typealias UIViewType = FSCalendar
    
    @Binding var selectedDate: Date
    
    func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.backgroundColor = .systemBackground
        calendar.scrollEnabled = false

        
        calendar.appearance.headerDateFormat = .none
        calendar.appearance.headerTitleColor = .label
        calendar.appearance.headerTitleAlignment = .center
        calendar.appearance.weekdayTextColor = .black
        calendar.appearance.titleWeekendColor = .red
        calendar.headerHeight = 0
        
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        return calendar
    }
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {
        uiView.reloadData()
        uiView.select(selectedDate)
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


