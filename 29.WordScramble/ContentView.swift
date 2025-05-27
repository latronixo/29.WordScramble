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
    
    @State private var errorTitle = ""          //заголовок окна об ошибке
    @State private var errorMessage = ""        //сообщение окна об ошибке
    @State private var showingError = false   //флаг отображения сообщения об ошибке
    
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
            .alert(errorTitle, isPresented: $showingError) { } message: {
                Text(errorMessage)
            }
        }
    }
    
    //добавление составленого слова в верх списка, если оно прошло все проверки
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Это слово уже было", message: "Будь более оригинальным!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Неверно составлено", message: "Ты не можешь составить это слово из слова \(rootWord)!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Нет такого слова", message: "Давай еще просто постучим по клавиатуре! ")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    //в начале игры загрузим слова из файла в массив и запишем случайное слово из этого массива в rootWord
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            do {
                let startWords = try String(contentsOf: startWordsURL, encoding: .utf8)
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            } catch {
                fatalError("Не удалось загрузить start.txt из Bundle: \(error)")
            }
        }
    }
    
    //проверка на неповторимость (повторяться нельзя)
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    //проверка, состоит ли составленное пользователем слово из букв заданного слова
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
    
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    //проверка на существование составленого пользователем слова в английском языке
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    //отображение сообщения об ошибке в составленном пользователем слове
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}



#Preview {
    ContentView()
}
