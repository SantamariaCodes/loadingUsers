//
//  ContentView.swift
//  FriendList
//
//  Created by Diego Santamaria on 30/4/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    
    @State private var showingAddExpense = false

    @State private var sortOder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.email)
        
    ]
    var body: some View {
        NavigationStack {
            UserList(sortOder: sortOder)
                .toolbar {
                    Button("Add Expense", systemImage: "plus") {
                        showingAddExpense = true
                    }

                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort by", selection: $sortOder) {
                            Text("Name (A-Z)")
                                .tag([
                                    SortDescriptor(\User.name),
                                    SortDescriptor(\User.email)
                                ])
                            Text("Name (Z-A)")
                                .tag([
                                    SortDescriptor(\User.name, order: .reverse),
                                    SortDescriptor(\User.email)
                                ])
                            
                        }
                    }
                }
                .sheet(isPresented: $showingAddExpense) {
                    AddUser()
                }
        }
    }
    
}

#Preview {
    ContentView()
}
