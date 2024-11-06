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
    
}
