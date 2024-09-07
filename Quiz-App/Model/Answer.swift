//
//  Answer.swift
//  Quiz-App
//
//  Created by AVIK MUKHERJEE on 25/08/24.
//

import Foundation

struct Answer: Identifiable{
    var id = UUID()
    var text: NSAttributedString
    var isCorrect: Bool
}
