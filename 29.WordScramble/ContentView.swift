//
//  ContentView.swift
//  29.WordScramble
//
//  Created by Валентин on 27.05.2025.
//

import SwiftUI

struct ContentView: View {
    let people = ["Валя", "Диана", "Эвелина", "Денис"]
    
    var body: some View {
        List {
            Text("Статическая строка")
            ForEach(people, id: \.self){
                Text($0)
            }
            Text("Статическая строка")
        }
    }
}

#Preview {
    ContentView()
}
