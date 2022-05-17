//
//  CalendarViewModel.swift
//  disso
//
//  Created by Nika Pakravan on 02/05/2022.
//

import Foundation

//creates an array of tasks for the calendar, and allows the calendar to have tasks added as well as removed
/*This code has been re-used from Kavsoft's 'SwiftUI 3.0 Elegant Task App UI With Custom Date Picker - Custom Graphical Date Picker - Xcode 13'
video tutorial on YouTube*/
class CalendarViewModel: ObservableObject {
    
    //"task" (outfit) array
    @Published var tasks = [Task]()

    
    //adds a "task" (outfit)
    func addTask(_ task: Task) {
        tasks.append(task)
      }
    
    //removes a "task" (outfit)
    func removeTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
          tasks.remove(at: index)
        }
      }
    
}

