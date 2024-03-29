//
//  Award.swift
//  UltimatePortfolio
//
//  Created by Berkant Dursun on 29.12.20.
//

import Foundation

struct Award: Decodable, Identifiable {
    // swiftlint:disable:next identifier_name
    var id: String { name }
    let name: String
    let description: String
    let color: String
    let criterion: String
    let value: Int
    let image: String

    static let allAwards = Bundle.main.decode([Award].self, from: "Awards.json")
    static let example = allAwards[0]
}
