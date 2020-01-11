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
    public var name: String
    public var iataCode: String
    public var gate: String
    public var terminal: String
    
    public init(id: Int? = nil, name: String, iataCode: String, gate: String, terminal: String) {
        self.id = id
        self.name = name
        self.iataCode = iataCode
        self.gate = gate
        self.terminal = terminal
    }
}
