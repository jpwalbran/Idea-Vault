//
//  ItemNote.swift
//  Idea Vault
//
//  Created by John Walbran on 9/14/25.
//

import Foundation
import SwiftData

@Model
final class ItemNote: Identifiable {
    
    var id: UUID = UUID()
    var project: UUID?
    var text: String
    var createdDate: Date
    var lastUpdated: Date
    
    
    init(lastUpdate: Date, createdDate: Date, text: String, project: UUID) {
        self.project = project
        self.text = text
        self.createdDate = createdDate
        self.lastUpdated = lastUpdate
    }
}
