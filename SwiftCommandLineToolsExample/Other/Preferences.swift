//
//  Preferences.swift
//  SwiftCommandLineToolsExample
//
//  Created by Pritesh Patel on 2019-06-12.
//  Copyright © 2019 MoxDroid. All rights reserved.
//

import Foundation

struct Preferences: Codable {
    var webserviceURL:String
    var itemsPerPage:Int
    var backupEnabled:Bool
}
