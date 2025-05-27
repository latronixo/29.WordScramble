//
//  ContentView.swift
//  29.WordScramble
//
//  Created by Валентин on 27.05.2025.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        List (people, id: \.self) {
            Text($0)
        }
    }
}

#Preview {
    ContentView()
}
