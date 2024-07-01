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
    @State var reparingStatusTemporary = RepairStatus.readyToRepair
    var body: some View {
        HStack(alignment: .top) {
            ComponentElementsTypeOfRepairmanC(
                imageName: productRepair.reparingCategory.imageName,
                background: false,
                repairStatus: reparingStatusTemporary
            )
            .padding(.horizontal, 2.0)

            VStack(alignment: .leading, spacing: 2) {
                Text(productRepair.productName)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text(productRepair.modelName)
                    .font(.callout)
                    .foregroundColor(.secondary)
                if displayProblem {
                    Text(productRepair.breakDownInfo)
                        .font(.subheadline)
                }

            }
        }
        .padding(.vertical, 8).task {
            if displayProblem == false {
                reparingStatusTemporary = .readyToRepair
            }
            else {
                reparingStatusTemporary = productRepair.repairStatus
            }
        }
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
