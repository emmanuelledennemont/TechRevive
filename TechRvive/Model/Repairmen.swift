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


    func findRepairmen(id : UUID) -> Repairman? {
        for repairman in repairmenListe{
            if repairman.id == id {
                return repairman
            }
        }
        return nil
    }



//
//    func findRepairmenCity(city: String )-> [Repairman] {
//
//    }

}
