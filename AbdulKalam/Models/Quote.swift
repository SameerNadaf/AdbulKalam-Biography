//
//  Quote.swift
//  InspireMe
//
//  Created by Sameer  on 03/09/25.
//

import Foundation

struct Quote: Codable, Equatable {
    let id: Int
    let content: String
    let author: String
}
