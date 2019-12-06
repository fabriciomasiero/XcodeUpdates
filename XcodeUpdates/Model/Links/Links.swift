//
//  Links.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 19/11/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation

public struct Links: Codable {
    public let notes: Link?
    public let download: Link?
    
    private enum CodingKeys: String, CodingKey {
        case notes
        case download
    }
}
