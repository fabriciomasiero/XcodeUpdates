//
//  IDEViewModel.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 04/02/20.
//  Copyright © 2020 Fabrício Masiero. All rights reserved.
//

import Foundation
import Combine

public class IDEViewModel: ObservableObject {
    
    let ide: IDE
    
    init(ide: IDE, scheduler: DispatchQueue = DispatchQueue(label: "XcodeUpdatesViewModel")) {
        self.ide = ide
    }
}
