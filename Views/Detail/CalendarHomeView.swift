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
            .padding(.vertical)
        }
        // safe area view
        .safeAreaInset(edge: .bottom) {
            
            HStack {
                
                Button {
                    
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
    }
}

struct CalendarHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHomeView()
    }
}
