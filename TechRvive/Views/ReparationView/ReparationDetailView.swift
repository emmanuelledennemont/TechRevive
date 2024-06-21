//
//  ReparationDetailView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

import Foundation
import SwiftUI

struct ReparationDetailView: View {
    var body: some View {
        VStack {
            Text("Détails de la réparation")
                .font(.title)
                .padding()

            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)

    }
}

#Preview {
    NavigationView {
        ReparationDetailView()
    }
}
