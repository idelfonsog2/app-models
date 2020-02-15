//
//  File.swift
//  
//
//  Created by Idelfonso Gutierrez on 2/14/20.
//

import Foundation
import Vapor
import FluentPostgreSQL

public struct Airport: Codable {
    public var id: String?
    public var name: String
    public var iataCode: String
    public var gate: String
    public var terminal: String
    
    public var users: Children<Airport, User> {
        return children(\.aiportID)
    }
    
    public init(id: String? = nil, name: String, iataCode: String, gate: String, terminal: String) {
        self.id = id
        self.name = name
        self.iataCode = iataCode
        self.gate = gate
        self.terminal = terminal
    }
}

extension Airport: PostgreSQLStringModel { }
extension Airport: Content { }
extension Airport: Migration { }
extension Airport: Parameter { }
