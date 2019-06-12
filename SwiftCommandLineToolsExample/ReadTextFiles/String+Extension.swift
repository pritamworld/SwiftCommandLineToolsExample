//
//  String+Extension.swift
//  SwiftCommandLineToolsExample
//
//  Created by Pritesh Patel on 2019-06-12.
//  Copyright © 2019 MoxDroid. All rights reserved.
//

import Foundation
extension String {
    func getEmails() -> [String] {
        if let regex = try? NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}", options: .caseInsensitive)
        {
            let string = self as NSString
            
            return regex.matches(in: self, options: [], range: NSRange(location: 0, length: string.length)).map {
                string.substring(with: $0.range).replacingOccurrences(of: "", with: "").lowercased()
            }
        }
        return []
    }
}
