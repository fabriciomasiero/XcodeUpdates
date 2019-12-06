//
//  Compilers.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 19/11/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation

public struct Compilers: Codable {
    public let clang: [Version]?
    public let swift: [Version]?
    
    private enum CodingKeys: String, CodingKey {
        case clang
        case swift
    }
}
