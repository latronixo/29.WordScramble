//
//  ContentView.swift
//  29.WordScramble
//
//  Created by Валентин on 27.05.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()   //использованные слова (нельзя повторяться)
    @State private var rootWord = ""            //главное слово (из его букв нужно составлять слова)
    @State private var newWord = ""             //составленное пользователем слово
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Введите ваше слово", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            do {
                if let startWords = try? String(contentsOf: startWordsURL, encoding: .utf8) {
                    let allWords = startWords.components(separatedBy: "\n")
                    rootWord = allWords.randomElement() ?? "silkworm"
                    return
                }
            } catch {
                fatalError("Не удалось загрузить start.txt из Bundle: \(error)")
            }
        }
        
        
    }
}



#Preview {
    ContentView()
}
