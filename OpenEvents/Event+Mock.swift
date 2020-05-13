//
//  Event+Mock.swift
//  OpenEvents
//
//  Created by Open Reply on 13/05/2020.
//

import Foundation

extension Event {
    static let mock: [Event] = [
        Event(
            name: "WWDC",
            date: Date(timeIntervalSince1970: 1592848800000),
            status: .scheduled,
            isFavorite: true),
        Event(
            name: "Umbria Jazz",
            date: Date(timeIntervalSince1970: 1594371600000),
            status: .scheduled,
            isFavorite: false),
        Event(
            name: "Covid-19",
            date: Date(timeIntervalSince1970: 1573989840000),
            status: .running,
            isFavorite: false),
        Event(
            name: "Notte della Taranta",
            date: Date(timeIntervalSince1970: 1596272400000),
            status: .scheduled,
            isFavorite: false),
        Event(
            name: "Fashion Week, Milano",
            date: Date(timeIntervalSince1970: 1578560400000),
            status: .completed,
            isFavorite: false)
    ]
}
