//
//  Task.swift
//  disso
//
//  Created by Nika Pakravan on 23/04/2022.
//

//model for the task
/*This code has been re-used from Kavsoft's 'SwiftUI 3.0 Elegant Task App UI With Custom Date Picker - Custom Graphical Date Picker - Xcode 13'
video tutorial on YouTube*/
import SwiftUI

//task model and sample tasks

//array of tasks
struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var outfit: UIImage
    var time: Date = Date()
}

// total task meta view
struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

// sample data for testing
func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}


// sample tasks
var tasks: [TaskMetaData] = [
    
]
