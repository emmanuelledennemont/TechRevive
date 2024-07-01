//
//  ProgressionView.swift
//  TechReviveV1
//
//  Created by Cristina Casañas on 28/6/24.
//

import SwiftUI

struct ProgressionView: View {
    @Binding var status: RepairStatus

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading) {
                Text("Pourcentage")
                    .font(.subheadline)
                Text("\(Int(progressAmount * 100))%")
                    .font(.title)
                    .foregroundColor(Color.orange)
            }
            .padding(.bottom)

            VStack(alignment: .leading) {
                Text("Status")
                    .font(.subheadline)
                Text(status.status)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.bottom)

            VStack(alignment: .leading) {
                Text("Panne")
                    .font(.subheadline)
                Text("Accumulation Glace")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }

    private var progressAmount: CGFloat {
        switch status {
        case .readyToRepair:
            return 0.0
        case .repairing:
            return 0.60
        case .repared:
            return 1.0
        }
    }
}


