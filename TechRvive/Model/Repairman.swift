//
//  Repairman.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

import Foundation
import CoreLocation

struct Repairman : Identifiable {
    let id =  UUID()
    var name : String
    var info : String
    var adress : CLLocationCoordinate2D
    var phoneNumber : String
    var openingHours : String
    var reparingCategory : ReparingCategory





    func getadress() -> String {
        let cordonateCLocation = CLLocation(coordinate: adress, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: Date())
        let geocoder = CLGeocoder()
        var adressString = ""
        geocoder.reverseGeocodeLocation(cordonateCLocation) { place, error in
            if let safeError = error {
                adressString = "Pas de position trouvé\n veuillez réessayer "
            }
            else if let safePlace = place {
              
                for index in safePlace{
                    adressString += index.name ?? "-"
                    adressString += "\n \(index.postalCode ?? "-")"
                    adressString += index.locality ?? "-"

                }
            }
        }
        return adressString
    }

}








