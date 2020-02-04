//
//  IDEView.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 04/02/20.
//  Copyright © 2020 Fabrício Masiero. All rights reserved.
//

import SwiftUI

struct IDEView: View {
    
    @ObservedObject var viewModel: IDEViewModel
    
    var body: some View {
        
        Text(viewModel.ide.name).navigationBarTitle(viewModel.ide.name)
    }
}


