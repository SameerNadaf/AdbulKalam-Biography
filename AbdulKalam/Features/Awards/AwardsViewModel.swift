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

    /// Fetch awards based on selected language
    func fetchAwards(for language: AppLanguage) {
        self.awards = AwardsService.fetchAwards(for: language)
    }

    /// Optional: sorted awards by year descending
    var recentAwards: [Award] {
        awards.sorted { $0.year > $1.year }
    }
}
