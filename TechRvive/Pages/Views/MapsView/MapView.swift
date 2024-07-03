//
//  MapView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 24/06/2024.
//

import SwiftUI
import MapKit
import BottomSheet

struct MapView: View {
    
    @State var inputSearch = ""
    @State var selectedCategorie = ReparingCategory.bigElec
    @State private var userLocation : MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var presentationDetentsSelection = PresentationDetent.height(90)
    @State private var botomPositionSheet : BottomSheetPosition = .relative(0.2)
    @State  var repairmen : Repairmen
    @State var isPresented = false
    
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
                            
                            
                            
                        }
                    }
                    
                    
                }.mapControls({
                    MapCompass()
                    MapUserLocationButton().foregroundStyle(.orange)
                    MapScaleView()
                    
                    
                })
                
                
            }.bottomSheet(bottomSheetPosition: $botomPositionSheet, switchablePositions: [.relative(0.2),.relative(0.5), .relative(0.9999)], content: {
                SearchView(cameraposition: $userLocation, repaimen: $repairmen,botomPositionSheet: $botomPositionSheet)
            })
            
            
            
            
        }
        
        .onAppear{
            CLLocationManager().requestWhenInUseAuthorization()
            Task{
                // isPresented.isPresented.toggle()
            }
            
        }
        
    }
}

#Preview {
    MapView( repairmen: Repairmen(repairmenListe: repairmen))
}

