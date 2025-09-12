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
    var lastUpdated: Date
    var createdDate: Date
    var title: String
    
    init(lastUpdate: Date, created: Date, title: String) {
        self.lastUpdated = lastUpdate
        self.createdDate = created
        self.title = title
    }
}
