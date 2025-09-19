//
//  ContentView.swift
//  Idea Vault
//
//  Created by John Walbran on 9/12/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var projects: [Project]

    var body: some View {
        NavigationSplitView {

            VStack {
                ProjectCreateView()
                ScrollView(.vertical){
                    LazyVStack {
                        ForEach(projects) { proj in
                            NavigationLink{
                                Text(proj.title)
                                Text("Created On: \(proj.createdDate)")
                            } label: {
                                Text(proj.title)
                            }
                        }
                        .onDelete(perform: deleteProjects)
                    }
                }
                .toolbar {
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            }
        }
        detail: {
                Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newProj = Project(pTitle: "Test Decoy Project", pCreated: Date(), pUpdated: Date())
            modelContext.insert(newProj)
        }
    }
    //private func addItem() {
    //    withAnimation {
    //        let newItem = Item(lastUpdate: Date(), created: Date(), title: "New Item")
    //        modelContext.insert(newItem)
    //    }
    //}

    private func deleteProjects(offsets: IndexSet) {
       withAnimation {
            for index in offsets {
                modelContext.delete(projects[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Project.self, inMemory: true)
}
