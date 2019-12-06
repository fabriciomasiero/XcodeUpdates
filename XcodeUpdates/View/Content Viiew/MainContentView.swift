//
//  MainContentView.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 15/11/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import SwiftUI

struct MainContentView: View {
    
    @ObservedObject var viewModel: XcodeUpdatesViewModel
    
    init(viewModel: XcodeUpdatesViewModel) {
      self.viewModel = viewModel
    }
    
    var body: some View {
        
        NavigationView {
            
            List(viewModel.ides, id: \.id) { ide in
                XcodeUpdatesListView(ide: ide)
            }
            .navigationBarTitle("Xcode Updates")
        }
        
    }
}

#if DEBUG
struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView(viewModel: XcodeUpdatesViewModel(xcodeUpdatesFetcher: XcodeUpdatesFetcher(session: URLSession(configuration: URLSessionConfiguration.background(withIdentifier: "com.example.DownloadTaskExample.background"), delegate: nil, delegateQueue: OperationQueue()))))
    }
}
#endif

