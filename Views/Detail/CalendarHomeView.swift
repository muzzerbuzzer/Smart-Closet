//
//  CalendarHomeView.swift
//  disso
//
//  Created by Nika Pakravan on 23/04/2022.
//

import SwiftUI

struct CalendarHomeView: View {
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 20){
                //custom date picker
                CustomDatePicker(currentDate: $currentDate)
            }
        }
    }
}

struct CalendarHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHomeView()
    }
}
