//
//  searchView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 30/06/2024.
//

import SwiftUI
import MapKit

struct SearchView: View {
    @EnvironmentObject var user : User
    @State var inputSearch = ""
    @State private var isEditing: Bool = false
    @State var selectedCategorie : ReparingCategory?
    @Binding var cameraposition : MapCameraPosition
    @State var cordinate = CLLocationCoordinate2D()
    @State private var selectedOption = true // Option par défaut
    @State var historySearch : [String] = []
    @Binding var repaimen : Repairmen
    @Binding var presentationDetentsSelection : PresentationDetent

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
                            if presentationDetentsSelection == .height(90) {
                                presentationDetentsSelection = .height(340)
                            }
                          

                        }) {
                            Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                .imageScale(.large)
                                .foregroundColor(.orange)
                        }
                        .padding(.trailing, 10)
                    }
                    .padding(.horizontal, 10).padding(.top, 10)


                    Picker(selection: $selectedOption, label: Text("")) {
                        Text("Recycler").tag(true)
                        Text("Réparer").tag(false)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 200) // Ajustez la largeur selon vos besoins

                    .padding(.leading, 8)

                    VStack (alignment : .leading) {
                        Text("Categorie").foregroundStyle(.gray)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .padding(.leading)

                        HStack (spacing :25) {
                            ForEach(ReparingCategory.allCases, id: \.rawValue ) { raw in
                                CategoryButtonBis(category: raw, selectedCategory: $selectedCategorie)


                            }
                        }.padding().background().clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 10)))// Ajoutez un padding à gauche pour l'espacement
                    }
                    if !historySearch.isEmpty {
                        VStack (alignment : .leading) {
                            Text("Mes Recherches Récentes").foregroundStyle(.gray)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .padding(.leading)
                            ZStack( alignment: .topLeading) {
                                RoundedRectangle(cornerRadius: 15).foregroundColor(.white)
                                VStack (alignment : .leading, spacing :8) {
                                ForEach(historySearch, id: \.self) { raw in

                                        HStack {
                                            ComponentElementsTypeOfReperman(imageName: "magnifyingglass", background: true, color: false).frame(height: 45)
                                            Text(raw)
                                        }
                                        Divider()

                                    }
                                }.padding(.top)
                            }.padding(.horizontal)

                        }

                    }


                    VStack(alignment : .leading) {
                        Text("Les Plus Proches").foregroundStyle(.gray)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .padding(.leading)

                        ZStack {
                            RoundedRectangle(cornerRadius: 15).foregroundColor(.white)
                            VStack(spacing: 8) {
                                ForEach(user.favReparmain.repairmenListe) { repairmain in

                                    FavoriteView(imageName: repairmain.image, name: repairmain.name, address:"" )
                                    Divider()


                                }
                            }.padding(.horizontal)

                        }.padding(.horizontal).padding(.top)
                    }


                    Spacer()

                }
            }.onChange(of: selectedCategorie, {
                repaimen = repairmenType.filter(categorie: selectedCategorie, recycle: selectedOption)
            }).onChange(of: selectedOption, {
                repaimen = repairmenType.filter(categorie: selectedCategorie, recycle: selectedOption)
            })


            .onSubmit {
                historySearch.append(inputSearch)
                Task{
                    cordinate =  await researchCity(city: inputSearch)
                    cameraposition = MapCameraPosition.region(MKCoordinateRegion(center: cordinate, latitudinalMeters: 100, longitudinalMeters: 100))

                }





            }
        }






    }

    func researchCity(city : String) async -> CLLocationCoordinate2D {
        let geocoder = CLGeocoder()
        var coordinate = CLLocationCoordinate2D(latitude: 48.8567879, longitude: 2.3510768)

        return await withCheckedContinuation { continuation in

            geocoder.geocodeAddressString(city) { place, error in
                if let safeError = error {
                    print("une erreur c'est produite ")
                }
                else if let safePlace = place {
                    if let safeCoordinate = safePlace[0].location {
                        coordinate = safeCoordinate.coordinate
                        continuation.resume(returning: safeCoordinate.coordinate)
                    }
                    else {
                        continuation.resume(returning: CLLocationCoordinate2D(latitude: 48.8567879, longitude: 2.3510768))
                    }

                }

            }

        }



    }


}

#Preview {
    SearchView(cameraposition: .constant(.userLocation(fallback: .automatic)), repaimen: .constant(repairmenType), presentationDetentsSelection: .constant(PresentationDetent.height(90))).environment(userTest)
}
