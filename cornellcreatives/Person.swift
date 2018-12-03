//
//  Person.swift
//  cornellcreatives
//
//  Created by Katherine Go on 11/26/18.
//  Copyright © 2018 Katherine Go. All rights reserved.
//

import Foundation

struct Person: Codable  {
    var netid: String
    var name: String
    var services: [String]
    
    init(netid: String, name: String, services: [String]) {
        self.netid = netid
        self.name = name
        self.services = services
    }
}

struct PersonResponse: Codable {
    var users: [Person]
}
