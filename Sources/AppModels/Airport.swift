//
//  File.swift
//  
//
//  Created by Idelfonso Gutierrez on 2/14/20.
//

import Foundation
import Vapor
import FluentPostgreSQL

public final class Airport: Codable {
    public var id: String?
    public var name: String
    
    public init(id: String? = nil, name: String) {
        self.id = id
        self.name = name
    }
}

extension Airport: PostgreSQLStringModel { }
extension Airport: Content { }
extension Airport: Migration { }
extension Airport: Parameter { }

public extension Airport {
    var users: Children<Airport, User> {
        return children(\.aiportID)
    }
}
