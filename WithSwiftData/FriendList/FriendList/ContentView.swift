//
//  ContentView.swift
//  FriendList
//
//  Created by Diego Santamaria on 30/4/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) private var users: [User]
    
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




#Preview {
    ContentView()
}
