//
//  Parsing.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 18/11/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, XcodeUpdatesError> {
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .secondsSince1970

  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
      .parsing(description: error.localizedDescription)
    }
    .eraseToAnyPublisher()
}


