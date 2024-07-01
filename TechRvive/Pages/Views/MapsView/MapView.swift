//
//  MapView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 24/06/2024.
//

import SwiftUI
import MapKit

struct MapView: View {

    @State var user : User
    @State var inputSearch = ""
    @State var selectedCategorie = ReparingCategory.bigElec
    @State  private var userLocation : MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var isPresented = false


    let repairmen : Repairmen

    var body: some View {
        NavigationStack {
            ZStack {
                Map(position: $userLocation){
                    UserAnnotation().foregroundStyle(.orange)
                    ForEach(repairmen.repairmenListe){ repairman in


                        Annotation(repairman.name, coordinate:repairman.adress){
                            NavigationLink {
                                RepairmainInfoView(user: $user, repairman: repairman)
                            } label: {
                                ComponentElementsButtonMap(imageName: repairman.reparingCategory.imageName)
                            }


    //                        Button(action: {
    //
    //                        }, label: {
    //                            ComponentElementsButtonMap(imageName: repairman.reparingCategory.imageName)
    //                        })


                                  }
                    }



                }.mapControls({
                    MapCompass()
                    MapUserLocationButton().foregroundStyle(.orange)
                    MapScaleView()






                })
                VStack {

                    Button {
                        isPresented.toggle()
                    } label: {
                       Label("Recherche", systemImage: "character.textbox")
                }
                    Spacer()
                }


            }


            .navigationTitle("Carte").navigationBarHidden(true)
            .sheet(isPresented: $isPresented, content: {

                SearchView(cameraposition: $userLocation)
                    .padding()
                
                .presentationDetents([.height(60), .medium, .large])
                .presentationCornerRadius(20)
                .presentationBackground(.regularMaterial)
                .presentationBackgroundInteraction(.enabled(upThrough: .large))
                .interactiveDismissDisabled()

        })

        }

            .onAppear{
                CLLocationManager().requestWhenInUseAuthorization()
            }

    }
}

#Preview {
    MapView(user: userTest, repairmen: repairmenExemple)
}

