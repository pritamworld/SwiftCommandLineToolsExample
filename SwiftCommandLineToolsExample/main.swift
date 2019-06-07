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
    case coffee, tea, juice
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

