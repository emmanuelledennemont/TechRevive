//
//  AppointmentView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 27/06/2024.
//

import SwiftUI

struct AppointmentView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var user : User

    let reparman : Repairman
    @ObservedObject var infoRepair = ProductRepairs()

    @Binding var showConfirmation : Bool

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
                                TextField("Nom votre appareil ", text: $infoRepair.productName).onSubmit {
                                    infoRepair.fliedFunc()
                                }
                            }
                        HStack{
                            Text("Modèle: ")
                            TextField("Modèle de votre appareil ", text: $infoRepair.modelName)
                        }

                            HStack{
                                Text("Description:")

                                TextField("Description de la panne", text: $infoRepair.breakDownInfo).onSubmit {
                                    infoRepair.fliedFunc()
                                }
                            }



                    }
                    Section ("Categories") {
                        HStack {
                            ForEach(categories) { category in
                                CategoryButton(category: category, selectedCategory: $infoRepair.reparingCategory)
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
                        DatePickerView(selectedDate: $infoRepair.date)

                    }
                    Section {
                        
                            CustomButton(title: "Confirmer", action: {

                                infoRepair.idRepairMan = reparman.id
                                user.repairlistScheduled.append(infoRepair)

                                showConfirmation.toggle()
                                dismiss()

                            }, isFilled: true).disabled(!infoRepair.isValid)


                        CustomButton(title: "Annuler", action: {
                            dismiss()
                            //Annuler : réinitialiser la date à sa valeur d'origine
                         //   selectedDate = originalDate
                        }, isFilled: false)


                        




                    }
                    Section{

                        // Réduire le padding en haut du bouton


                    }



                }).navigationTitle("Prise de RDV")



            }


        }

    }


#Preview {
    NavigationStack {
        AppointmentView(user: .constant(userTest), reparman: parisRepairmen.repairmenListe[0], showConfirmation:.constant(false))
    }

}
