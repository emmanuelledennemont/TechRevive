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
        NavigationStack{
        List {
            Section(header: VStack(alignment: .leading) {
                Text("Mes Réparations à venir")
                    .font(.title2)
                    .foregroundColor(.black)
                    .textCase(.none)
                    .fontWeight(.bold)
                Spacer().frame(height: 10)
            }) {
                ForEach(scheduledRepairs) { productRepair in
                    NavigationLink(destination: ReparationViewDetails(productRepair:productRepair) ) {
                        ReparationListItemView(productRepair: productRepair, displayProblem: true)
                    }
                }
            }

            Section(header: VStack(alignment: .leading) {
                Text("Historique de Réparations")
                    .font(.title2)
                    .foregroundColor(.black)
                    .textCase(.none)
                    .fontWeight(.bold)
                Spacer().frame(height: 10)
            }) {
                ForEach(archivedRepairs) { productRepair in
                    NavigationLink(destination: ReparationViewDetails(productRepair:productRepair)) {
                        ReparationListItemView(productRepair: productRepair, displayProblem: true)
                    }
                }
            }
        }}
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
            ProductRepairs(productName: "LG InstaView Door-in-Door", modelName: "LMXS28596S", repairStatus: .readyToRepair, breakDownInfo: "Accumulation de Glace", idRepairMan: UUID(), reparingCategory: .bigElec, date: Date()),

            ProductRepairs(productName: "Angell Bike", modelName: "ANG123456789", repairStatus: .repared, breakDownInfo: "Problème de Batterie", idRepairMan: UUID(), reparingCategory: .mobility, date: Date())
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
