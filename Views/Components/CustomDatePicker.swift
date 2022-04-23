//
//  CustomDatePicker.swift
//  disso
//
//  Created by Nika Pakravan on 23/04/2022.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var currentDate: Date
    
    //to update the month when the arrow button is clicked
    @State var currentMonth: Int = 0
    
    var body: some View {
        
        VStack(spacing: 35) {
            
            //days
            let days: [String] =
                ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
            
            HStack(spacing: 20) {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("2022")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text("April")
                        .font(.title.bold())
                }
                
                Spacer(minLength: 0)
                
                Button {
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            //day view
            
            HStack(spacing: 0){
                ForEach(days, id: \.self){day in
                    
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            //Dates
            // lazy grid here
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15) {
                
                ForEach(extractDate()) {value in
                    
                    Text("\(value.day)")
                        .font(.title3.bold())
                }
            }
        }
    }
    
    func extractDate()->[DateValue]{
        
        let calendar = Calendar.current
        
        //getting date of the current month
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return []
        }
        
        return currentMonth.getAllDates().compactMap { date -> DateValue in
            
            //getting day
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

//Extending date to get the dates of the current month
extension Date {
    
    func getAllDates() -> [Date] {
        
        let calendar = Calendar.current
        
        let range = calendar.range(of: .day, in: .month, for: self)!
        
        //getting date
        return range.compactMap { day -> Date in
            
            return calendar.date(byAdding: .day, value: day, to: self)!
        }
    }
}
