//
//  QuoteCardView.swift
//  InspireMe
//
//  Created by Sameer  on 03/09/25.
//

import SwiftUI

struct QuoteCardView: View {
    
    let quote: Quote
    
    var body: some View {
        ZStack {
            Image("image")
                .resizable()
                .scaledToFit()
                .frame(height: UIScreen.main.bounds.height / 2)
                .clipped()
                .opacity(0.8)
                .overlay(Color.black.opacity(0.3))
                .cornerRadius(16)
            
            VStack(spacing: 12) {
                Text("“\(quote.content)”")
                    .font(.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text("- \(quote.author)")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 10)
        .padding(.horizontal)
    }
}

#Preview {
    let quote = Quote(id: 1, content: "Lorem ipsum dolor sit amet consectetur adipisicing elit.", author: "John Doe")
    QuoteCardView(quote: quote)
}
