//
//  ReparationView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

import SwiftUI

struct ReparationView: View {
    let user : User
    
    var scheduledRepairs: [ProductRepairs] {
        user.repairlistScheduled.filter { $0.repairStatus != .repared }
    }
    
    var archivedRepairs: [ProductRepairs] {
        user.repairlistScheduled.filter { $0.repairStatus == .repared } + user.repairListArchive
    }
    
    var body: some View {
        List {
            Section(header: VStack(alignment: .leading) {
                Text("Mes Reparations à venir")
                    .font(.title2).foregroundStyle(.black).textCase(.none).fontWeight(.bold)
                Spacer().frame(height: 10)
            }) {
                ForEach(scheduledRepairs) { productRepair in
                    NavigationLink(destination: ReparationDetailView()) {
                        ReparationListItemView(productRepair: productRepair)
                    }
                }
            }
            
            Section(header: VStack(alignment: .leading) {
                Text("Historique de Réparations")
                    .font(.title2).foregroundStyle(.black).textCase(.none).fontWeight(.bold)
                Spacer().frame(height: 10)
            }) {
                ForEach(archivedRepairs) { productRepair in
                    NavigationLink(destination: ReparationDetailView()) {
                        ReparationListItemView(productRepair: productRepair)
                    }
                }
            }
        }
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
        ReparationView(user: User(name: "", repairlistScheduled: [
            ProductRepairs(productName: "LG InstaView Door-in-Door", modelName: "LMXS28596S", repairStatus: .readyToRepair, breakDownInfo: "Accumulation de Glace", idRepairMan: "hhfd", reparingCategory: .bigElec, date: Date()),
            
            ProductRepairs(productName: "Angell Bike", modelName: "ANG123456789", repairStatus: .repared, breakDownInfo: "Problème de Batterie", idRepairMan: "hhfd", reparingCategory: .mobility, date: Date())
        ], repairListArchive: [], co2Eco: 0.0, eurEco: 0.0, favReparmain: repairmenFav))
    }
}
struct ReparationDetailView: View {
    var body: some View {
        Text("Détails de la réparation")
            .font(.largeTitle)
            .padding()
    }
}
