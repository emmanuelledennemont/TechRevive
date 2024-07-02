//
//  Repairmen.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 25/06/2024.
//

import Foundation
import MapKit

struct Repairmen  {
    var repairmenListe : [Repairman]


    func findRepairmen(id : UUID) -> Repairman? {
        for repairman in repairmenListe{
            if repairman.id == id {
                return repairman
            }
        }
        return nil
    }


    func filter( categorie : ReparingCategory?, recycle : Bool) -> Repairmen {


        let filterList =  self.repairmenListe.filter { repaimain in
            repaimain.recycle == recycle
        }

        if let safeCategorie = categorie {

        let filterListReturn =  filterList.filter { repaimain in
            repaimain.reparingCategory == safeCategorie
            }

            return Repairmen(repairmenListe: filterListReturn)

        }
        return Repairmen(repairmenListe: filterList)
    }


//
//    func findRepairmenCity(city: String )-> [Repairman] {
//
//    }

}
