//
//  QuestionScreen.swift
//  Quiz-App
//
//  Created by AVIK MUKHERJEE on 25/08/24.
//

import SwiftUI

struct QuestionScreen: View {
    @EnvironmentObject var APICalling: TriviaAPI
    
    
    var body: some View {
        VStack(spacing: 40){
            HStack{
                ProgressBar(progressValue: APICalling.progress)
                Text("\(APICalling.index + 1) / \(APICalling.length)")
                                    .font(.system(size: 14))
                                    .fontWeight(.light)
                                    .foregroundStyle(Color(.lightGray))
                
            }
            
            VStack(alignment: .leading, spacing: 20) {
                            
                Text(APICalling.question.string)
                                .font(.system(size: 22))
                                .foregroundStyle(Color(.black))
                                .bold()
                                .multilineTextAlignment(.center)
                            
                            ForEach(APICalling.answerChoices, id: \.id) { answer in
                                AnswerField(answer: answer)
                                    .environmentObject(APICalling)
                            }
                        }
                        
                        Spacer()
            
            Button {
                            APICalling.goToNextQuestion()
                        } label: {
                            PrimaryButton(text: "Next", background:
                                            APICalling.answerSelected ? Color(.green) : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                        }
                        .disabled(!APICalling.answerSelected)
                        
                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .background(Color("AccentColor"))
                    .navigationBarHidden(true)
                        
        }
    }


#Preview {
    QuestionScreen()
        .environmentObject(TriviaAPI())
}
