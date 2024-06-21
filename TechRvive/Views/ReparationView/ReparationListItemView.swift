//
//  ReparationListItemView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

import Foundation
import SwiftUI

struct ReparationListItemView: View {
    var productRepair : ProductRepairs
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: productRepair.reparingCategory.imageName).font(.system(size: 45))
                .foregroundColor(.orange)

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
        .listRowBackground(Color.green)
    };
}


#Preview {
    NavigationView {
        ReparationListItemView(productRepair: ProductRepairs(productName: "LG InstaView Door-in-Door", modelName: "LMXS28596S", breakDownInfo: "Accumulation de Glace", idRepairMan: "hhfd", reparingCategory: .bigElec))
    }
}
