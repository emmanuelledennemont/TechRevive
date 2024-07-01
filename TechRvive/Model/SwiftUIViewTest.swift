//
//  SwiftUIViewTest.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 26/06/2024.
//

import SwiftUI
import MapKit

struct SwiftUIViewTest: View {
    var repairman : Repairman
    @State var ispresented = false

    var body: some View {
        HStack {
            ForEach(ReparingCategory.allCases, id: \.rawValue ) { raw in 
                ComponentElementsTypeOfReperman(imageName: raw.imageName, background: true, color: false)

            }
        }


    }
}

#Preview {
    SwiftUIViewTest(repairman: Repairman(image: "reparateur1", name: "Ryad", info: "Tout type de réparation", adress: CLLocationCoordinate2D(latitude: 47.90232, longitude: -3.390290), phoneNumber: "0823942834", openingHours: "6-19h", reparingCategory: .mobility))
}

