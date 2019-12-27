//
//  InfoResponse.swift
//  App
//
//  Created by idelfonso Gutierrez on 12/26/19.
//

import Vapor

public struct InfoResponse: Content {
    var request: InfoData
    
    public init(request: InfoData) {
        self.request = request
    }
}
