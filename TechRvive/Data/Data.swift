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


//Repairman(
//    name: "Vincent",
//    info: "Réparateur d'électroménager",
//    adress: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945),
//    phoneNumber: "0823942952",
//    openingHours: "7-17h",
//    reparingCategory: .bigElec,
//    image: "reparateur3"
//),

let repairmen = [
    Repairman(
        name: "Ahmed",
        info: "Tout type de réparation",
        adress: CLLocationCoordinate2D(latitude: 43.6045, longitude: 1.4442), // Toulouse Centre
        phoneNumber: "0823942834",
        openingHours: "6-19h",
        reparingCategory: .mobility,
        image: "reparateur2"
    ),
    Repairman(
        name: "Luc",
        info: "Tout type de réparation",
        adress: CLLocationCoordinate2D(latitude: 43.6100, longitude: 1.4350), // Capitole
        phoneNumber: "0823942835",
        openingHours: "6-19h",
        reparingCategory: .bigElec,
        image: "reparateur3"
    ),
    Repairman(
        name: "Sophie",
        info: "Tout type de réparation",
        adress: CLLocationCoordinate2D(latitude: 43.5980, longitude: 1.4434), // Saint-Cyprien
        phoneNumber: "0823942836",
        openingHours: "6-19h",
        reparingCategory: .device,
        image: "reparateur4"
    ),
    Repairman(
        name: "Antoine",
        info: "Spécialiste des vélos et trottinettes",
        adress: CLLocationCoordinate2D(latitude: 44.8378, longitude: -0.5792),
        phoneNumber: "0823943101",
        openingHours: "8-18h",
        reparingCategory: .mobility,
        image: "reparateur2"
    ), Repairman(
        name: "Laurent",
        info: "Spécialiste en réparation de petits électroménagers",
        adress: CLLocationCoordinate2D(latitude: 44.8331, longitude: -0.5772),
        phoneNumber: "0823943104",
        openingHours: "10-18h",
        reparingCategory: .smallElec,
        image: "reparateur5"
    ),
    Repairman(
        name: "Camille",
        info: "Réparations d'appareils de grandes marques",
        adress: CLLocationCoordinate2D(latitude: 44.8326, longitude: -0.5790),
        phoneNumber: "0823943105",
        openingHours: "6-15h",
        reparingCategory: .bigElec,
        image: "reparateur6"
    ),
    Repairman(
        name: "Florian",
        info: "Expert en réparation de téléphones",
        adress: CLLocationCoordinate2D(latitude: 44.8305, longitude: -0.5798),
        phoneNumber: "0823943106",
        openingHours: "8-20h",
        reparingCategory: .device,
        image: "reparateur7"
    ),     Repairman(
        name: "Matthieu",
        info: "Spécialiste des vélos et trottinettes",
        adress: CLLocationCoordinate2D(latitude: 48.1173, longitude: -1.6778),
        phoneNumber: "0823943051",
        openingHours: "8-18h",
        reparingCategory: .mobility,
        image: "reparateur2"
    ),
    Repairman(
        name: "Alain",
        info: "Réparateur d'électroménager",
        adress: CLLocationCoordinate2D(latitude: 48.1145, longitude: -1.6752),
        phoneNumber: "0823943052",
        openingHours: "7-17h",
        reparingCategory: .bigElec,
        image: "reparateur3"
    ),
    Repairman(
        name: "Claire",
        info: "Réparations de petits appareils électroniques",
        adress: CLLocationCoordinate2D(latitude: 48.1198, longitude: -1.6426),
        phoneNumber: "0823943053",
        openingHours: "9-19h",
        reparingCategory: .device,
        image: "reparateur4"
    ),
    Repairman(
        name: "Gaël",
        info: "Spécialiste en réparation de petits électroménagers",
        adress: CLLocationCoordinate2D(latitude: 48.1236, longitude: -1.6850),
        phoneNumber: "0823943054",
        openingHours: "10-18h",
        reparingCategory: .smallElec,
        image: "reparateur5"
    ),
    Repairman(
        name: "Aurélie",
        info: "Réparations d'appareils de grandes marques",
        adress: CLLocationCoordinate2D(latitude: 48.1095, longitude: -1.6744),
        phoneNumber: "0823943055",
        openingHours: "6-15h",
        reparingCategory: .bigElec,
        image: "reparateur6"
    ),
    Repairman(
        name: "Jérôme",
        info: "Expert en réparation de téléphones",
        adress: CLLocationCoordinate2D(latitude: 48.1116, longitude: -1.6806),
        phoneNumber: "0823943056",
        openingHours: "8-20h",
        reparingCategory: .device,
        image: "reparateur7"
    ), Repairman(
        name: "Julien",
        info: "Spécialiste des vélos et trottinettes",
        adress: CLLocationCoordinate2D(latitude: 50.6292, longitude: 3.0573),
        phoneNumber: "0823942834",
        openingHours: "8-18h",
        reparingCategory: .mobility,
        image: "reparateur2"
    ),
    Repairman(
        name: "François",
        info: "Réparateur d'électroménager",
        adress: CLLocationCoordinate2D(latitude: 50.6333, longitude: 3.0667),
        phoneNumber: "0823942835",
        openingHours: "7-17h",
        reparingCategory: .bigElec,
        image: "reparateur3"
    ),
    Repairman(
        name: "Emilie",
        info: "Réparations de petits appareils électroniques",
        adress: CLLocationCoordinate2D(latitude: 50.6278, longitude: 3.0608),
        phoneNumber: "0823942836",
        openingHours: "9-19h",
        reparingCategory: .device,
        image: "reparateur4"
    ),
    Repairman(
        name: "Nicolas",
        info: "Spécialiste en réparation de petits électroménagers",
        adress: CLLocationCoordinate2D(latitude: 50.6282, longitude: 3.0480),
        phoneNumber: "0823942837",
        openingHours: "10-18h",
        reparingCategory: .smallElec,
        image: "reparateur5"
    ),
    Repairman(
        name: "Elodie",
        info: "Réparations d'appareils de grandes marques",
        adress: CLLocationCoordinate2D(latitude: 50.6319, longitude: 3.0635),
        phoneNumber: "0823942838",
        openingHours: "6-15h",
        reparingCategory: .bigElec,
        image: "reparateur6"
    ),
    Repairman(
        name: "Thomas",
        info: "Expert en réparation de téléphones",
        adress: CLLocationCoordinate2D(latitude: 50.6346, longitude: 3.0696),
        phoneNumber: "0823942839",
        openingHours: "8-20h",
        reparingCategory: .device,
        image: "reparateur7"
    ), Repairman(
        name: "Louis",
        info: "Spécialiste des vélos et trottinettes",
        adress: CLLocationCoordinate2D(latitude: 45.7640, longitude: 4.8357),
        phoneNumber: "0823943001",
        openingHours: "8-18h",
        reparingCategory: .mobility,
        image: "reparateur2"
    ),
    Repairman(
        name: "Gilles",
        info: "Réparateur d'électroménager",
        adress: CLLocationCoordinate2D(latitude: 45.7625, longitude: 4.8270),
        phoneNumber: "0823943002",
        openingHours: "7-17h",
        reparingCategory: .bigElec,
        image: "reparateur3"
    ),
    Repairman(
        name: "Hélène",
        info: "Réparations de petits appareils électroniques",
        adress: CLLocationCoordinate2D(latitude: 45.7580, longitude: 4.8415),
        phoneNumber: "0823943003",
        openingHours: "9-19h",
        reparingCategory: .device,
        image: "reparateur4"
    ),
    Repairman(
        name: "Marc",
        info: "Spécialiste en réparation de petits électroménagers",
        adress: CLLocationCoordinate2D(latitude: 45.7662, longitude: 4.8744),
        phoneNumber: "0823943004",
        openingHours: "10-18h",
        reparingCategory: .smallElec,
        image: "reparateur5"
    ),
    Repairman(
        name: "Amélie",
        info: "Réparations d'appareils de grandes marques",
        adress: CLLocationCoordinate2D(latitude: 45.7579, longitude: 4.8310),
        phoneNumber: "0823943005",
        openingHours: "6-15h",
        reparingCategory: .bigElec,
        image: "reparateur6"
    ),
    Repairman(
        name: "Rémi",
        info: "Expert en réparation de téléphones",
        adress: CLLocationCoordinate2D(latitude: 45.7574, longitude: 4.8326),
        phoneNumber: "0823943006",
        openingHours: "8-20h",
        reparingCategory: .device,
        image: "reparateur7"
    ), Repairman(
        name: "Charles",
        info: "Spécialiste des vélos et trottinettes",
        adress: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
        phoneNumber: "0823942951",
        openingHours: "8-18h",
        reparingCategory: .mobility,
        image: "reparateur2"
    ),
    Repairman(
        name: "Vincent",
        info: "Réparateur d'électroménager",
        adress: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945),
        phoneNumber: "0823942952",
        openingHours: "7-17h",
        reparingCategory: .bigElec,
        image: "reparateur3"
    ),
    Repairman(
        name: "Christine",
        info: "Réparations de petits appareils électroniques",
        adress: CLLocationCoordinate2D(latitude: 48.8530, longitude: 2.3499),
        phoneNumber: "0823942953",
        openingHours: "9-19h",
        reparingCategory: .device,
        image: "reparateur4"
    ),
    Repairman(
        name: "Pierre",
        info: "Spécialiste en réparation de petits électroménagers",
        adress: CLLocationCoordinate2D(latitude: 48.8708, longitude: 2.3150),
        phoneNumber: "0823942954",
        openingHours: "10-18h",
        reparingCategory: .smallElec,
        image: "reparateur5"
    ),
    Repairman(
        name: "Sophie",
        info: "Réparations d'appareils de grandes marques",
        adress: CLLocationCoordinate2D(latitude: 48.8462, longitude: 2.3469),
        phoneNumber: "0823942955",
        openingHours: "6-15h",
        reparingCategory: .bigElec,
        image: "reparateur6"
    )

 ]


var repairmenFav = [
    Repairman(
        name: "Ahmed",
        info: "Tout type de réparation",
        adress: CLLocationCoordinate2D(latitude: 43.6045, longitude: 1.4442), // Toulouse Centre
        phoneNumber: "0823942834",
        openingHours: "6-19h",
        reparingCategory: .mobility,
        image: "reparateur2"
    ),
    Repairman(
        name: "Luc",
        info: "Tout type de réparation",
        adress: CLLocationCoordinate2D(latitude: 43.6100, longitude: 1.4350), // Capitole
        phoneNumber: "0823942835",
        openingHours: "6-19h",
        reparingCategory: .bigElec,
        image: "reparateur3"
    ),
    Repairman(
        name: "Sophie",
        info: "Tout type de réparation",
        adress: CLLocationCoordinate2D(latitude: 43.5980, longitude: 1.4434), // Saint-Cyprien
        phoneNumber: "0823942836",
        openingHours: "6-19h",
        reparingCategory: .device,
        image: "reparateur4"
    )]


//Repared

let products2 = [
    ProductRepairs(
        productName: "Samsung Galaxy S20",
        modelName: "G980F",
        repairStatus: .repared,
        breakDownInfo: "L'écran est fissuré",
        idRepairMan: repairmen[0].id, // Julien
        reparingCategory: .device,
        date: Date(timeIntervalSinceNow: -86400 * 10)
    ),
    ProductRepairs(
        productName: "Philips Blender",
        modelName: "HR3652",
        repairStatus: .repared,
        breakDownInfo: "Le moteur ne démarre pas",
        idRepairMan: repairmen[1].id, // François
        reparingCategory: .bigElec,
        date: Date(timeIntervalSinceNow: -86400 * 20)
    ),
    ProductRepairs(
        productName: "Ironman Électricité",
        modelName: "E1500",
        repairStatus: .repared,
        breakDownInfo: "Problème de câblage interne",
        idRepairMan: repairmen[2].id, // Isabelle
        reparingCategory: .device,
        date: Date(timeIntervalSinceNow: -86400 * 5)
    ),
    ProductRepairs(
        productName: "Dyson Aspirateur",
        modelName: "V11",
        repairStatus: .repared,
        breakDownInfo: "Perte de puissance d'aspiration",
        idRepairMan: repairmen[3].id, // Philippe
        reparingCategory: .bigElec,
        date: Date(timeIntervalSinceNow: -86400 * 15)
    ),
    ProductRepairs(
        productName: "iPhone 11",
        modelName: "A2111",
        repairStatus: .repared,
        breakDownInfo: "La batterie se vide rapidement",
        idRepairMan: repairmen[4].id, // Charles
        reparingCategory: .device,
        date: Date(timeIntervalSinceNow: -86400 * 8)
    ),
    ProductRepairs(
        productName: "Bosch Lave-linge",
        modelName: "WAW325H2SN",
        repairStatus: .repared,
        breakDownInfo: "Ne tourne plus",
        idRepairMan: repairmen[5].id, // Vincent
        reparingCategory: .bigElec,
        date: Date(timeIntervalSinceNow: -86400 * 12)
    ),
    ProductRepairs(
        productName: "Nokia 3310",
        modelName: "TA-1030",
        repairStatus: .repared,
        breakDownInfo: "L'écran ne s'allume pas",
        idRepairMan: repairmen[6].id, // Louis
        reparingCategory: .device,
        date: Date(timeIntervalSinceNow: -86400 * 3)
    ),
    ProductRepairs(
        productName: "Gorenje Réfrigérateur",
        modelName: "NRK6191CW4",
        repairStatus: .repared,
        breakDownInfo: "Ne refroidit pas correctement",
        idRepairMan: repairmen[7].id, // Gilles
        reparingCategory: .bigElec,
        date: Date(timeIntervalSinceNow: -86400 * 25)
    )
]



let products: [ProductRepairs] = [

    ProductRepairs(
        productName: "Philips Blender",
        modelName: "HR3652",
        repairStatus: .readyToRepair,
        breakDownInfo: "Le moteur ne démarre pas",
        idRepairMan: repairmen[1].id,
        reparingCategory: .bigElec,
        date: Date(timeIntervalSinceNow: -86400 * 20)
    ),
    ProductRepairs(
        productName: "Dyson Aspirateur",
        modelName: "V11",
        repairStatus: .readyToRepair,
        breakDownInfo: "Perte de puissance d'aspiration",
        idRepairMan: repairmen[3].id,
        reparingCategory: .bigElec,
        date: Date(timeIntervalSinceNow: -86400 * 15)
    ),
    ProductRepairs(
        productName: "Bosch Lave-linge",
        modelName: "WAW325H2SN",
        repairStatus: .readyToRepair,
        breakDownInfo: "Ne tourne plus",
        idRepairMan: repairmen[5].id,
        reparingCategory: .bigElec,
        date: Date(timeIntervalSinceNow: -86400 * 12)
    ),
    ProductRepairs(
        productName: "Nokia 3310",
        modelName: "TA-1030",
        repairStatus: .repairing,
        breakDownInfo: "L'écran ne s'allume pas",
        idRepairMan: repairmen[6].id,
        reparingCategory: .device,
        date: Date(timeIntervalSinceNow: -86400 * 3)
    ),
    ProductRepairs(
        productName: "Gorenje Réfrigérateur",
        modelName: "NRK6191CW4",
        repairStatus: .readyToRepair,
        breakDownInfo: "Ne refroidit pas correctement",
        idRepairMan: repairmen[7].id,
        reparingCategory: .bigElec,
        date: Date(timeIntervalSinceNow: -86400 * 25)
    ),
    ProductRepairs(
        productName: "Toshiba TV",
        modelName: "43UL2063DB",
        repairStatus: .repairing,
        breakDownInfo: "Problème de rétroéclairage",
        idRepairMan: repairmen[8].id,
        reparingCategory: .bigElec,
        date: Date(timeIntervalSinceNow: -86400 * 17)
    ),
    ProductRepairs(
        productName: "Xiaomi Mi Scooter",
        modelName: "Pro 2",
        repairStatus: .readyToRepair,
        breakDownInfo: "Problème de batterie",
        idRepairMan: repairmen[9].id,
        reparingCategory: .mobility,
        date: Date(timeIntervalSinceNow: -86400 * 14)
    ),
    ProductRepairs(
        productName: "LG Télécopieur",
        modelName: "FC371A",
        repairStatus: .repairing,
        breakDownInfo: "Le papier est coincé",
        idRepairMan: repairmen[10].id,
        reparingCategory: .device,
        date: Date(timeIntervalSinceNow: -86400 * 3)
    ),
    ProductRepairs(
        productName: "Sony PlayStation 5",
        modelName: "CFI-1015A",
        repairStatus: .readyToRepair,
        breakDownInfo: "Ne s'allume pas",
        idRepairMan: repairmen[11].id,
        reparingCategory: .device,
        date: Date(timeIntervalSinceNow: -86400 * 6)
    ),
    ProductRepairs(
        productName: "Asus Laptop",
        modelName: "E410MA",
        repairStatus: .repairing,
        breakDownInfo: "Écran cassé",
        idRepairMan: repairmen[12].id,
        reparingCategory: .device,
        date: Date(timeIntervalSinceNow: -86400 * 5)
    ),
    ProductRepairs(
        productName: "Samsung Frigo",
        modelName: "RS65R5401M9",
        repairStatus: .readyToRepair,
        breakDownInfo: "Fuite d'eau",
        idRepairMan: repairmen[13].id,
        reparingCategory: .bigElec,
        date: Date(timeIntervalSinceNow: -86400 * 10)
    ),

    ProductRepairs(
        productName: "Canon Scanner",
        modelName: "LiDE 400",
        repairStatus: .repairing,
        breakDownInfo: "Ne scanne plus",
        idRepairMan: repairmen[16].id,
        reparingCategory: .device,
        date: Date(timeIntervalSinceNow: -86400 * 12)
    ),
    ProductRepairs(
        productName: "Brother MFC",
        modelName: "L3770CDW",
        repairStatus: .readyToRepair,
        breakDownInfo: "Problème de connectivité",
        idRepairMan: repairmen[17].id,
        reparingCategory: .bigElec,
        date: Date(timeIntervalSinceNow: -86400 * 15)
    )
]




let userTest = User(image: "user", name: "Jéremie Achour", repairlistScheduled: products, repairListArchive: products2, co2Eco: 12, eurEco: 22, favReparmain: Repairmen(repairmenListe: []), adressMail: "jeremie.achour@icloud.com", telephone: " +33 0 6 56 67 85 44")



