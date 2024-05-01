//
//  FriendListApp.swift
//  FriendList
//
//  Created by Diego Santamaria on 30/4/24.
//
import SwiftData
import SwiftUI

@main
struct FriendListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
