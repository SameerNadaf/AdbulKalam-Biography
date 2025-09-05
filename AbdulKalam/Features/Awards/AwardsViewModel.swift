//
//  AwardsViewModel.swift
//  InspireMe
//
//  Created by Sameer  on 04/09/25.
//

import Foundation

class AwardsViewModel: ObservableObject {
    @Published var awards: [Award] = []

    init(language: AppLanguage = .english) {
        fetchAwards(for: language)
    }

    func fetchAwards(for language: AppLanguage) {
        self.awards = AwardsService.fetchAwards(for: language)
    }
    
}
