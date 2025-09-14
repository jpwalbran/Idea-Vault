//
//  Item.swift
//  Idea Vault
//
//  Created by John Walbran on 9/12/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var id: UUID = UUID()
    var lastUpdated: Date
    var createdDate: Date
    var title: String
    var notes: [ItemNote]
    
    init(lastUpdate: Date, created: Date, title: String, notes: [ItemNote] = []) {
        self.lastUpdated = lastUpdate
        self.createdDate = created
        self.title = title
        self.notes = notes
    }
}
