//
//  Repairmen.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 25/06/2024.
//

import Foundation
import MapKit

struct Repairmen {
    var repairmenListe : [Repairman]


    func findRepairmen(id : UUID) -> Repairman {
        for repairman in repairmenListe{
            if repairman.id == id {
                return repairman
            }
        }
        return Repairman(name: "Réparateur option", info: "Tous types de petits électroménagers", adress: CLLocationCoordinate2D(latitude: 49.5734, longitude: 7.7521), phoneNumber: "0102030414", openingHours: "10h-18h", reparingCategory: .smallElec)
    }



//
//    func findRepairmenCity(city: String )-> [Repairman] {
//
//    }

}
