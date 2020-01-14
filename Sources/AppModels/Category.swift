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
    var id: Int?
    var name: String?
    
    init(name: String) {
        self.name = name
    }
}


extension Category: Content { }
extension Category: Migration { }
extension Category: Parameter { }

extension Category: PostgreSQLModel { }
