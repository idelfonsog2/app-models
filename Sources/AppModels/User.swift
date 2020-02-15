//
//  File.swift
//  
//
//  Created by idelfonso Gutierrez on 12/31/19.
//

import Foundation
import Vapor
import FluentPostgreSQL

public struct User: Codable {
    public var id: Int?
    public var username: String
    public var aiportID: Airport.ID
    
    // Initializers
    public init(id: Int? = nil, username: String, aiportID: Airport.ID) {
        self.username = username
        self.aiportID = aiportID
    }
}


extension User: Parameter { }
extension User: Content { }
extension User: PostgreSQLModel { }

extension User: Migration {
    public static func prepare(on connection: PostgreSQLConnection) -> Future<Void> {
        return Database.create(self, on: connection) { (builder) in
            try addProperties(to: builder)
            builder.reference(from: \.aiportID, to: \Airport.id) // this setup the FK between the two tables
        }
    }
}

public extension User {
    var todos: Children<User, Todo> {
        return self.children(\.userID)
    }
    
    var airport: Parent<User, Airport> {
        return parent(\.aiportID)
    }
}
