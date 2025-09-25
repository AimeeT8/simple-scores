//
//  FileManager-DocumentsDirectory.swift
//  ToDo
//
//  Created by Aimee Temple on 2025-09-22.
//

import Foundation


extension FileManager {
    
    static var documentsDIrectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
