//
//  Award.swift
//  InspireMe
//
//  Created by Sameer  on 04/09/25.
//

import Foundation

struct Award: Identifiable, Codable {
    let id: Int
    let year: String
    let title: String
    let organization: String
}
