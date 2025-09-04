//
//  AwardsService.swift
//  InspireMe
//
//  Created by Sameer  on 04/09/25.
//

import Foundation

struct AwardsService {
    static func fetchAwards(for language: AppLanguage) -> [Award] {
        let filename = language == .english ? "awards_en" : "awards_hi"
        
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let awards = try? JSONDecoder().decode([Award].self, from: data) else {
            return []
        }
        
        return awards.sorted { $0.year > $1.year }
    }
}
