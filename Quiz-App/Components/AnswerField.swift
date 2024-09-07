//
//  AnswerField.swift
//  Quiz-App
//
//  Created by AVIK MUKHERJEE on 25/08/24.
//

import SwiftUI

struct AnswerField: View {
    @EnvironmentObject var APIManager: TriviaAPI
    var answer: Answer
    
    @State private var isSelected = false
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    var body: some View {
        HStack(spacing: 30){
            Image(systemName: "circle")
                .font(.caption)
            
            Text(answer.text.string)
                .font(.system(size: 18))
                .foregroundStyle(Color(.black))
                .bold()
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle" : "x.circle")
                                   .foregroundStyle(Color(answer.isCorrect ? green : red))
            }
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .foregroundStyle(Color(APIManager.answerSelected ? (isSelected ? Color(.lightGray) : .gray): Color(.lightGray)))
                .background(.white)
                .cornerRadius(10)
                .shadow(color: isSelected ? (answer.isCorrect ? green : red) : .gray ,radius: 5)
                .onTapGesture {
                    if !APIManager.answerSelected {
                        isSelected = true
                        APIManager.selectedAnswer(answer: answer)
                    }
                }
    }
}

#Preview {
    AnswerField(answer: Answer(text: NSAttributedString("Question"), isCorrect: false))
        .environmentObject(TriviaAPI())
}
