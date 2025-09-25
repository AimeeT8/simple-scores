//
//  Score.swift
//  SimpleScores
//
//  Created by Aimee Temple on 2025-09-25.
//

import Foundation

struct Score: Codable, Identifiable, Hashable {
    
    var id = UUID()
    var playerName = "New Player"
    var score = 0
    var color = ColorChoice.blue
    
    static let example = Score()
}
