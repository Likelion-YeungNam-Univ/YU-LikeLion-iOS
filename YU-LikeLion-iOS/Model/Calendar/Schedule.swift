//
//  Schedule.swift
//  YU-LikeLion-iOS
//
//  Created by 윤강록 on 2/26/24.
//

import Foundation

// Schedule 샘플
struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
    
}

// Total Schedule Meta View
struct TaskMetaDate: Identifiable {
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

func getSampleDate(offset: Int) ->Date {
    let calender = Calendar.current
    
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

var tasks: [TaskMetaDate] = [
    
    TaskMetaDate(task: [
        
        Task(title: "FE 수업"),
        Task(title: "BE 수업"),
        Task(title: "해커톤")],
        taskDate: getSampleDate(offset: 1)),
    
    TaskMetaDate(task: [
        
        Task(title: "FE 수업")],

        taskDate: getSampleDate(offset: -3)),
    
    TaskMetaDate(task: [
        
        Task(title: "FE 수업")],
    
        taskDate: getSampleDate(offset: -8))
    
]
