//
//  File.swift
//  
//
//  Created by idelfonso Gutierrez on 12/31/19.
//

import FluentPostgreSQL
import Vapor
import Foundation

public final class DeviceToken: Codable {
    public var id: Int?
    public var token: Data
    
    public init(id: Int? = nil, token: Data, platform: String) {
        self.id = id
        self.token = token
    }
}

extension DeviceToken: Content { }
extension DeviceToken: Migration { }
extension DeviceToken: Parameter { }

extension DeviceToken: PostgreSQLModel { }

