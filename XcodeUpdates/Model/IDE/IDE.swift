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
    public let date: ReleaseDate
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

extension IDE {
    public func standardName() -> String {
        if let beta = version.release?.beta {
            return name + " Beta \(String(describing: beta))"
        }
        if let _ = version.release?.gm {
            return name + " GM"
        }
        if let gmSeed = version.release?.gmSeed {
            return name + " GM Seed \(String(describing: gmSeed))"
        }
        return name + " " + (version.number ?? "")
    }
    public func fullName() -> String {
        let nameVersion = name + " " + (version.number ?? "") + " "
        if let beta = version.release?.beta {
            return nameVersion + " Beta \(String(describing: beta))"
        }
        if let _ = version.release?.gm {
            return nameVersion + " GM"
        }
        if let gmSeed = version.release?.gmSeed {
            return nameVersion + " GM Seed \(String(describing: gmSeed))"
        }
        return nameVersion
    }
    func image() -> String {
        if version.release?.beta != nil {
            return "xcode-beta"
        }
        return "xcode"
    }
    func releaseDate() -> String {
        let dateComponents = DateComponents(year: date.year, month: date.month, day: date.day)
        let calendar = Calendar.current
        if let date = calendar.date(from: dateComponents) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
            return dateFormatter.string(from: date)
        }
        return ""
    }
}
