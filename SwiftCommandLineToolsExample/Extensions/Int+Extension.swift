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
}
