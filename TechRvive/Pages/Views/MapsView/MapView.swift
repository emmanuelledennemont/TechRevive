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
    @State private var userLocation : MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var presentationDetentsSelection = PresentationDetent.height(90)

    @State  var repairmen : Repairmen

  //  @EnvironmentObject  private  var isPresented : ModalPresentation
    @State var isPresented = false

    var body: some View {
        NavigationStack {
            
            VStack{
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
                Button("Show Sheet") {
                    isPresented.toggle()
                        }.sheet(isPresented: $isPresented, content: {

                            SearchView(cameraposition: $userLocation, repaimen: $repairmen, presentationDetentsSelection: $presentationDetentsSelection)
                                .padding()

                            .presentationDetents([.height(90), .height(340), .large], selection: $presentationDetentsSelection)

                            .presentationCornerRadius(20)
                            .presentationBackground(Color(.systemGray6))
                            .presentationBackgroundInteraction(.enabled(upThrough: .large))
                            .interactiveDismissDisabled()
                            //.bottomMaskForSheet()

                    }).navigationTitle("Carte").navigationBarHidden(true).edgesIgnoringSafeArea(.bottom)

            }

        }




            .onAppear{
                CLLocationManager().requestWhenInUseAuthorization()
                Task{
                   // isPresented.isPresented.toggle()
                }

            }

    }
}
//
//#Preview {
//    MapView( repairmen: Repairmen(repairmenListe: repairmen)).environment(ModalPresentation())
//}

