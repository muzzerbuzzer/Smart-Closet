//
//  Task.swift
//  disso
//
//  Created by Nika Pakravan on 23/04/2022.
//

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

    /*TaskMetaData(task: [
    
        Task(title: "Talk to iJustine"),
        Task(title: "Work on Dissertation"),
        Task(title: "Workout !!!")
    ], taskDate: getSampleDate(offset: 1)),
    
    TaskMetaData(task: [
        
        Task(title: "Talk to Neil")
    ], taskDate: getSampleDate(offset: -3)),
    
    TaskMetaData(task: [
        
        Task(title: "Meeting wtih Friends")
    ], taskDate: getSampleDate(offset: -8)),
    
    TaskMetaData(task: [
        
        Task(title: "Next Version of Report")
    ], taskDate: getSampleDate(offset: 10)),
    
    TaskMetaData(task: [
        
        Task(title: "Gym")
    ], taskDate: getSampleDate(offset: -22)),
    
    TaskMetaData(task: [
        
        Task(title: "Movies @ Odeon Swiss")
    ], taskDate: getSampleDate(offset: 15)),
    
    TaskMetaData(task: [
        
        Task(title: "Dinner with Neil")
    ], taskDate: getSampleDate(offset: -20)),*/
    
]
