//
//  CalendarViewModel.swift
//  disso
//
//  Created by Nika Pakravan on 02/05/2022.
//

import Foundation

class CalendarViewModel: ObservableObject {
    @Published var tasks = [Task]()
    
    /*init() {
        addedOutfits = Task.all

    }*/
    
    func addTask(_ task: Task) {
        tasks.append(task)
      }
    
    func removeTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
          tasks.remove(at: index)
        }
      }
    
}

