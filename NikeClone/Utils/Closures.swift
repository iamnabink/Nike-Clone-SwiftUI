//
//  Closures.swift
//  NikeClone
//
//  Created by Nabraj Khadka on 09/07/2024.
//

import Foundation
import SwiftUI



//In Swift, {} denotes a closure, which is a self-contained block of functionality that can be passed around and used in your code. Closures can capture and store references to any constants and variables from the context in which they are defined. This is known as closing over those constants and variables, hence the name "closure."

// The basic syntax for a closure is as follows:
//{ (parameters) -> returnType in
//    ...Code
//}

// closure shorthand syntax:

let sumClosure: (Int, Int) -> Int = { $0 + $1 }

let result = sumClosure(2, 3) // result is 5


//Closures can capture and store references to variables and constants from the surrounding context:

func makeIncrementer(incrementAmount: Int) -> () -> Int {
    var total = 0
    let incrementer: () -> Int = {
        total += incrementAmount
        return total
    }
    return incrementer
}

let incrementByTwo = makeIncrementer(incrementAmount: 2)
//print(incrementByTwo()) // 2
//print(incrementByTwo()) // 4



struct TestClosure: View {
    @State private var index: Int = 0
    var body: some View {
        
        VStack {
            Text("Current index: \(index)")
            Button("Increment") {
                index += 1
            }
        }
        .onChange(of: index) { oldValue, newValue in
            // This is the closure
            print("Index changed from \(oldValue) to \(newValue)")
        }
    }
}

