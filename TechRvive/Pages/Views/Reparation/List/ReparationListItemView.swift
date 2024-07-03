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
    var displayProblem : Bool


    var body: some View {
        HStack(alignment: .top) {
            ComponentElementsTypeOfRepairmanC(
                imageName: productRepair.reparingCategory.imageName,
                background: false,
                repairStatus: productRepair.repairStatus, isdetail: displayProblem
            )
            .padding(.horizontal, 2.0)

            VStack(alignment: .leading, spacing: 2) {
                Text(productRepair.productName)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text(productRepair.modelName)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                if displayProblem {
                    Text(productRepair.breakDownInfo)
                        .font(.footnote)
                }

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
            idRepairMan: UUID(),
            reparingCategory: .bigElec,
            date: Date()
        ), displayProblem: true)
    }
}
