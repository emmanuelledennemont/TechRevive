//
//  AppointmentView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 27/06/2024.
//

import SwiftUI

struct AppointmentView: View {
    @EnvironmentObject var user : User
    @Environment(\.dismiss) var dismiss
   

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
                                TextField("Nom votre appareil ", text: $infoRepair.productName)

                            }
                        HStack{
                            Text("Modèle: ")
                            TextField("Modèle de votre appareil ", text: $infoRepair.modelName)
                        }

                            HStack{
                                Text("Description:")

                                TextField("Description de la panne", text: $infoRepair.breakDownInfo)
                            }



                    }
                    Section ("Categories") {
                        HStack (spacing : 15) {
                            ForEach(categories) { category in
                                CategoryButton(category: category, selectedCategory: $infoRepair.reparingCategory)
                            }
                        }
                    }
                    Section("Vos information ") {
                        ProfilComponent()
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

                            }, isFilled: infoRepair.isValid).disabled(!infoRepair.isValid)
                        if !infoRepair.isValid {
                            Text("Merci de remplir les champs Appareil et description ").font(.caption).foregroundStyle(.red)
                        }

                        CustomButton(title: "Annuler", action: {
                            dismiss()
                            //Annuler : réinitialiser la date à sa valeur d'origine
                         //   selectedDate = originalDate
                        }, isFilled: true)


                        




                    }



                }).onChange(of: infoRepair.productName) {
                    infoRepair.fliedFunc()

                }.onChange(of: infoRepair.breakDownInfo) {
                    infoRepair.fliedFunc()}
                .formStyle(.grouped).navigationTitle("Prise de RDV")



            }


        }

    }


//#Preview {
//    NavigationStack {
//        AppointmentView( reparman: repairmen[0], showConfirmation:.constant(false))
//    }
//
//}
