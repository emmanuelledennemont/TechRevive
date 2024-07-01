//
//  DescriptionCardComponent.swift
//  TechReviveV1
//
//  Created by Cristina Casañas on 28/6/24.
//

import SwiftUI

struct DescriptionCard: View {
    
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(text)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
        }
    }
}

#Preview {
    DescriptionCard(text: "Accumulation de glace due à un joint de porte défectueux ou un système de dégivrage en panne, nécessite réparation.")
}
