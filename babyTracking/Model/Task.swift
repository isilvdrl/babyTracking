//
//  SwiftUIView.swift
//  babyTracking
//
//  Created by IŞIL VARDARLI on 6.11.2024.
//

import SwiftUI

struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task : [Task]
    var taskDate: Date
}
func getSampleDate(offset : Int) -> Date {
    let calendar = Calendar.current
    guard let currentMonth = calendar.date(byAdding: .day, value: offset, to: Date())
    else {return Date()}
    
    return currentMonth
}
var tasks:[TaskMetaData] = [
    TaskMetaData(task: [
        Task(title: "First Task"),
        Task(title: "Second Task"),
        Task(title: "Third Task"),
    ], taskDate: getSampleDate(offset: 6)),
    TaskMetaData(task: [
        Task(title: "First Task"),
        Task(title: "Second Task"),
        Task(title: "Third Task")
    ], taskDate: getSampleDate(offset: -3))
    
]
