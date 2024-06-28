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

    func howManyToday() -> String {
        let dateFormatter = DateFormatter()
        var count = 0
        for productRepair in repairlistScheduled {
        print(productRepair.date)
        print(Date())
            if dateFormatter.string(from:productRepair.date) == dateFormatter.string(from: Date()) {

                count += 1

            }


        }
        return count.description
    }
}
