//
//  CalendarView.swift
//  YU-LikeLion-iOS
//
//  Created by 윤강록 on 1/28/24.
//

import SwiftUI

struct CalendarView: View {
    
    @Binding var currentDate: Date
    
    //Month update on arrow button clicks
    @State var currentMonth: Int = 0
    
    var body: some View {
        
        VStack {
                
                VStack {
                    
                    let days: [String] = ["일","월","화","수","목","금","토"]
                    
                    // 날짜 선택하는 view
                    HStack{
                        
                        HStack {
                            Text(extraDate()[0])
                                .font(.title.bold())
                            Text(extraDate()[1])
                                .font(.title.bold())
                        }
                        Spacer(minLength: 0)
                        
                        Button {
                            withAnimation {
                                currentMonth -= 1
                            }
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        
                        Button { 
                            withAnimation {
                                currentMonth += 1
                            }
                        } label: {
                            Image(systemName: "chevron.right")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                    
                    HStack (spacing: 0){
                        ForEach(days,id: \.self) {day in
                            Text(day)
                                .font(.callout)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                        }
                        
                    }
                    let columns = Array(repeating: GridItem(.flexible()), count: 7)
                    
                    LazyVGrid(columns: columns, spacing:  15) {
                        ForEach(extractDate()) { value in
                            
                            CardView(value: value)
                                .background(
                                    Capsule()
                                        .fill(Color.orange)
                                        .padding(.horizontal, 8)
                                        .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                                )
                                .onTapGesture {
                                    currentDate = value.date
                                }
                        }
                    }
                    
                    VStack (spacing: 20){
                        Text("Tasks")
                            .font(.title2.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 20)
                        
                        if let task = tasks.first(where: { task in
                            return isSameDay(date1: task.taskDate, date2: currentDate)
                        }) {
                            
                            ForEach (task.task) { task in
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    // for custom time
                                    Text(task.time
                                        .addingTimeInterval(CGFloat
                                            .random(in: 0...5000)),style: .time)
                                    
                                    Text(task.title)
                                        .font(.title2.bold())
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    
                                    Color(Color.orange)
                                        .opacity(0.5)
                                        .cornerRadius(10)
                                )
                            }
                            
                        } else {
                            Text("No Task Found")
                        }
                    }
                }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .onChange(of: currentMonth) { newValue in
                
                // Month 업데이트
                currentDate = getCurrentMonth()
            }
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue)->some View {
        
        VStack {
            
            if value.day != -1 {
                 
                if let task = tasks.first(where: { task in
                    
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }) {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundStyle(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Circle()
                        .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? Color.white : Color.orange )
                        .frame(width: 8, height: 8)
                        
                
                } else {
                    
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundStyle(isSameDay(date1: value.date, date2: currentDate) ?  .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
            }
        }
        .padding(.vertical,9 )
        .frame(height: 60, alignment: .top)
    }
    
    // 날짜 확인
    func isSameDay(date1: Date, date2: Date)->Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
     
    
    func getTextColor(for date: Date) -> Color {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)
        
        switch weekday {
        case 1: // Sunday
            return .red
        case 7: // Saturday
            return .blue
        default:
            return .black
        }
    }
    
    // 표시를 위해 연도 및 월 추가
    
    func extraDate()->[String] {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth()-> Date {
        let calendar = Calendar.current
        
        // 현재 달과 날짜와 가져오기
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        
        return currentMonth
    }
    
    func extractDate()-> [DateValue]{
        
        let calendar = Calendar.current
        
        // 현재 달과 날짜와 가져오기
        
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            
            // 날짜 받기
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
            
        }
        
        //정확한 요일을 얻기 위해 오프셋 날짜 추가
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
        
    }
}

#Preview {
//        CalenderView()
    ContentView()
    
}

extension Date {
    
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        
        // 해당 월의 첫 날 가져오기
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        // 해당 월의 마지막 날 가져오기
        let endDate = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startDate)!
        
        // 해당 월의 모든 날짜 가져오기
        var currentDate = startDate
        var allDates: [Date] = []
        
        while currentDate <= endDate {
            allDates.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        return allDates
    }
}
