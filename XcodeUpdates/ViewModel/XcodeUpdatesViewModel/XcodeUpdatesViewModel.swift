//
//  XcodeUpdatesViewModel.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 22/11/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import SwiftUI
import Combine

class XcodeUpdatesViewModel: ObservableObject, Identifiable {
    
    private let xcodeUpdatesFetcher: XcodeUpdatesFetcher
    private var disposables = Set<AnyCancellable>()
    
    @Published var ides: [IDE] = []
    
    init(xcodeUpdatesFetcher: XcodeUpdatesFetcher, scheduler: DispatchQueue = DispatchQueue(label: "XcodeUpdatesViewModel")) {
        self.xcodeUpdatesFetcher = xcodeUpdatesFetcher
        getXcodeUpdates()
    }
    func getXcodeUpdates() {
        xcodeUpdatesFetcher.getUpdates().map { response in
            self.ides = response
        }.receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { correctOne in
                switch correctOne {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("what")
                }
        }) { andHere in
            print("andHere")
        }.store(in: &disposables)
    }
}
