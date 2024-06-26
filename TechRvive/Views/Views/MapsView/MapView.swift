//
//  MapView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 24/06/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State  private var userLocation : MapCameraPosition = .userLocation(fallback: .automatic)
 
    let repairmen : Repairmen

    var body: some View {
        Map(position: $userLocation){
            UserAnnotation().foregroundStyle(.orange)
            ForEach(repairmen.repairmenListe){ repairman in


                Annotation(repairman.name, coordinate:repairman.adress){

                    Button(action: {

                    }, label: {
                        ComponentElementsButtonMap(imageName: repairman.reparingCategory.imageName)
                    })

              
                          }
            }



        }.mapControls({
            MapCompass()
            MapUserLocationButton().foregroundStyle(.orange)
            MapScaleView()




        })
            .onAppear{
                CLLocationManager().requestWhenInUseAuthorization()
            }

    }
}

#Preview {
    MapView(repairmen: repairmenExemple)
}
