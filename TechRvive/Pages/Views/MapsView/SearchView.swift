//
//  searchView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 30/06/2024.
//

import SwiftUI
import MapKit
import BottomSheet

struct SearchView: View {
    @EnvironmentObject var user : User
    @State var inputSearch = ""
    @State private var isEditing: Bool = false
    @State var selectedCategorie : ReparingCategory?
    @Binding var cameraposition : MapCameraPosition
    @State var cordinate = CLLocationCoordinate2D()
    @State private var selectedOption = false // Option par défaut
    @State var historySearch : [String] = []
    @Binding var repaimen : Repairmen
    @Binding  var botomPositionSheet : BottomSheetPosition

    var body: some View {

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
                            if botomPositionSheet == .relative(0.2) {
                                botomPositionSheet = .relative(0.5)
                            }
                            else {
                                botomPositionSheet = .relative(0.2)
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
                    }.disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
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
                    if !historySearch.isEmpty  && botomPositionSheet != .relative(0.5) {
                        VStack (alignment : .leading) {
                            Text("Mes Recherches Récentes").foregroundStyle(.gray)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .padding(.leading)
                            ZStack(alignment: .topLeading) {
                                RoundedRectangle(cornerRadius: 15).foregroundColor(.white).frame(height: 65*CGFloat(historySearch.count))
                                VStack (alignment : .leading, spacing :8) {

                                    ForEach(historySearch, id: \.self) { raw in

                                        HStack {
                                            ComponentElementsTypeOfReperman(imageName: "magnifyingglass", background: true, color: false).frame(height: 45)
                                            Text(raw)
                                        }



                                    }
                                }.padding(.top)
                            }.padding(.horizontal)

                        }

                    }


                    if botomPositionSheet != .relative(0.5) {

                        VStack(alignment : .leading) {
                            Text("Les Plus Proches").foregroundStyle(.gray)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .padding(.leading)

                            ZStack(alignment: .topLeading) {
                                RoundedRectangle(cornerRadius: 15).foregroundColor(.white).frame(height: 185)
                                VStack() {
                                    ForEach(repaimen.repairmenListe.indices) { index in
                                        if index<3 {
                                            NavigationLink {
                                                RepairmainInfoView(repairman: repaimen.repairmenListe[index])
                                            } label: {
                                                FavoriteView(imageName: repaimen.repairmenListe[index].image, name: repaimen.repairmenListe[index].name, reparingCategorie: repaimen.repairmenListe[index].reparingCategory )

                                            }

                                        }

                                    }
                                }.padding(.horizontal)

                            }.padding(.horizontal)
                        }

                    }

                    Spacer()

                }
            .onChange(of: selectedCategorie, {
                repaimen = Repairmen(repairmenListe: repairmen).filter(categorie: selectedCategorie, recycle: selectedOption)
            }).onChange(of: selectedOption, {
                repaimen = Repairmen(repairmenListe: repairmen).filter(categorie: selectedCategorie, recycle: selectedOption)
            })


            .onSubmit {
                if historySearch.count > 2 {
                    historySearch[0] = inputSearch
                }
                else{
                    historySearch.append(inputSearch)
                }

                Task{
                    cordinate =  await researchCity(city: inputSearch)
                    cameraposition = MapCameraPosition.region(MKCoordinateRegion(center: cordinate, latitudinalMeters: 7500, longitudinalMeters: 7500))

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

//#Preview {
//    SearchView(cameraposition: .constant(.userLocation(fallback: .automatic)), repaimen: .constant(repairmenType), botomPositionSheet: .constant(BottomSheetPosition.relative(0.5))).environment(userTest)
//}
