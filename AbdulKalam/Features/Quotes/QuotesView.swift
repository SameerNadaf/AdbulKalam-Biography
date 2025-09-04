//
//  QuotesView.swift
//  InspireMe
//
//  Created by Sameer  on 03/09/25.
//

import SwiftUI

enum AppLanguage: String, CaseIterable {
    case english = "en"
    case hindi = "hi"
    
    var displayName: String {
        switch self {
        case .english: return "English"
        case .hindi: return "हिंदी"
        }
    }
}

struct QuotesView: View {
    @StateObject private var viewModel = QuotesViewModel()
    @State private var isSharePresented: Bool = false
    @AppStorage("selectedLanguage") private var selectedLanguage: String = AppLanguage.english.rawValue

    var body: some View {
        NavigationView {
            TabView(selection: $viewModel.selectedIndex) {
                ForEach(viewModel.quotes, id: \.id) { quote in
                    QuoteCardView(quote: quote)
                        .scaleEffect(viewModel.selectedIndex == quote.id ? 1.0 : 0.95)
                        .animation(.easeInOut, value: viewModel.selectedIndex)
                        .tag(quote.id)
                }
            }
            .frame(height: UIScreen.main.bounds.height/2)
            .tabViewStyle(.page)
            
            .navigationTitle("Quotes")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu {
                        ForEach(AppLanguage.allCases, id: \.self) { lang in
                            Button(lang.displayName) {
                                selectedLanguage = lang.rawValue
                            }
                        }
                    } label: {
                        Text(AppLanguage(rawValue: selectedLanguage)?.displayName ?? "English")
                            .font(.subheadline)
                            .frame(width: 80, alignment: .leading)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSharePresented.toggle()
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
            
            .popover(isPresented: $isSharePresented) {
                if let currentQuote = viewModel.currentQuote {
                    ShareSheet(items: ["\"\(currentQuote.content)\" — \(currentQuote.author)"])
                        .presentationDetents([.medium, .large])
                }
            }
        }
        // Reload quotes whenever the selected language changes
        .onChange(of: selectedLanguage) {oldvalue, newValue in
            if let lang = AppLanguage(rawValue: newValue) {
                viewModel.fetchQuotes(for: lang)
            }
        }
        // Load quotes initially
        .onAppear {
            if let lang = AppLanguage(rawValue: selectedLanguage) {
                viewModel.fetchQuotes(for: lang)
            }
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    var items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

#Preview {
    QuotesView()
}
