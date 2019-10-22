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
        print(text.getAllHashTags()) //Finding all #tags from text
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

//https://learnappmaking.com/map-reduce-filter-swift-programming/

let celcius1 = [-5.0, 10.0, 21.0, 33.0, 50.0]
var fahrenheit1:[Double] = []

for value in celcius1 {
    fahrenheit1 += [value * (9/5) + 32]
}

print(fahrenheit1)
// Output: [23.0, 50.0, 69.8, 91.4, 122.0]

let celcius2 = [-5.0, 10.0, 21.0, 33.0, 50.0]
let fahrenheit2 = celcius2.map { $0 * (9/5) + 32 }
print(fahrenheit2)
// Output: [23.0, 50.0, 69.8, 91.4, 122.0]


let celcius3 = [-5.0, 10.0, 21.0, 33.0, 50.0]

let fahrenheit3 = celcius3.map({ (value: Double) -> Double in
    return value * (9/5) + 32
})

print(fahrenheit3)


let values1 = [3, 4, 5]
let sum1 = values1.reduce(0, +)
print(sum1)
// Output: 12


let values2 = [7.0, 3.0, 10.0]
let avg:Double = values2.reduce(0.0) { $0 + ($1 / Double(values2.count)) }
print(avg)
// Output: 6.667


let values3 = [7.0, 3.0, 10.0]
let avg1 = values3.reduce(0.0, { (result:Double, item:Double) -> Double in
    return result + (item / Double(values3.count))
})
print(avg1)
// Output: 6.667


let values4 = [11, 13, 14, 17, 21, 33, 22]
let even = values4.filter { $0 % 2 == 0 }
print(even)
// Output: [14, 22]


print("--------- Dictionary ---------")
//Dictionary Grouping - https://www.tutorialspoint.com/swift/swift_dictionaries.htm
var cities = ["Delhi","Bangalore","Hyderabad","Dehradun","Bihar"]
print(cities)
var groupedCities = Dictionary(grouping: cities ) { $0.first! }
print(groupedCities)

//Sequence Based Initialization
var Distance = [2000, 10, 620, 1000, 200]
let cityDistanceDict = Dictionary(uniqueKeysWithValues: zip(cities, Distance))
print(cityDistanceDict)


//Dictionary Filtering
var closeCities = cityDistanceDict.filter { $0.value < 1000 }
print(closeCities)



//https://jsonplaceholder.typicode.com/
//https://www.journaldev.com/21839/ios-swift-json-parsing-tutorial
func readJSONFile(jsonFileName: String)
{
    let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json")
    
    guard let jsonData = url else{return}
    guard let data = try? Data(contentsOf: jsonData) else { return }
    guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else{return}
    
    print(json)
    
    
    //Convert JSON Response to Dictiponary
    if let dictionary = json as? [String: Any] {
        
        if let id = dictionary["id"] as? Int {
            print("ID : \(id)")
        }
        
        if let name = dictionary["name"] as? String {
            print("Name : \(name)")
        }
        
        if let username = dictionary["username"] as? String {
            print("Username : \(username)")
        }
        
        //Read Company as Dictionary and then fetch the values from it
        if let company = dictionary["company"] as? Dictionary<String, Any> {
            if let name = company["name"] as? String {
                //This doesn't get printed.
                print("Company Name : \(name)")
            }
        }
        
        for (key, value) in dictionary {
            print("Key is [\(key)] and value is [\(value)]" )
        }
        
    }

}

readJSONFile(jsonFileName: "Users")


//https://matteomanferdini.com/network-requests-rest-apis-ios-swift/
let today = Date()
print(today.timeAgo)
print(10000.thousandsFormatting)
print(10000.moneyAmount)

func readSpaceXLaunchesJSONFile(jsonFileName: String)
{
    let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json")
    
    guard let jsonData = url else{return}
    guard let data = try? Data(contentsOf: jsonData) else { return }
    guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else{return}
    
    print(json)
}

//readSpaceXLaunchesJSONFile(jsonFileName: "launches")


//TimeStamp to Date
print("Time Stamp : \(Date().timeIntervalSince1970)")

let unixTimestamp = 1480134638.0
let date = Date(timeIntervalSince1970: unixTimestamp)
print(date)

print("100".integerValue!)



func getSumOf(array:[Int], handler: ((Int)->Void)) {
    //step 2
    var sum: Int = 0
    for value in array {
        sum += value
    }
    
    //step 3
    handler(sum)
}

func doSomething() {
    //setp 1
    getSumOf(array: [16,756,442,6,23]) {(sum) in
        print(sum)
        //step 4, finishing the execution
    }
}//It will print the sumof all the given numbers.


//Operator Loading Example
extension Int {
    static func + (left: Int, right: Int) -> Int {
        return left * right
    }
}

print(4 + 2)
