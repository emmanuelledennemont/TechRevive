//
//  InfoRepairmainView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 25/06/2024.
//

import SwiftUI
import MapKit
struct InfoRepairmainView: View {
    let reparman : Repairman
    var body: some View {
        HStack {
            Image(systemName: reparman.reparingCategory.imageName)
            VStack{
                Text(reparman.name).font(.title2).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(reparman.reparingCategory.rawValue).font(.subheadline)

            }
        }
    }
}

#Preview {
    InfoRepairmainView(reparman: Repairman(name: "Réparateur 1", info: "Expert en gros électroménager", adress: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), phoneNumber: "0102030405", openingHours: "8h-18h", reparingCategory: .bigElec))
}
