//
//  Friend.swift
//  FriendList
//
//  Created by Diego Santamaria on 30/4/24.
//

import SwiftData
import Foundation

@Model
class User: Codable {

    enum CodingKeys: CodingKey {
        case id, isActive, name, age, company, email
        case address, about, registered, tags, friends
    }
    
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
    
    // Custom initializer for when adding users
    init(id: UUID, isActive: Bool, name: String, age: Int, company: String, email: String, about: String, address: String, tags: [String], friends: [UserGroup], registered: Date) {
          self.id = id
          self.isActive = isActive
          self.name = name
          self.age = age
          self.company = company
          self.email = email
          self.about = about
          self.address = address
          self.tags = tags
          self.friends = friends
          self.registered = registered
      }

    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        isActive = try container.decode(Bool.self, forKey: .isActive)
        name = try container.decode(String.self, forKey: .name)
        age = try container.decode(Int.self, forKey: .age)
        company = try container.decode(String.self, forKey: .company)
        email = try container.decode(String.self, forKey: .email)
        about = try container.decode(String.self, forKey: .about)
        address = try container.decode(String.self, forKey: .address)
        tags = try container.decode([String].self, forKey: .tags)
        friends = try container.decode([UserGroup].self, forKey: .friends)
        registered = try container.decode(Date.self, forKey: .registered)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(isActive, forKey: .isActive)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
        try container.encode(company, forKey: .company)
        try container.encode(email, forKey: .email)
        try container.encode(about, forKey: .about)
        try container.encode(address, forKey: .address)
        try container.encode(tags, forKey: .tags)
        try container.encode(friends, forKey: .friends)
        try container.encode(registered, forKey: .registered)

        
    }
    
 
    
 

}


