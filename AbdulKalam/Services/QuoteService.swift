//
//  QuoteService.swift
//  InspireMe
//
//  Created by Sameer  on 03/09/25.
//

import Foundation

//final class QuoteService {
//    
//    static func fetchQuotes() -> [Quote] {
//        guard let url = Bundle.main.url(forResource: "quotes", withExtension: "json"),
//              let data = try? Data(contentsOf: url),
//              let quotes = try? JSONDecoder().decode([Quote].self, from: data) else {
//            return []
//        }
//        return quotes
//    }
//}

final class QuoteService {
    
    static func fetchQuotes(for language: AppLanguage) -> [Quote] {
        let fileName = language == .english ? "quotes_en" : "quotes_hi"
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("JSON file not found: \(fileName).json")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let quotes = try JSONDecoder().decode([Quote].self, from: data)
            return quotes
        } catch {
            print("Error decoding quotes: \(error)")
            return []
        }
    }
}
