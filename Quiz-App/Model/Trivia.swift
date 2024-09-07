//
//  Trivia.swift
//  Quiz-App
//
//  Created by AVIK MUKHERJEE on 25/08/24.
//

import Foundation

struct Trivia: Decodable{
    var results: [Result]
    
    struct Result: Decodable, Identifiable{
        var id: UUID {
            UUID()
        }
        
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        
        var formattedQuestion: NSAttributedString {
                    do {
                        return try NSAttributedString(markdown: question)
                    } catch {
                        print("Error setting formatedQuestion: \(error)")
                        return NSAttributedString("")
                    }
                }
        
        var answer: [Answer] {
                    do {
                        let correct = [Answer(text: try NSAttributedString(markdown: correctAnswer), isCorrect: true)]
                        let incorrect = try incorrectAnswers.map { answer in
                            Answer(text: try NSAttributedString(markdown: answer), isCorrect: false)
                        }
                        let allAnswers = correct + incorrect
                        
                        return allAnswers.shuffled()
                    } catch {
                        print("Error getting Answer: \(error)")
                        return []
                    }
                }
    }
}
