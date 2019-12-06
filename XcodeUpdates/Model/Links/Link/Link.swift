//
//  Link.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 19/11/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation

public struct Link: Codable {
    public let url: String
    
    private enum CodingKeys: String, CodingKey {
        case url
    }
}
