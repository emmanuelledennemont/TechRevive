//
//  MapView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 24/06/2024.
//

import SwiftUI
import MapKit

struct MapView: View {

  
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
                                RepairmainInfoView(repairman: repairman)
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
              


            }


            .navigationTitle("Carte").navigationBarHidden(true)

        }.sheet(isPresented: $isPresented, content: {

            SearchView()
                .padding()

            .presentationDetents([.height(90), .medium, .large])
            .presentationCornerRadius(20)
            .presentationBackground(Color(.systemGray6))
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
            .interactiveDismissDisabled()
            .bottomMaskForSheet()

    })


            .onAppear{
                CLLocationManager().requestWhenInUseAuthorization()

            }.task {
                isPresented = true
            }


    }
}

#Preview {
    MapView( repairmen: Repairmen(repairmenListe: repairmen))
}

