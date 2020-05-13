//
//  Event.swift
//  OpenEvents
//
//  Created by Open Reply on 13/05/2020.
//

import Foundation

struct Event {
    enum Status: String {
        case scheduled
        case running
        case completed
    }
    
    let name: String
    let date: Date
    let status: Status
    var isFavorite: Bool
}

// MARK - Decodable
extension Event.Status: Decodable { }

extension Event: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case date
        case status
        case isFavorite
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        date = try container.decode(Date.self, forKey: .date)
        status = try container.decodeIfPresent(Status.self, forKey: .status) ?? .scheduled
        isFavorite = try container.decodeIfPresent(Bool.self, forKey: .isFavorite) == true
    }
}

// MARK: - Comparable
extension Event: Comparable {
    static func < (lhs: Event, rhs: Event) -> Bool {
        lhs.date < rhs.date
    }
}
