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
    func testBundles() {
        if let fileURL = Bundle.main.url(forResource: "somefile", withExtension: "txt") {
            //мы нашли файл в пакете
            if let fileContents = try? String(contentsOf: fileURL) {
                //мы загрузили файл в строку
                
            }
        }
    }
}

#Preview {
    ContentView()
}
