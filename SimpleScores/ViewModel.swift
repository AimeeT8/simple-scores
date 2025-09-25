//
//  ViewModel.swift
//  ToDo
//
//  Created by Aimee Temple on 2025-09-22.
//
import Combine
import Foundation


class ViewModel: ObservableObject {
    
    @Published var items: [Score]
    
    
    private let savePath = FileManager.documentsDIrectory.appendingPathComponent("SavedItems")
    
    
    private var saveSubscription: AnyCancellable?
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            items = try JSONDecoder().decode([Score].self, from: data)
        } catch {
            items = []
        }
        // Detect a 5 second delay after a change then save. This is in case of an app crash the data will still be saved.
        saveSubscription = $items.debounce(for: 5, scheduler: RunLoop.main)
            .sink { [weak self] _ in
                self?.save()
            }
    }
    
    
    func save() {
        print("Saving!!")
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
    
    func add() {
        // everytime a player is created pick a different unused color:
        let usedColors = items.map(\.color)
        let color = ColorChoice.allCases.first { usedColors.contains($0) == false } ?? .blue
        let newItem = Score(color: color)
        items.append(newItem)
    }
    
    // swipe to delete
    func delete(_ offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
  
    func deleteAll() {
        items.removeAll()
    }
    
    func reset() {
        for i in 0..<items.count {
            items[i].score = 0
        }
    }
    
}
