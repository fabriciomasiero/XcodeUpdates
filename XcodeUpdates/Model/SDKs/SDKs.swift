//
//  SDKs.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 19/11/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation

public struct SDKs: Codable {
    public let macOS: [Version]?
    public let tvOS: [Version]?
    public let iOS: [Version]?
    public let iPadOS: [Version]?
    public let watchOS: [Version]?
    
    private enum CodingKeys: String, CodingKey {
        case macOS
        case tvOS
        case iOS
        case iPadOS
        case watchOS
    }
}
