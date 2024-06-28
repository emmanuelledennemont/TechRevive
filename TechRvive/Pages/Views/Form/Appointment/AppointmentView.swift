//
//  AppointmentView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 27/06/2024.
//

import SwiftUI

struct AppointmentView: View {
    let reparman : Repairman
    @State var infoRepair = ProductRepairs()
    @State private var selectedCategory = ReparingCategory.bigElec

    let categories = ReparingCategory.allCases



    var body: some View {

        Group {
            Form(content: {
                Section{
                    HStack {
                        ComponentElementsTypeOfReperman(imageName: reparman.reparingCategory.imageName, background: false, color: true)

                        VStack(alignment: .leading  ){
                            Text(reparman.name).font(.title3).fontWeight(.bold)
                            Text(reparman.reparingCategory.rawValue).font(.caption).foregroundStyle(.gray)
                        }.padding(.horizontal)
                    }
                }
                Section("Votre Appareil") {

                        HStack{
                            Text("Appareil: ")
                            TextField("Nom votre appareil ", text: $infoRepair.productName)
                        }

                        HStack{
                            Text("Description:")

                            TextField("Description de la panne", text: $infoRepair.breakDownInfo)
                        }



                }
                Section ("Categories") {
                    HStack {
                        ForEach(categories) { category in
                            CategoryButton(category: category, selectedCategory: $selectedCategory)
                        }
                    }
                }
                Section("Vos information ") {
                    HStack{
                        Text("Nom:")
                        TextField("Description de la panne", text: $infoRepair.productName)
                    }
                }
                Section("Choisir votre date") {
                    DatePickerView(selectedCategory: selectedCategory, infoRepair: $infoRepair)
                }



            }).navigationTitle("Prise de RDV")
        }

    }
}

#Preview {
    NavigationStack {
        AppointmentView(reparman: parisRepairmen.repairmenListe[0])
    }

}
