//
//  Date+Extension.swift
//  SwiftCommandLineToolsExample
//
//  Created by Pritesh Patel on 2019-06-26.
//  Copyright © 2019 MoxDroid. All rights reserved.
//

import Foundation
extension Date {
    var timeAgo: String {
        let calendar = Calendar.current
        let units: Set<Calendar.Component> = [.month, .year]
        let components = calendar.dateComponents(units, from: self, to: Date())
        let year = components.year!
        let month = components.month!
        return "\(year) "
            + (year > 1 ? "years" : "year")
            + ", \(month) "
            + (month > 1 ? "months" : "month")
            + " ago"
    }
}
