//
//  Project.swift
//  Idea Vault
//
//  Created by John Walbran on 9/18/25.
//

import Foundation
import SwiftData

@Model
final class Project {
    @Attribute(.unique) var id = UUID()
    var title: String
    var createdDate: Date
    var lastUpdated: Date?
    //var notes = [Note]
    
    init(pTitle: String, pCreated: Date, pUpdated: Date?) {
        self.title = pTitle
        self.createdDate = pCreated
        self.lastUpdated = pUpdated
    }
}
