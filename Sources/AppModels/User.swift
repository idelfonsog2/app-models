//
//  File.swift
//  
//
//  Created by idelfonso Gutierrez on 12/31/19.
//

import Foundation
import Vapor
import FluentPostgreSQL

public final class User: Codable {
    public var id: Int?
    public var username: String
    public var gate: String
    public var terminal: String
    public var deviceToken: Data?
    public var aiportID: Airport.ID
    
    // Initializers
    public init(id: Int? = nil, username: String, gate: String, terminal: String, aiportID: Airport.ID, deviceToken: Data? = nil) {
        self.username = username
        self.gate = gate
        self.terminal = terminal
        self.deviceToken = deviceToken
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
