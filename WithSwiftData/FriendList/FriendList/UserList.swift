//
//  ContentView.swift
//  FriendList
//
//  Created by Diego Santamaria on 30/4/24.
//
import SwiftData
import SwiftUI

struct UserList: View {
    @Environment(\.modelContext) var modelContext
    @Query private var users: [User]
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(value:user) {
                    HStack {
                        Circle()
                            .fill(user.isActive ? .green : .red)
                            .frame(width:10)
                        Text(user.name)
                    }
                }
            }
            .navigationTitle("Friendface")
            .navigationDestination(for: User.self) { user in
               UserVIew(user: user)
            }
            .task {
                await fetchUsers()
            }
        }
    }
    
    init(sortOder: [SortDescriptor<User>]) {
        _users = Query(sort: sortOder)
    }
    
    func fetchUsers() async {
        guard users.isEmpty else { return }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let downloadedUsers = try decoder.decode([User].self, from: data)
            // Why insertContext instead of just inserting to modelContext? SwiftData enables autosave by default. This only applies to the main modelContext model container. When we create a new model context by hand (without enabling autosave), it means that when we insert to insertContext, it won't update the UI until we say so. We ask for an update/save until it finishes so we get everything loading at once, instead of everything loading live on the first start. Plus, doing it manually gives us the power to discard changes if we want to do so.
            let insertContext = ModelContext(modelContext.container)
            
            for user in downloadedUsers {
                insertContext.insert(user)
            }
            try insertContext.save()
        } catch {
            print("Download failed")
        }
        
    }
}




