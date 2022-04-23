//
//  DateValue.swift
//  disso
//
//  Created by Nika Pakravan on 23/04/2022.
//

import SwiftUI

// model for date value
struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
