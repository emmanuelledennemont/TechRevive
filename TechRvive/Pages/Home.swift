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

            MapView(repairmen: Repairmen(repairmenListe: repairmen)).tabItem {
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

