//
//  CalendarView.swift
//  disso
//
//  Created by Nika Pakravan on 23/04/2022.
//

import SwiftUI

struct CalendarView: View {
    @EnvironmentObject var calendarViewModel: CalendarViewModel
    
    var body: some View {
        
        CalendarHomeView()
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .environmentObject(CalendarViewModel())
    }
}
