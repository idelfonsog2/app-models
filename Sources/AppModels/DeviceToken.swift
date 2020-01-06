//
//  File.swift
//  
//
//  Created by idelfonso Gutierrez on 12/31/19.
//

import Fluent
import Vapor
import Foundation

public final class DeviceToken: Codable {
    public var id: Int?
    public var token: Data
    public var platform: String
    
    public init(id: Int? = nil, token: Data, platform: String) {
        self.id = id
        self.token = token
        self.platform = platform
    }
}

extension DeviceToken: Content { }
