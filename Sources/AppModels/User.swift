//
//  File.swift
//  
//
//  Created by idelfonso Gutierrez on 12/31/19.
//

import FluentPostgreSQL
import Vapor
import Foundation

public struct User: Codable {
    public var id: Int?
    public var username: String
    public var aiportID: Airport.ID
    
    public init(id: Int? = nil, username: String, aiportID: Airport.ID) {
        self.username = username
        self.aiportID = aiportID
    }
}


extension User: Parameter { }
extension User: Content { }
extension User: Migration { }

extension User: PostgreSQLModel { }

public extension User {
     var todos: Children<User, Todo> {
        return children(\.userID)
    }
    
    var airport: Parent<User, Airport> {
        return parent(\.aiportID)
    }
}


