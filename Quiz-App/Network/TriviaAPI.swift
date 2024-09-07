//
//  TriviaAPI.swift
//  Quiz-App
//
//  Created by AVIK MUKHERJEE on 25/08/24.
//

import Foundation
import SwiftUI

class TriviaAPI: ObservableObject{
    private(set) var trivia: [Trivia.Result] = []
    
    @Published private(set) var length = 0
    @Published private(set) var index = 0
       @Published private(set) var reachedEnd = false
       @Published private(set) var answerSelected = false
       @Published private(set) var question: NSAttributedString = NSAttributedString("")
       @Published private(set) var answerChoices: [Answer] = []
       @Published private(set) var progress: CGFloat = 0.0
       @Published private(set) var score = 0
    
    
    init(){
        Task.init{
            await fetchQuestions()
        }
    }
    
    func fetchQuestions() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10")
        else {fatalError("Bhari Blunder HO Gaya re Baba")}
        
        let urlRequest = URLRequest(url: url)
        
        do{
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard(response as? HTTPURLResponse)?.statusCode == 200 else{
                fatalError("Error while fetching Data")
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Trivia.self, from: data)
            
            DispatchQueue.main.async{
                self.trivia = decodedData.results
                self.length = self.trivia.count
                self.setQuestions()
            }
        }
        catch{
            print("Error while fetching question: \(error)")
        }
    }
    
    func goToNextQuestion(){
        if index + 1 < length {
            index += 1
            setQuestions()
        }else{
            reachedEnd = true
        }
    }
    
    func setQuestions() {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 310)
        
        if index < length {
            let currentQuestion = trivia[index]
            question = currentQuestion.formattedQuestion
            answerChoices = currentQuestion.answer
        }
    }
    
    func selectedAnswer(answer: Answer){
        answerSelected = true
        if answer.isCorrect{
            score += 1
        }
    }
    
    func resetGame() async {
            await fetchQuestions()
            DispatchQueue.main.async {
                self.reachedEnd = false
                self.score = 0
                self.index = 0
                self.progress = 0.0
                self.answerSelected = false
            }
        }
    
}
