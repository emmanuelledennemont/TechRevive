//
//  User.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

import Foundation

struct User {
    let id = UUID()
    var name: String
    var repairlistScheduled : [ProductRepairs]
    var repairListArchive : [ProductRepairs]
    var co2Eco : Double
    var eurEco : Double
    var favReparmain : Repairmen


}
