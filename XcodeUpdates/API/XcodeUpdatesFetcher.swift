//
//  XcodeUpdatesFetcher.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 18/11/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation
import Combine

protocol XcodeUpdatesFeatchable {
    func getUpdates() -> AnyPublisher<[IDE], XcodeUpdatesError>
}

class XcodeUpdatesFetcher {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension XcodeUpdatesFetcher: XcodeUpdatesFeatchable {
    func getUpdates() -> AnyPublisher<[IDE], XcodeUpdatesError> {
        return IDEUpdates(urlRequest: xcodeReleasesURL())
    }
    
    private func IDEUpdates<T>(urlRequest: URLRequest?) -> AnyPublisher<T, XcodeUpdatesError> where T : Decodable {
        guard let urlRequest = urlRequest else {
            let error = XcodeUpdatesError.intern(description: "Couldnt create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: urlRequest).mapError { error in
            .network(description: error.localizedDescription)
        }.flatMap(maxPublishers: .max(1)) { pair in
            decode(pair.data)
        }.eraseToAnyPublisher()
    }
    
    func xcodeReleasesURL() -> URLRequest? {
        guard let url = URL(string: "https://xcodereleases.com/api/all.json") else {
            return nil
        }
      return URLRequest(url: url)
    }
}
