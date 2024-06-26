//
//  ReparationView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

import SwiftUI





struct ReparationView: View {
    let user : User
    var body: some View {
        List {

            ForEach(user.repairlistScheduled) { productRepair in
                NavigationLink(destination: ReparationDetailView()) {
                    ReparationListItemView(productRepair: productRepair)

                }
            }
                 }

        .navigationTitle("Mes Réparations")
    }
}




//#if DEBUG
//struct ReparationView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReparationView()
//    }
//}
//#endif

#Preview {
    NavigationView {
        ReparationView(user: User(name: "", repairlistScheduled: [ProductRepairs(productName: "LG InstaView Door-in-Door", modelName: "LMXS28596S", breakDownInfo: "Accumulation de Glace", idRepairMan: "hhfd", reparingCategory: .bigElec),ProductRepairs(productName: "Angell Bike", modelName: "ANG123456789", breakDownInfo: "Problème de Batterie", idRepairMan: "hhfd", reparingCategory: .mobility)], repairListArchive: [], co2Eco: 0.0, eurEco: 0.0, favReparmain: []) )
    }


}
