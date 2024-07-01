//
//  ReparationView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

import SwiftUI

struct ReparationView: View {
    @EnvironmentObject var user : User

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
        ReparationView()
    }
}
struct ReparationDetailView: View {
    var body: some View {
        Text("Détails de la réparation")
            .font(.largeTitle)
            .padding()
    }
}
