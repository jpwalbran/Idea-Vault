//
//  ProjectCreateView.swift
//  Idea Vault
//
//  Created by John Walbran on 9/15/25.
//

import SwiftUI
import SwiftData

enum ValidationError: LocalizedError {
    case emptyText
    case tooLong
    
    var errorDescription: String? {
        switch self {
        case .emptyText:
            return "Project title can't be empty!"
        case .tooLong:
            return "Project title can't be more than 200 characters!"
        }
    }
}

struct ProjectCreateView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var projs: [Project]
    @State private var projectTitle: String = ""
    @State private var titleError: ValidationError? = nil
    @State private var showAlert: Bool = false
    
    var body: some View {
        List {
            Text("Create a Project")
                .font(.title)
                .bold()
            TextField("Enter a project title.", text: $projectTitle)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                let t = projectTitle
                if t.isEmpty {
                    titleError = ValidationError.emptyText
                    showAlert = true
                }
                if t.count > 200 {
                    titleError = ValidationError.tooLong
                    showAlert = true
                }
                
                let proj = Project(
                    pTitle: t,
                    pCreated: Date(),
                    pUpdated: Date()
                )
                
                do {
                    modelContext.insert(proj)
                    try modelContext.save()
                }
                catch {
                    print("Error in writing to the model.")
                }
            }) {
                Text("Create Project.")
            }
            .alert(isPresented: $showAlert, error: titleError) {_ in
                Button("OK") {
                    showAlert = false
                    titleError = nil
                }
            } message: { error in
                Text(error.localizedDescription)
            }
            }
        }
    }


#Preview {
    ProjectCreateView()
}
