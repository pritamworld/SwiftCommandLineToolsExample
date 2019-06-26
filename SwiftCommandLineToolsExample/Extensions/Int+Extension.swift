//
//  Int+Extension.swift
//  SwiftCommandLineToolsExample
//
//  Created by Pritesh Patel on 2019-06-26.
//  Copyright © 2019 MoxDroid. All rights reserved.
//

import Foundation
extension Int {
    var thousandsFormatting: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self))!
    }
    
    var moneyAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "€ "
        return formatter.string(from: NSNumber(value: Float(self) / 100))!
    }
    
}
