//
//  ContentView.swift
//  29.WordScramble
//
//  Created by Валентин on 27.05.2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        List {
            Text("Статическая строка")
            ForEach(testStrings(), id: \.self){
                Text($0)
            }
            Text("Статическая строка")
        }
    }
    func testStrings() -> [String] {
        let input = """
               a       d    
              b          d   
               c         d    
            """
        let letters = input.components(separatedBy: "\n")
        let letter = letters.randomElement()
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        return [trimmed ?? ""]
    }
}

#Preview {
    ContentView()
}
