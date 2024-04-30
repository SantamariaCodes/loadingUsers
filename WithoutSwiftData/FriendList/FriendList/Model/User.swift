//
//  Friend.swift
//  FriendList
//
//  Created by Diego Santamaria on 30/4/24.
//

import Foundation


struct User: Hashable, Identifiable, Codable {

        let id: UUID
        var isActive: Bool
        var name: String
        var age: Int
        var company: String
        var email: String
        var about: String
        var address: String
        var tags: [String]
        var friends: [UserGroup]
        var registered: Date
    
    static let example = User(id: UUID(), isActive: true, name: "Dargen", age: 32, company: "DargenCorp", email: "123@gmail.com", about: "He enjoys time with his loved ones", address: "Spain", tags: ["Reading","Chillin"], friends: [], registered: .now)

}

