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

}






