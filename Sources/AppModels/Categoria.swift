//
//  File.swift
//  
//
//  Created by Idelfonso Gutierrez on 1/13/20.
//

import Vapor
import FluentPostgreSQL

/// design to stablish Many to many relationship
public struct Categoria: Codable {
    public var id: Int?
    public var name: String
    
    public init(name: String) {
        self.name = name
    }
}


extension Categoria: Content { }
extension Categoria: Migration { }
extension Categoria: Parameter { }

extension Categoria: PostgreSQLModel { }
