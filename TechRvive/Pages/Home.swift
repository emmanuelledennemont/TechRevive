//
//  TabBarView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

import SwiftUI

struct Home: View {
    var body: some View {


        TabView {

            MapView(repairmen: repairmenType).tabItem {
                Image(systemName: "map.fill")
                Text("Carte")
            }


            ReparationScheduledListView().tabItem {
                Image(systemName: "calendar")
                Text("Calendrier")
            }

            ReparationView().tabItem {
                Image(systemName: "wrench.adjustable.fill")
                Text("Réparation")
            }

            ProfileView().tabItem {
                Image(systemName: "person.fill")
                Text("Profil")
            }


        }
        .accentColor(.orange)


    }
}

#Preview {
    Home().environment(userTest)
}




//ForEach(Tab.allCases, id: \.rawValue) { tab in
//                // Affiche le texte correspondant au cas de l'énumération
//                tab.view
//                    .tag(tab) // Utilise le cas de l'énumération comme tag
//                    .tabItem {
//                        // Configure l'élément d'onglet avec une image et un texte
//                        Image(systemName: tab.symbol)
//                        Text(tab.rawValue)
//                    }
//                // Définit un fond de barre d'outils visible
//            }
