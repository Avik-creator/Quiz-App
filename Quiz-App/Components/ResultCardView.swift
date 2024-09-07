//
//  ResultCardView.swift
//  Quiz-App
//
//  Created by AVIK MUKHERJEE on 25/08/24.
//

import SwiftUI

struct ResultCardView: View {
    
    let card: CardData
    var body: some View {
        HStack {
            Text(card.title)
                .font(.system(size: 16, weight: .medium))
            
            Spacer()
            
            Text("\(card.value)")
                .font(.system(size: 16, weight: .bold))
            
        }
        .padding()
        .background(Color(.blue))
        .cornerRadius(8)
    }
}

#Preview {
    ResultCardView(card: CardData(title: "Total Number of questions", value: 10))
}
