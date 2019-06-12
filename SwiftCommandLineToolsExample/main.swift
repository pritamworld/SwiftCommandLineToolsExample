//
//  main.swift
//  SwiftCommandLineToolsExample
//
//  Created by Pritesh Patel on 2019-03-12.
//  Copyright © 2019 MoxDroid. All rights reserved.
//
//https://dev.to/ceri_anneblog/how-to-make-a-command-line-tool-in-xcode-2f81
import Foundation

//print("Hello, World! This is my command line tool")

//------------- 1 ------------
let latinCapitalLetterA: Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"

print(latinCapitalLetterA, cyrillicCapitalLetterA)

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent.")
}
// Prints "These two characters are not equivalent."

//------------- 2 ------------
// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"


func run() {
    
    let arguments = CommandLine.arguments
    
    if arguments.count > 1 {
        
        let greeting = arguments[1]
        
        print(greeting)
        
    }
    
    if arguments.count > 2 {
        
        let number = arguments[2]
        
        print(number)
        
    }
    
    print("Hello, World! This is my command line tool")
    
}

run()



//recursion
func add(n: Int) -> Int
{
    if(n == 0)
    {
        return n
    }
    else{
        return n + add(n: n - 1)
    }
}

let sum = add(n: 5)

print("SUM : \(sum)")

//Print Array using recursion

let a = [1, 2, 3, 4, 5]

func printArray(a :[Int], index: Int)
{
    if(index != -1)
    {
        print(a[index]) //Print Reverse Array
        printArray(a: a, index: index - 1)
        //print(a[index]) //Print Forward array
    }
}

printArray(a: a, index: a.count - 1)

enum CompassPoint {
    case north
    case south
    case east
    case west
}

print(CompassPoint.east)

enum Planet: CaseIterable {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
    //case coffee, tea, juice
}

for v in Planet.allCases
{
    print(v)
}


enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
print(productBarcode)

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
print(productBarcode)


//https://learnappmaking.com/plist-property-list-swift-how-to/
//Follow the given steps
//https://stackoverflow.com/questions/27771846/pathforresource-returns-nil-in-mac-os-x-console-application-swift/27778715
func getPlist(withName name: String) -> [String]?
{
    if  let path = Bundle.main.path(forResource: name, ofType: "plist"),
        let xml = FileManager.default.contents(atPath: path)
    {
        return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String]
    }
    
    return nil
}

if let fruits = getPlist(withName: "Fruits") {
    print(fruits)
}else{
    print("No able to read Fruits.plist file")
}


//------------------------------------------------------

//Reading A Plist With Codable
if  let path        = Bundle.main.path(forResource: "Preferences", ofType: "plist"),
    let xml         = FileManager.default.contents(atPath: path),
    let preferences = try? PropertyListDecoder().decode(Preferences.self, from: xml)
{
    print(path)
    print(preferences.webserviceURL)
}


//Writing Data To A Plist
let preferences = Preferences(webserviceURL: "https://api.twitter.com", itemsPerPage: 10, backupEnabled: false)

let encoder = PropertyListEncoder()
encoder.outputFormat = .xml

//Write at file:///Users/pritesh.patel/Documents/Preferences.plist
let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Preferences.plist")

print(path)

do {
    let data = try encoder.encode(preferences)
    try data.write(to: path)
    print("Data written to plist")
} catch {
    print(error)
}
//------------------------


//https://www.raywenderlich.com/666-filemanager-class-tutorial-for-macos-getting-started-with-the-file-system
let home = FileManager.default.homeDirectoryForCurrentUser
print("HOME : \(home)")

let path1 = FileManager.default.urls(for: .allApplicationsDirectory, in: .userDomainMask)
print(path1)



/////Read txt file


if let pathText = Bundle.main.path(forResource: "SampleData", ofType: "txt") // file path for file "data.txt"
{
    do {
        let text = try String(contentsOfFile: pathText)
        
        print(text.getEmails()) //Finding all emails from text
        //print(text)
        var s =  text.split(separator: " ")
        //print(s)
        
        s.sort(by: <)
        //print(s)
    }
    catch
    {
        print("Error reading txt file")
    }
}else{
     print("NO reading txt file")
}
