//
//  ResultScreen.swift
//  Quiz-App
//
//  Created by AVIK MUKHERJEE on 25/08/24.
//

import SwiftUI

struct ResultScreen: View {
    @EnvironmentObject var APICalling: TriviaAPI
    @State private var navigateToQuestions = false
       
       
       var body: some View {
           if APICalling.reachedEnd {
               VStack(spacing: 30) {
                   
                   Image("Result_Illustration")
                       .resizable()
                       .scaledToFit()
                       .frame(width: 143.78, height: 151.11)
                   
                   Text("Results of the Quiz")
                       .font(.system(size: 22, weight: .bold))
                       .multilineTextAlignment(.center)
                   

                   VStack {
                       ResultCardView(card: CardData(title: "TOTAL QUESTIONS", value: APICalling.length))
                       ResultCardView(card: CardData(title: "CORRECT QUESTIONS", value: APICalling.score))
                   }
                   
                   Spacer()
                   
                   Button {
                       Task.init {
                           await APICalling.resetGame()
                           navigateToQuestions = true
                           
                       }
                   } label: {
                       PrimaryButton(text: "Play Again")
                   }
               }
               .padding()
               .frame(maxWidth: .infinity, maxHeight: .infinity)
               .background(Color("AccentColor"))
               .navigationBarHidden(true)
                               .navigationDestination(isPresented: $navigateToQuestions) {
                                   QuestionScreen()
                               }
           } else {
               QuestionScreen()
                   .environmentObject(APICalling)
           }
       }
}

#Preview {
    ResultScreen()
        .environmentObject(TriviaAPI())
}
