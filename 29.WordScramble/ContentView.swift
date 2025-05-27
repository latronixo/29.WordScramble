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
            Section("Section 1") {
                Text("Static Row 1")
                Text("Static Row 2")
            }

            Section("Section 2") {
                ForEach(0..<5) {
                    Text("Dynamic Row \($0)")
                }
            }

            Section("Section 3") {
                Text("Static Row 3")
                Text("Static Row 4")
            }
        }
    }
}

#Preview {
    ContentView()
}
