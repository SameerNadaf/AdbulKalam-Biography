//
//  QuotesViewModel.swift
//  InspireMe
//
//  Created by Sameer  on 04/09/25.
//

import SwiftUI

class QuotesViewModel: ObservableObject {
    @Published var quotes: [Quote] = []
    @Published var selectedIndex: Int = 0
    
    func fetchQuotes(for language: AppLanguage) {
        let currentQuoteID = quotes.indices.contains(selectedIndex) ? quotes[selectedIndex].id : nil
        
        quotes = QuoteService.fetchQuotes(for: language)
        
        if let id = currentQuoteID,
            let newIndex = quotes.firstIndex(where: { $0.id == id }) {
            selectedIndex = newIndex
        } else {
            selectedIndex = 0
        }
    }
    
    var currentQuote: Quote? {
        guard !quotes.isEmpty else { return nil }
        return quotes.first { $0.id == selectedIndex }
    }
}
