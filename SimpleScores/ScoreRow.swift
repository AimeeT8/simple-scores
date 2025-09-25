//
//  ScoreRow.swift
//  SimpleScores
//
//  Created by Aimee Temple on 2025-09-25.
//

import SwiftUI

struct ScoreRow: View {
    @Binding var item: Score
    
    
    var body: some View {
        HStack(spacing: 10) {
            Button {
                item.score -= 1
            } label: {
                Image(systemName: "minus")
                    .font(.title3.weight(.black))
                    .frame(minWidth: 44, minHeight: 44)
                    .contentShape(Rectangle())
            }
            
            TextField("Player Name", text: $item.playerName)
                .font(.title.weight(.black))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(String(item.score))
                .font(.title.weight(.black))
            
            Button {
                item.score += 1
            } label: {
                Image(systemName: "plus")
                    .font(.title3.weight(.black))
                    .frame(minWidth: 44, minHeight: 44)
                    .contentShape(Rectangle())
            }
            
        }
        .padding(10)
        .animation(nil, value: item)
        .background(Color(item.color.rawValue))
        
        
    }
}

#Preview {
    ScoreRow(item: .constant(.example))
}
