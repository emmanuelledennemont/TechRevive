//
//  TabBar.swift
//  TechRvive
//
//  Created by Emmanuelle  Dennemont on 21/06/2024.
//
//
//  TabBarView.swift
//  TechRvive
//
//  Created by Emmanuelle Dennemont on 21/06/2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        HStack(spacing: 0) {
            TabView {
                // Boucle à travers tous les cas de l'énumération Tab
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    // Affiche le texte correspondant au cas de l'énumération
                    Text(tab.rawValue)
                        .tag(tab) // Utilise le cas de l'énumération comme tag
                        .tabItem {
                            // Configure l'élément d'onglet avec une image et un texte
                            Image(systemName: tab.symbol)
                            Text(tab.rawValue)
                        }
                        .toolbarBackground(.visible, for: .tabBar) // Définit un fond de barre d'outils visible
                }
            }
            .accentColor(.orange)
        }
    }
}

#Preview {
    TabBarView()
}
