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
       ReparationView(user: userTest )
    }


}
