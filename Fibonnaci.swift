//
//  Fibonnaci.swift
//
//  Created by Van
//  Created on 2024-04-20
//  Version 1.0
//  Copyright (c) 2024 Van Nguyen. All rights reserved.
//
//  This program outputs the fibonnaci sequence

import Foundation

func fibonacci(numberOfTerms num: Int) -> Int {
    // Base cases: if num is 0 or 1, return num
    if num <= 1 {
        return num
    }
    // Recursive case: calculate Fibonacci number using previous two Fibonacci numbers
    return fibonacci(numberOfTerms: num - 1) + fibonacci(numberOfTerms: num - 2)
}

func generateFibonacciSequence(numberOfTerms numTerms: Int) -> [Int] {
    var sequence = [Int]()
    // Generate Fibonacci sequence
    for i in 1...numTerms {
        sequence.append(fibonacci(numberOfTerms: i))
    }
    return sequence
}

// File paths
let inputFilePath = "./input.txt"
let outputFilePath = "./output.txt"

// Initialize variables
var numTerms = 0

// Input from input file
if let inputString = try? String(contentsOfFile: inputFilePath) {
    if let inputInt = Int(inputString.trimmingCharacters(in: .whitespacesAndNewlines)) {
        numTerms = inputInt
        // Generate Fibonacci sequence
        let fibonacciSequence = generateFibonacciSequence(numberOfTerms: numTerms)
        let outputString = "Fibonacci sequence of \(numTerms) terms:\n\(fibonacciSequence.map({"\($0)"}).joined(separator: " "))\n"
        // Write to output file
        try? outputString.write(toFile: outputFilePath, atomically: true, encoding: .utf8)
    } else {
        print("Input file does not contain a valid integer.")
    }
} else {
    print("Input file could not be found or read.")
}
