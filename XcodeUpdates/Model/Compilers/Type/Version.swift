//
//  Clang.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 19/11/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation

public struct Version: Codable {
    public let number: String?
    public let build: String?
    public let release: Release?
    
    private enum CodingKeys: String, CodingKey {
        case number
        case build
        case release
    }
}
