//
//  TabBarModel.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

import Foundation
import MapKit
import SwiftUI

// Définition de l'énumération Tab avec des cas spécifiques
enum Tab: String, CaseIterable {
    case carte = "Carte" // Cas pour l'onglet "Carte"
    case calendrier = "Calendrier" // Cas pour l'onglet "Calendrier"
    case reparations = "Réparation" // Cas pour l'onglet "Réparation"
    case profil = "Profil" // Cas pour l'onglet "Profil"

    // Propriété calculée qui retourne le symbole SF Symbol correspondant à chaque cas
    var symbol: String {
        switch self {
        case .carte:
            return "map.fill" // Symbole pour l'onglet "Carte"
        case .calendrier:
            return "calendar" // Symbole pour l'onglet "Calendrier"
        case .reparations:
            return "wrench.adjustable.fill" // Symbole pour l'onglet "Réparation"
        case .profil:
            return "person.fill" // Symbole pour l'onglet "Profil"
        }
    }

    var view: some View {
           switch self {
           case .carte:
               AnyView( MapView(repairmen: repairmenExemple))
           case .calendrier:
               AnyView( ReparationScheduledListView(user: userTest))
           case .reparations:
               AnyView( ReparationView(user: userTest ))
              
           case .profil:
               AnyView( ProfileView())
           }
       }


   }

    

