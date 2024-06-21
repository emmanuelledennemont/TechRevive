//
//  TabBarModel.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

import Foundation

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
               ReparationView(user: User(name: "", repairlistScheduled: [ProductRepairs(productName: "LG InstaView Door-in-Door", modelName: "LMXS28596S", breakDownInfo: "Accumulation de Glace", idRepairMan: "hhfd", reparingCategory: .bigElec),ProductRepairs(productName: "Angell Bike", modelName: "ANG123456789", breakDownInfo: "Problème de Batterie", idRepairMan: "hhfd", reparingCategory: .mobility)], repairListArchive: [], co2Eco: 0.0, eurEco: 0.0, favReparmain: []))
           case .calendrier:
               ReparationView(user: User(name: "", repairlistScheduled: [ProductRepairs(productName: "LG InstaView Door-in-Door", modelName: "LMXS28596S", breakDownInfo: "Accumulation de Glace", idRepairMan: "hhfd", reparingCategory: .bigElec),ProductRepairs(productName: "Angell Bike", modelName: "ANG123456789", breakDownInfo: "Problème de Batterie", idRepairMan: "hhfd", reparingCategory: .mobility)], repairListArchive: [], co2Eco: 0.0, eurEco: 0.0, favReparmain: []))
           case .reparations:
               ReparationView(user: User(name: "", repairlistScheduled: [ProductRepairs(productName: "LG InstaView Door-in-Door", modelName: "LMXS28596S", breakDownInfo: "Accumulation de Glace", idRepairMan: "hhfd", reparingCategory: .bigElec),ProductRepairs(productName: "Angell Bike", modelName: "ANG123456789", breakDownInfo: "Problème de Batterie", idRepairMan: "hhfd", reparingCategory: .mobility)], repairListArchive: [], co2Eco: 0.0, eurEco: 0.0, favReparmain: []))
           case .profil:
               ReparationView(user: User(name: "", repairlistScheduled: [ProductRepairs(productName: "LG InstaView Door-in-Door", modelName: "LMXS28596S", breakDownInfo: "Accumulation de Glace", idRepairMan: "hhfd", reparingCategory: .bigElec)], repairListArchive: [], co2Eco: 0.0, eurEco: 0.0, favReparmain: []))
           }
       }
   }

    

