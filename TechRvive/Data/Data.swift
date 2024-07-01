//
//  Data.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 25/06/2024.
//

import Foundation
import MapKit

// Coordonnées approximatives pour différents arrondissements de Paris
let parisCoordinates = [
    CLLocationCoordinate2D(latitude: 48.864716, longitude: 2.349014), // Paris Centre
    CLLocationCoordinate2D(latitude: 48.866667, longitude: 2.333333), // Paris 8e
    CLLocationCoordinate2D(latitude: 48.853, longitude: 2.35),       // Paris 5e
    CLLocationCoordinate2D(latitude: 48.8371, longitude: 2.3358),    // Paris 14e
    CLLocationCoordinate2D(latitude: 48.862725, longitude: 2.287592) // Paris 16e
]

// Coordonnées approximatives pour différents quartiers de Toulouse
let toulouseCoordinates = [
    CLLocationCoordinate2D(latitude: 43.604652, longitude: 1.444209), // Capitole
    CLLocationCoordinate2D(latitude: 43.578926, longitude: 1.452635), // Rangueil
    CLLocationCoordinate2D(latitude: 43.596, longitude: 1.431),       // Arènes
    CLLocationCoordinate2D(latitude: 43.617845, longitude: 1.443592), // Minimes
    CLLocationCoordinate2D(latitude: 43.5648, longitude: 1.4746)      // Montaudran
]

// Coordonnées approximatives pour différents quartiers de Lyon
let lyonCoordinates = [
    CLLocationCoordinate2D(latitude: 45.764043, longitude: 4.835659), // Presqu'île
    CLLocationCoordinate2D(latitude: 45.770202, longitude: 4.83566),  // Croix-Rousse
    CLLocationCoordinate2D(latitude: 45.757934, longitude: 4.800101), // Vaise
    CLLocationCoordinate2D(latitude: 45.7406, longitude: 4.8263),     // Confluence
    CLLocationCoordinate2D(latitude: 45.726645, longitude: 4.88606)   // Gerland
]

// Réparateurs à Paris


// Réparateurs à Toulouse


let repairmen = [
    Repairman(
        image: "reparateur2",
        name: "Ahmed",
        info: "Tout type de réparation",
        adress: CLLocationCoordinate2D(latitude: 43.6045, longitude: 1.4442), // Toulouse Centre
        phoneNumber: "0823942834",
        openingHours: "6-19h",
        reparingCategory: .mobility
    ),
    Repairman(
        image: "reparateur3",
        name: "Luc",
        info: "Tout type de réparation",
        adress: CLLocationCoordinate2D(latitude: 43.6100, longitude: 1.4350), // Capitole
        phoneNumber: "0823942835",
        openingHours: "6-19h",
        reparingCategory: .device
    ),
    Repairman(
        image: "reparateur4",
        name: "Sophie",
        info: "Tout type de réparation",
        adress: CLLocationCoordinate2D(latitude: 43.5980, longitude: 1.4434), // Saint-Cyprien
        phoneNumber: "0823942836",
        openingHours: "6-19h",
        reparingCategory: .bigElec
    ),
    Repairman(
        image: "reparateur5",
        name: "Jean",
        info: "Tout type de réparation",
        adress: CLLocationCoordinate2D(latitude: 43.6156, longitude: 1.4521), // Minimes
        phoneNumber: "0823942837",
        openingHours: "6-19h",
        reparingCategory: .mobility
    ),
    Repairman(
        image: "reparateur6",
        name: "Marie",
        info: "Tout type de réparation",
        adress: CLLocationCoordinate2D(latitude: 43.5833, longitude: 1.4333), // Rangueil
        phoneNumber: "0823942838",
        openingHours: "6-19h",
        reparingCategory: .smallElec
    )
]












let userTest = User(image: "user", name: "Jéremie Achour", repairlistScheduled: [], repairListArchive: [], co2Eco: 12, eurEco: 22, favReparmain: Repairmen(repairmenListe: repairmen), adressMail: "jeremie.achour@icloud.com", telephone: " +33 0 6 56 67 85 44")



