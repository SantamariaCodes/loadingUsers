//
//  AddUser.swift
//  FriendList
//
//  Created by Diego Santamaria on 1/5/24.
//

import SwiftUI

struct AddUser: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            Form {
                Text("Placeholder")

            }
            .navigationTitle("Add new User")
            .toolbar {
                Button("Save") {
                    let newUser = User(
                        id: UUID(),
                        isActive: true,
                        name: "Dragon",
                        age: 30,
                        company: "Test Company",
                        email: "test@gmail.com",
                        about: "About user",
                        address: "123 Test Street",
                        tags: ["Friend"],
                        friends: [],
                        registered: Date()
                    )
                    modelContext.insert(newUser)
                    try? modelContext.save()
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddUser()
}
