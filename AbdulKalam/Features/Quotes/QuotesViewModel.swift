//
//  QuotesViewModel.swift
//  InspireMe
//
//  Created by Sameer  on 04/09/25.
//

import SwiftUI

import SwiftUI

class QuotesViewModel: ObservableObject {
    @Published var quotes: [Quote] = []
    @Published var selectedIndex: Int = 0
    
    func fetchQuotes(for language: AppLanguage) {
        quotes = QuoteService.fetchQuotes(for: language)
        selectedIndex = quotes.isEmpty ? 0 : quotes.count / 2
    }
    
    var currentQuote: Quote? {
        guard !quotes.isEmpty else { return nil }
        return quotes[selectedIndex]
    }
    
    func nextQuote() {
        guard !quotes.isEmpty else { return }
        selectedIndex = (selectedIndex + 1) % quotes.count
    }
    
    func previousQuote() {
        guard !quotes.isEmpty else { return }
        selectedIndex = (selectedIndex - 1 + quotes.count) % quotes.count
    }
}
