//
//  UserVIew.swift
//  FriendList
//
//  Created by Diego Santamaria on 30/4/24.
//

import SwiftUI

struct UserVIew: View {
    let user: User
    
    var body: some View {
        List {
            Section("About") {
                Text(user.about)
                    .padding(.vertical)
            }
            Section("Contact details") {
                Text("Address: \(user.address)")
                Text("Company: \(user.company)")
            }
            Section("Friends") {
                ForEach(user.friends) {  friend in
                    Text(friend.name)
                }
            }
        }
        .listStyle(.grouped)
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


