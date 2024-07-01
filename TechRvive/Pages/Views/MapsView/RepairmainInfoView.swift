//
//  RepairmainInfoView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 28/06/2024.
//

import SwiftUI
import MapKit

struct RepairmainInfoView: View {

    @Binding var user : User
    @State  var repairman : Repairman
    @State var adress = ""
    @State var isPresented = false

    var body: some View {


        ZStack {
            ScrollView ( ) {
                VStack(spacing: 20) {
                    // Title and Subtitle with Icon

                    ZStack(alignment: .topLeading) {

                        RoundedRectangle(cornerRadius: 25).stroke(.gray, lineWidth: 0).background(Color(.systemGray6)).clipShape(RoundedRectangle(cornerRadius: 10)).frame( width : 360 , height : 90 )

                        HStack( spacing : 25) {
                            VStack {
                                Image(systemName: repairman.reparingCategory.imageName) // Remplacer par l'icône appropriée
                                    .font(.system(size: 40))
                                    .foregroundColor(.orange)
                            }.padding()

                            VStack(alignment: .leading) {
                                Text(repairman.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text(repairman.reparingCategory.rawValue)
                                    .font(.title3)
                                    .foregroundColor(.gray)
                            }

                        }


                    }

                    // Action Buttons
                    HStack(spacing : 20) {
                        NavigationLink {
                            AppointmentView(user: $user, reparman: repairman, showConfirmation: $isPresented)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 0).background(Color(.systemGray6)).clipShape(RoundedRectangle(cornerRadius: 10)).frame( width : 75 , height: 60 )
                                VStack(spacing : 8) {
                                    Image(systemName: "calendar")
                                        .foregroundColor(.gray)
                                    Text("RDV").foregroundColor(.gray).font(.footnote)
                                }
                            }


                        }


                        ActionButtonView(title: "Itinéraire", imageName: "location", isHighlighted: true) {
                            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: repairman.adress))
                            mapItem.name = adress
                            mapItem.openInMaps(launchOptions: [
                                MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
                            ])
                        }

                        ActionButtonView(title: "Appel", imageName: "phone") {
                            // Action for Call
                        }
                        ActionButtonView(title: "Favori", imageName: "star") {
                            // Action for Favorite
                        }
                    }


                    // Schedule Information
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Horaire")
                                .font(.headline)
                            Spacer()
                            Text(repairman.openingHours)
                                .foregroundColor(.gray)
                            Text("Ouvert")
                                .foregroundColor(.green)
                        }
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)

                    // Information Section

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Informations")
                            .font(.headline)

                        ZStack(alignment: .topLeading) {

                            RoundedRectangle(cornerRadius: 25).stroke(.gray, lineWidth: 0).background(Color(.systemGray6)).clipShape(RoundedRectangle(cornerRadius: 10)).frame( width : 360 , height : 90 )


                            HStack  {

                                Text(repairman.info).padding(10)



                            }

                        }


                    }
                    .padding(.horizontal)

                    // Contact Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Contact")
                            .font(.headline)

                        HStack {
                            VStack(alignment: .leading) {
                                Text("Téléphone")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text(repairman.phoneNumber)
                                    .foregroundColor(.orange)
                                    .font(.subheadline)
                            }
                            Spacer()
                        }

                        HStack {
                            VStack(alignment: .leading) {
                                Text("Adresse")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text(adress)
                                    .font(.subheadline)
                            }
                            Spacer()
                            Image(systemName: "location.fill")
                                .foregroundColor(.orange)
                        }
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)

                    // Appointment Button
                    NavigationLink {
                        AppointmentView(user: $user, reparman: repairman, showConfirmation: $isPresented)
                    } label: {
                        Text("Prendre un RDV")
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.orange)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.orange, lineWidth: 1)
                            )
                    }


                    .padding(.horizontal)
                }

            }
                    .task {
                        adress = await repairman.getadress()
                }

            if isPresented {
                CustomAlertView(show: $isPresented)

            }
        }






    }

   


}
#Preview {
    RepairmainInfoView (user: .constant(userTest), repairman: parisRepairmen.repairmenListe[0])
}


