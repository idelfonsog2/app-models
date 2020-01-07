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
    public var id: UUID?
    public var username: String
    
    public init(id: Int? = nil, username: String) {
        self.username = username
    }
}


extension User: Parameter { }
extension User: Content { }
extension User: Migration { }

extension User: PostgreSQLUUIDModel { }

//// customize the ID property database
//extension User: Model {
//    public typealias Database = PostgreSQLDatabase
//
//    public typealias ID = UUID
//
//    public static var idKey: IDKey = \User.id
//}

// FLuent[Provider] does the above for you by conforming your models to it

