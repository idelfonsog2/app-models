//
//  File.swift
//  
//
//  Created by Idelfonso Gutierrez on 1/9/20.
//

import Foundation
import CoreLocation

public final class Airport: Codable {
    public var id: Int?
    public var name: Data
    public var iataCode: String
    public var location: Location
    
    public init(id: Int? = nil, token: Data, platform: String) {
        self.id = id
        self.token = token
    }
}
