//
//  PrimaryButton.swift
//  Quiz-App
//
//  Created by AVIK MUKHERJEE on 25/08/24.
//

import SwiftUI

struct PrimaryButton: View {
    
    var text: String
    var background: Color = Color(.green)
    
    var body: some View {
        Text(text)
            .frame(width: 300, height: 30)
            .foregroundStyle(Color(.white))
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(8)
    }
}

#Preview {
    PrimaryButton(text: "Next")
}
