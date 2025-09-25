//
//  ContentView.swift
//  SimpleScores
//
//  Created by Aimee Temple on 2025-09-25.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model: ViewModel
    
    @State private var showingClearAlert = false
    
    
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
            .listRowSeparator(.hidden)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: model.reset) {
                    Label("Reset Scores to 0", systemImage: "arrow.counterclockwise")
                }
                .disabled(model.items.isEmpty)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingClearAlert = true
                } label: {
                    Label("Remove All", systemImage: "trash")
                }
                .disabled(model.items.isEmpty)
            }
        }
        .alert("Delete all players?", isPresented: $showingClearAlert) {
            Button("Delete", role: .destructive, action: model.deleteAll)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("This will immediately remove all players and their score.")
        }
        .animation(.default, value: model.items)
        .navigationTitle("Simple Scores")
        .listStyle(.plain)
    }
}

#Preview {
    ContentView(model: ViewModel())
}
