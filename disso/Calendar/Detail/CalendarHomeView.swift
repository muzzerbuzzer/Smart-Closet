//
//  CalendarHomeView.swift
//  disso
//
//  Created by Nika Pakravan on 23/04/2022.
//

//code for calendar view
/*This code has been re-used from Kavsoft's 'SwiftUI 3.0 Elegant Task App UI With Custom Date Picker - Custom Graphical Date Picker - Xcode 13'
video tutorial on YouTube*/
import SwiftUI

struct CalendarHomeView: View {
    
    @EnvironmentObject var calendarViewModel: CalendarViewModel
    
    @State var currentDate: Date = Date()
    @State private var showAddOutfitToCalendar = false
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 20){
                //custom date picker
                CustomDatePicker(currentDate: $currentDate)
            }
            .padding(.vertical)
        }
        // safe area view
        .safeAreaInset(edge: .bottom) {
            
            HStack {
                
                Button {
                    //button to add outfit to calendar
                    showAddOutfitToCalendar = true
                } label: {
                    Text("Add Outfit")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color.mint, in: Capsule())
                }
                
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
        }
        .sheet(isPresented: $showAddOutfitToCalendar) {
            AddOutfittoCalendarView()
        }
    }
}

struct CalendarHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHomeView()
            .environmentObject(CalendarViewModel())
    }
}
