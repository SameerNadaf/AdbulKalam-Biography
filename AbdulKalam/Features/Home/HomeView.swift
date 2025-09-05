//
//  HomeView.swift
//  InspireMe
//
//  Created by Sameer  on 03/09/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            Tab("Quotes", systemImage: "quote.bubble") {
                QuotesView()    
            }
            Tab("Awards", systemImage: "medal") {
                AwardsView()
            }
            Tab("Biography", systemImage: "person") {
                BiographyView()
            }
            Tab("Info", systemImage: "info.bubble") {
                AboutView()
            }
        }
    }
}

#Preview {
    HomeView()
}
