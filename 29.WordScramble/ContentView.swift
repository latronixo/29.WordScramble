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
            a
            b
            c
            """
        let letters = input.components(separatedBy: "\n")
        return letters
    }
}

#Preview {
    ContentView()
}
