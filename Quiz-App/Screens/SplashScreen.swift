//
//  SplashScreen.swift
//  Quiz-App
//
//  Created by AVIK MUKHERJEE on 25/08/24.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                WelcomeScreen()
            } else {
                
                Image(systemName: "Quiz")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 240)
                
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color("AccentColor"))
    }
}


#Preview {
    SplashScreen()
}
