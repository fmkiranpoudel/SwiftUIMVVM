//
//  User.swift
//  MVVM-SampleApp
//
//  Created by Kiran Poudel on 6/13/22.
//

import Foundation

/// User Model
class User: Codable {
    var firstName: String
    var lastName: String
    var role: String
    var image: String
    var isOnline: Bool
    var id: String
    
    init(firstName: String, lastName: String, role: String, image: String, isOnline: Bool) {
        self.firstName = firstName
        self.lastName = lastName
        self.role = role
        self.image = image
        self.isOnline = isOnline
        self.id = UUID().uuidString
    }
    
    var fullName: String {
        return firstName + " " + lastName
    }
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case role, image
        case isOnline = "is_online"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try container.decodeIfPresent(String.self, forKey: .firstName) ?? ""
        lastName = try container.decodeIfPresent(String.self, forKey: .lastName) ?? ""
        role = try container.decodeIfPresent(String.self, forKey: .role) ?? ""
        image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
        id = UUID().uuidString
        isOnline = try container.decodeIfPresent(Bool.self, forKey: .isOnline) ?? false
    }
}
