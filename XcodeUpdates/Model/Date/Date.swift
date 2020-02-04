//
//  Date.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 19/11/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation

public struct ReleaseDate: Codable {
    public let year: Int
    public let month: Int
    public let day: Int
    
    private enum CodingKeys: String, CodingKey {
        case year
        case month
        case day
    }
}
