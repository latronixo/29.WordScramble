//
//  ContentView.swift
//  29.WordScramble
//
//  Created by Валентин on 27.05.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List (0..<5) {
            Text("Dynamic Row \($0)")
        }
    }
}

#Preview {
    ContentView()
}
