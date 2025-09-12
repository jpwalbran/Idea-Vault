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
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
