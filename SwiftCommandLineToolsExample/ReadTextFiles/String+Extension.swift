//
//  String+Extension.swift
//  SwiftCommandLineToolsExample
//
//  Created by Pritesh Patel on 2019-06-12.
//  Copyright © 2019 MoxDroid. All rights reserved.
//

import Foundation
//https://randomtextgenerator.com/
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
    
    /*
     First we define our extension of the String struct, effectively allowing us to add functions to Swift’s default String struct.
     We define a function hashtags() that takes no input, and outputs an array of strings.
     We define an instance of NSRegularExpression with the regular expression #[a-z0-9]+ that searches for hashtags. We use conditional binding to only continue if regex is not nil.
     We then cast self to NSString to avoid getting into trouble with the string’s length
     We then call matches(in:options:range:) on regex. We provide it with self, which is the receiving String instance that we called hashtags() on. We also provide it with the full range of the input string.
     On the result of matches(…) we call higher-order function map(_:), which iterates over the individual search results of the regular expression.
     Within the closure of map(_:) we first extract the hashtag by calling substring(with:), then remove the # symbol and turn the hashtag into lowercase characters.
     Ultimately, we return the result of that entire expression, because the type of map(_:) is now inferred to be [String] or array-of-strings. Oh, and when the if let conditional binding isn’t executed, we simply return an empty array.
     */
    
    //https://learnappmaking.com/regular-expressions-swift-string/
    func getAllHashTags() -> [String]
    {
        if let regex = try? NSRegularExpression(pattern: "#[a-z0-9]+", options: .caseInsensitive)
        {
            let string = self as NSString
            
            return regex.matches(in: self, options: [], range: NSRange(location: 0, length: string.length)).map {
                string.substring(with: $0.range).replacingOccurrences(of: "#", with: "").lowercased()
            }
        }
        
        return []
    }
}
