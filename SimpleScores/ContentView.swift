//
//  ContentView.swift
//  SimpleScores
//
//  Created by Aimee Temple on 2025-09-25.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model: ViewModel
    
    var body: some View {
        List {
            ForEach($model.items, content: ScoreRow.init)
                .onDelete(perform: model.delete)
            
            Button(action: model.add) {
                Label("Add Player", systemImage: "plus")
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .contentShape(Rectangle())
            }
            // don't add more players than there are colors.
            .disabled(model.items.count == ColorChoice.allCases.count)
        }
        .animation(.default, value: model.items)
        .navigationTitle("Simple Scores")
    }
}

#Preview {
    ContentView(model: ViewModel())
}
