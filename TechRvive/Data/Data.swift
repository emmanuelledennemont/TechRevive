//
//  Data.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 25/06/2024.
//

import Foundation
import MapKit


let repairmenTab: [Repairman] = [
    Repairman(name: "Réparateur 1", info: "Expert en gros électroménager", adress: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), phoneNumber: "0102030405", openingHours: "8h-18h", reparingCategory: .bigElec),
    Repairman(name: "Réparateur 2", info: "Spécialiste en petits électroménagers", adress: CLLocationCoordinate2D(latitude: 45.7640, longitude: 4.8357), phoneNumber: "0102030406", openingHours: "9h-19h", reparingCategory: .smallElec),
    Repairman(name: "Réparateur 3", info: "Réparateur de devices", adress: CLLocationCoordinate2D(latitude: 43.7102, longitude: 7.2620), phoneNumber: "0102030407", openingHours: "10h-20h", reparingCategory: .device),
    Repairman(name: "Réparateur 4", info: "Expert en e-Mobilité", adress: CLLocationCoordinate2D(latitude: 48.1173, longitude: -1.6778), phoneNumber: "0102030408", openingHours: "7h-17h", reparingCategory: .mobility),
    Repairman(name: "Réparateur 5", info: "Gros électroménager et plus", adress: CLLocationCoordinate2D(latitude: 50.6292, longitude: 3.0573), phoneNumber: "0102030409", openingHours: "6h-16h", reparingCategory: .bigElec),
    Repairman(name: "Réparateur 6", info: "Petits électroménagers rapides", adress: CLLocationCoordinate2D(latitude: 47.2184, longitude: -1.5536), phoneNumber: "0102030410", openingHours: "11h-21h", reparingCategory: .smallElec),
    Repairman(name: "Réparateur 7", info: "Devices et gadgets", adress: CLLocationCoordinate2D(latitude: 44.8378, longitude: -0.5792), phoneNumber: "0102030411", openingHours: "9h-18h", reparingCategory: .device),
    Repairman(name: "Réparateur 8", info: "Expert en e-Mobilité", adress: CLLocationCoordinate2D(latitude: 45.1885, longitude: 5.7245), phoneNumber: "0102030412", openingHours: "8h-18h", reparingCategory: .mobility),
    Repairman(name: "Réparateur 9", info: "Gros électroménager", adress: CLLocationCoordinate2D(latitude: 43.2965, longitude: 5.3698), phoneNumber: "0102030413", openingHours: "7h-19h", reparingCategory: .bigElec),
    Repairman(name: "Réparateur 10", info: "Tous types de petits électroménagers", adress: CLLocationCoordinate2D(latitude: 48.5734, longitude: 7.7521), phoneNumber: "0102030414", openingHours: "10h-18h", reparingCategory: .smallElec)
]


let repairmenTabFav: [Repairman] = [
    Repairman(name: "Réparateur 1", info: "Expert en gros électroménager", adress: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), phoneNumber: "0102030405", openingHours: "8h-18h", reparingCategory: .bigElec),
    Repairman(name: "Réparateur 2", info: "Spécialiste en petits électroménagers", adress: CLLocationCoordinate2D(latitude: 45.7640, longitude: 4.8357), phoneNumber: "0102030406", openingHours: "9h-19h", reparingCategory: .smallElec),
    Repairman(name: "Réparateur 3", info: "Réparateur de devices", adress: CLLocationCoordinate2D(latitude: 43.7102, longitude: 7.2620), phoneNumber: "0102030407", openingHours: "10h-20h", reparingCategory: .device),
    Repairman(name: "Réparateur 4", info: "Expert en e-Mobilité", adress: CLLocationCoordinate2D(latitude: 48.1173, longitude: -1.6778), phoneNumber: "0102030408", openingHours: "7h-17h", reparingCategory: .mobility),
    Repairman(name: "Réparateur 5", info: "Gros électroménager et plus", adress: CLLocationCoordinate2D(latitude: 50.6292, longitude: 3.0573), phoneNumber: "0102030409", openingHours: "6h-16h", reparingCategory: .bigElec),
    Repairman(name: "Réparateur 7", info: "Devices et gadgets", adress: CLLocationCoordinate2D(latitude: 44.8378, longitude: -0.5792), phoneNumber: "0102030411", openingHours: "9h-18h", reparingCategory: .device),
    Repairman(name: "Réparateur 8", info: "Expert en e-Mobilité", adress: CLLocationCoordinate2D(latitude: 45.1885, longitude: 5.7245), phoneNumber: "0102030412", openingHours: "8h-18h", reparingCategory: .mobility),
    Repairman(name: "Réparateur 9", info: "Gros électroménager", adress: CLLocationCoordinate2D(latitude: 43.2965, longitude: 5.3698), phoneNumber: "0102030413", openingHours: "7h-19h", reparingCategory: .bigElec),

]



let productRparDataSample = [ProductRepairs(productName: "Lave-vaisselle", modelName: "Model X100", repairStatus: .readyToRepair, breakDownInfo: "Ne démarre plus", idRepairMan: "Réparateur 1", reparingCategory: .bigElec, date: Date()),
                             ProductRepairs(productName: "Mixeur", modelName: "MixPro 200", repairStatus: .readyToRepair, breakDownInfo: "Lame cassée", idRepairMan: "Réparateur 2", reparingCategory: .smallElec, date: Date()),
                             ProductRepairs(productName: "Ordinateur Portable", modelName: "Laptop Z15", repairStatus: .repared, breakDownInfo: "Écran fissuré", idRepairMan: "Réparateur 3", reparingCategory: .device, date: Date()),
                             ProductRepairs(productName: "Trottinette Électrique", modelName: "e-Scooter V8", repairStatus: .readyToRepair, breakDownInfo: "Batterie défectueuse", idRepairMan: "Réparateur 4", reparingCategory: .mobility, date: Date()),
                             ProductRepairs(productName: "Réfrigérateur", modelName: "CoolerMaster 3000", repairStatus: .repairing, breakDownInfo: "Ne refroidit plus", idRepairMan: "Réparateur 5", reparingCategory: .bigElec, date: Date()),
                             ProductRepairs(productName: "Grille-pain", modelName: "ToastMax 500", repairStatus: .readyToRepair, breakDownInfo: "Ne chauffe pas", idRepairMan: "Réparateur 6", reparingCategory: .smallElec, date: Date()),
                             ProductRepairs(productName: "Tablette", modelName: "Tab Pro 10", repairStatus: .repared, breakDownInfo: "Problème de charge", idRepairMan: "Réparateur 7", reparingCategory: .device, date: Date()),
                             ProductRepairs(productName: "Vélo Électrique", modelName: "e-Bike Speedster", repairStatus: .repairing, breakDownInfo: "Problème de moteur", idRepairMan: "Réparateur 8", reparingCategory: .mobility, date: Date()),
                             ProductRepairs(productName: "Lave-linge", modelName: "Washy 800", repairStatus: .readyToRepair, breakDownInfo: "Fuite d'eau", idRepairMan: "Réparateur 9", reparingCategory: .bigElec, date: Date()),
                             ProductRepairs(productName: "Machine à café", modelName: "CoffeeKing 700", repairStatus: .repared, breakDownInfo: "Ne s'allume pas", idRepairMan: "Réparateur 10", reparingCategory: .smallElec, date: Date())]




let repairmenFav = Repairmen(repairmenListe: repairmenTabFav)


let repairmenExemple = Repairmen(repairmenListe: repairmenTab)

let userTest = User(name: "Géraldine", repairlistScheduled: productRparDataSample, repairListArchive: [], co2Eco: 0, eurEco: 0, favReparmain: repairmenFav )
