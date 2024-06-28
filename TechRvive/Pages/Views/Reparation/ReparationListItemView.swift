//
//  ReparationListItemView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

import SwiftUI
import Foundation

struct ReparationListItemView: View {
    var productRepair: ProductRepairs

    var body: some View {
        HStack(alignment: .top) {
            ComponentElementsTypeOfReperman(imageName: productRepair.reparingCategory.imageName, background: false, color: true)

            .padding(.horizontal, 2.0)

            VStack(alignment: .leading, spacing: 2) {
                Text(productRepair.productName)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text(productRepair.modelName)
                    .font(.callout)
                    .foregroundColor(.secondary)
                Text(productRepair.breakDownInfo)
                    .font(.subheadline)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    NavigationView {
        ReparationListItemView(productRepair: ProductRepairs(
            productName: "LG InstaView Door-in-Door",
            modelName: "LMXS28596S",
            repairStatus: .repared,
            breakDownInfo: "Accumulation de Glace",
            idRepairMan: "hhfd",
            reparingCategory: .bigElec,
            date: Date()
        ))
    }
}
