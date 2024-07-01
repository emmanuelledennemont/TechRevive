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
    @State private var isEditing: Bool = false
    @State var selectedCategorie = ReparingCategory.bigElec
   // @Binding var cameraposition : MapCameraPosition
    @State var cordinate = CLLocationCoordinate2D()
    @State private var selectedOption = "Recycler" // Option par défaut
    var body: some View {

            ZStack {
                Color(Color(.systemGray6)).ignoresSafeArea()

                ScrollView {

                    VStack(spacing: 25) {

                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.leading, 8)

                            TextField("Search ...", text: $inputSearch)
                                .padding(7)
                                .padding(.horizontal, 8)
                                .background(Color(.systemGray5))
                                .cornerRadius(8)
                                .onTapGesture {
                                    self.isEditing = true
                                }

                            if isEditing {
                                Button(action: {
                                    inputSearch = ""
                                    self.isEditing = false
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                        .background(Color(.systemGray5))
                        .cornerRadius(8)

                        Button(action: {
                            // Action du bouton filtre
                        }) {
                            Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                .imageScale(.large)
                                .foregroundColor(.orange)
                        }
                        .padding(.trailing, 10)
                    }
                    .padding(.horizontal, 10).padding(.top, 10)


                        Picker(selection: $selectedOption, label: Text("")) {
                            Text("Recycler").tag("Recycler")
                            Text("Réparer").tag("Réparer")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 200) // Ajustez la largeur selon vos besoins

                        .padding(.leading, 8)

                        VStack {
                            Text("Categorie")
                            HStack {
                                ForEach(ReparingCategory.allCases, id: \.rawValue ) { raw in
                                    CategoryButton(category: raw, selectedCategory: $selectedCategorie)

                                }
                            }
                        }.padding().background().clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 10)))// Ajoutez un padding à gauche pour l'espacement
                        Spacer()

                }
            }


                .onSubmit {
                    Task{
                        cordinate =  await researchCity(city: inputSearch)
                    }



            }
        }
//            .onChange(of: cordinate) {
//                cameraposition = MapCameraPosition.region(MKCoordinateRegion(center: cordinate, latitudinalMeters: 500, longitudinalMeters: 700)  )
//            }






    }

    func researchCity(city : String) async -> CLLocationCoordinate2D {
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


#Preview {
    SearchView()
}
