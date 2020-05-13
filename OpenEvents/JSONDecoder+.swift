//
//  JSONDecoder+.swift
//  OpenEvents
//
//  Created by Open Reply on 13/05/2020.
//

import Foundation

extension JSONDecoder {
    static let dateDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        return decoder
    }()
}
