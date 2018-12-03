//
//  Person.swift
//  cornellcreatives
//
//  Created by Katherine Go on 11/26/18.
//  Copyright © 2018 Katherine Go. All rights reserved.
//

import Foundation

struct Person: Codable  {
    var id: String
    var name: String
    var skill: [String]
    
    init(id: String, name: String, skill: [String]) {
        self.id = id
        self.name = name
        self.skill = skill
    }
}

struct PersonResponse: Codable {
    var users: [Person]
}
