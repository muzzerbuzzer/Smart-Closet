//
//  CalendarView.swift
//  disso
//
//  Created by Nika Pakravan on 23/04/2022.
//

//allows calendar to be viewed
/*This code has been re-used from Kavsoft's 'SwiftUI 3.0 Elegant Task App UI With Custom Date Picker - Custom Graphical Date Picker - Xcode 13'
video tutorial on YouTube*/
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
