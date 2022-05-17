//
//  DateValue.swift
//  disso
//
//  Created by Nika Pakravan on 23/04/2022.
//

//model for the date
/*This code has been re-used from Kavsoft's 'SwiftUI 3.0 Elegant Task App UI With Custom Date Picker - Custom Graphical Date Picker - Xcode 13'
video tutorial on YouTube*/
import SwiftUI

// model for date value
struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
