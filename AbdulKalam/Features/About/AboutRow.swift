//
//  AboutRow.swift
//  InspireMe
//
//  Created by Sameer  on 04/09/25.
//

import SwiftUI

struct AboutRow: View {
    let icon: String
    let iconColor: Color
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(iconColor)
                .padding(.trailing)
            
            Text(text)
                .font(.headline)
        }
        .padding(.horizontal)
    }
}

#Preview {
    AboutRow(icon: "telephone", iconColor: .orange, text: "Sam")
}
