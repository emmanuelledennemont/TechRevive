//
//  searchView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 30/06/2024.
//

import SwiftUI
import MapKit

struct SearchView: View {
    @State var inputSearch = ""
    @State var selectedCategorie = ReparingCategory.bigElec
    @Binding var cameraposition : MapCameraPosition
    @State var cordinate = CLLocationCoordinate2D()
    var body: some View {



        
        ZStack {
            Color(Color(.systemGray5)).ignoresSafeArea()
            ScrollView {
                Spacer(minLength: 20)
                TextField("Rechercher une ville ", text: $inputSearch).frame(height: 25).padding().background().clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 10))).padding(.horizontal, 15.0)

                Spacer(minLength: 20)
                VStack {
                    Text("Categorie")
                    HStack {
                        ForEach(ReparingCategory.allCases, id: \.rawValue ) { raw in
                            CategoryButton(category: raw, selectedCategory: $selectedCategorie)

                        }
                    }
                }.padding().background().clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 10)))




        }
        }
            .onSubmit {
                cordinate = researchCity(city: inputSearch)


            }
//            .onChange(of: cordinate) {
//                cameraposition = MapCameraPosition.region(MKCoordinateRegion(center: cordinate, latitudinalMeters: 500, longitudinalMeters: 700)  )
//            }






    }

    func researchCity(city : String)  -> CLLocationCoordinate2D {
        let geocoder = CLGeocoder()
        var coordinate = CLLocationCoordinate2D(latitude: 48.8567879, longitude: 2.3510768)
            geocoder.geocodeAddressString(city) { place, error in
                if let safeError = error {
                    print("une erreur c'est produite ")
                }
                else if let safePlace = place {
                    if let safeCoordinate = safePlace[0].location {
                        coordinate = safeCoordinate.coordinate
                       // continuation.resume(returning: safeCoordinate.coordinate)
                    }
//                    else {
//                       // continuation.resume(returning: CLLocationCoordinate2D(latitude: 48.8567879, longitude: 2.3510768))
//                    }

                }

        }
        return coordinate
    }



}


//#Preview {
//    SearchView()
//}
