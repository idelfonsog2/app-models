//
//  File.swift
//  
//
//  Created by Idelfonso Gutierrez on 1/13/20.
//

import Foundation
import Vapor
import FluentPostgreSQL

/// design to stablish Many to many relationship
public final class Category: Codable {
    public var id: Int?
    public var name: String?
    
    public init(name: String) {
        self.name = name
    }
}


extension Category: Content { }
extension Category: Migration { }
extension Category: Parameter { }

extension Category: PostgreSQLModel { }
