//
//  XcodeUpdatesError.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 18/11/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation

enum XcodeUpdatesError: Error {
    case parsing(description: String)
    case network(description: String)
    case intern(description: String)
}
