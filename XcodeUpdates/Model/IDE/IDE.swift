//
//  Xcode.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 19/11/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation

public struct IDE: Codable, Identifiable {
    
    public var id = UUID()
    public let compilers: Compilers?
    public let requires: String
    public let date: Date
    public let links: Links?
    public let version: Version
    public let sdks: SDKs?
    public let name: String
    
    private enum CodingKeys: String, CodingKey {
        case compilers
        case requires
        case date
        case links
        case version
        case sdks
        case name
    }
}
