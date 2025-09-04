//
//  BiographyView.swift
//  InspireMe
//
//  Created by Sameer  on 04/09/25.
//

import SwiftUI

struct BiographyView: View {
    @AppStorage("selectedLanguage") private var selectedLanguage: String = AppLanguage.english.rawValue
    @StateObject private var viewModel = BiographyViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    // Image
                    Image(viewModel.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .clipped()
                        .cornerRadius(16)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                    
                    // Name & Title
                    VStack(alignment: .leading, spacing: 4) {
                        Text(viewModel.name)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(viewModel.title)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                    
                    // Facts
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(viewModel.facts, id: \.self) { fact in
                            Text(fact)
                        }
                    }
                    .padding(.horizontal)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    
                    // Biography
                    VStack(alignment: .leading, spacing: 8) {
                        Text(selectedLanguage == AppLanguage.english.rawValue ? "Biography" : "जीवनी")
                            .font(.headline)
                            .padding(.bottom, 4)
                        
                        Text(viewModel.biography)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.primary)
                        
                        Link(destination: viewModel.wikipediaURL) {
                            Label(
                                selectedLanguage == AppLanguage.english.rawValue
                                ? "Read more on Wikipedia"
                                : "विकिपीडिया पर और पढ़ें",
                                systemImage: "safari"
                            )
                            .font(.subheadline)
                            .foregroundColor(.blue)
                        }
                        .padding(.top, 5)
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
        }
        .onAppear {
            viewModel.language = AppLanguage(rawValue: selectedLanguage) ?? .english
        }
        .onChange(of: selectedLanguage) { oldLang, newLang in
            viewModel.language = AppLanguage(rawValue: newLang) ?? .english
        }
    }
}

#Preview {
    BiographyView()
}
