//
//  AwardsView.swift
//  InspireMe
//
//  Created by Sameer  on 04/09/25.
//

import SwiftUI

struct AwardsView: View {
    @StateObject private var viewModel = AwardsViewModel()
    @AppStorage("selectedLanguage") private var selectedLanguage: String = AppLanguage.english.rawValue
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    // Header Row
                    HStack {
                        Text(selectedLanguage == AppLanguage.english.rawValue ? "Year" : "वर्ष")
                            .bold()
                            .frame(width: 60, alignment: .leading)
                        
                        Divider()
                        
                        Text(selectedLanguage == AppLanguage.english.rawValue ? "Award" : "पुरस्कार")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Divider()
                        
                        Text(selectedLanguage == AppLanguage.english.rawValue ? "Organization" : "संस्थान")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .foregroundStyle(.red)
                    .padding(.vertical)
                    
                    Divider()
                    
                    // Data Rows
                    ForEach(viewModel.awards) { award in
                        HStack(alignment: .top) {
                            Text(award.year).frame(width: 60, alignment: .leading)
                            Divider()
                            Text(award.title).frame(maxWidth: .infinity, alignment: .leading)
                            Divider()
                            Text(award.organization).frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.vertical, 8)
                        Divider()
                    }
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Awards & Honours")
            .navigationBarTitleDisplayMode(.inline)
            
            .onAppear {
                if let lang = AppLanguage(rawValue: selectedLanguage) {
                    viewModel.fetchAwards(for: lang)
                }
            }
            .onChange(of: selectedLanguage) { oldLan, newLang in
                if let lang = AppLanguage(rawValue: newLang) {
                    viewModel.fetchAwards(for: lang)
                }
            }
        }
    }
}


#Preview {
    AwardsView()
}
