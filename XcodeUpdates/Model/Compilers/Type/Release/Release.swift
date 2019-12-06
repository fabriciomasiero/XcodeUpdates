//
//  Release.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 19/11/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation

public struct Release: Codable {
    public let gm: Bool?
    public let beta: Int?
    public let gmSeed: Int?
    
    private enum CodingKeys: String, CodingKey {
        case gm
        case beta
        case gmSeed
    }
}
