//
//  ProgressBar.swift
//  Quiz-App
//
//  Created by AVIK MUKHERJEE on 25/08/24.
//

import SwiftUI

struct ProgressBar: View {
    
    var progressValue: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: 320, maxHeight: 10)
                .foregroundStyle(Color(hue: 1.0,
                    saturation: 0.0, brightness: 0.564, opacity: 0.327))
                .cornerRadius(20)
            
            Rectangle()
                .frame(width: progressValue, height: 10)
                .foregroundColor(.green)
                .cornerRadius(20)
        }
    }
}

#Preview {
    ProgressBar(progressValue: 70)
}
