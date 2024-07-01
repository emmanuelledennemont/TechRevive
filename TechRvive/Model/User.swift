//
//  User.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

import Foundation

class User : Observable, ObservableObject {
    let id = UUID()
    var image : String
   @Published var name: String
    @Published  var repairlistScheduled : [ProductRepairs]
    @Published  var repairListArchive : [ProductRepairs]
    @Published var co2Eco : Double
    @Published  var eurEco : Double
    @Published  var favReparmain : Repairmen
     var adressMail : String
     var telephone : String



    init(image: String, name: String, repairlistScheduled: [ProductRepairs], repairListArchive: [ProductRepairs], co2Eco: Double, eurEco: Double, favReparmain: Repairmen, adressMail: String, telephone: String) {
        self.image = image
        self.name = name
        self.repairlistScheduled = repairlistScheduled
        self.repairListArchive = repairListArchive
        self.co2Eco = co2Eco
        self.eurEco = eurEco
        self.favReparmain = favReparmain
        self.adressMail = adressMail
        self.telephone = telephone
    }




    func howManyToday() -> Int {
        let dateFormatter = DateFormatter()
        var count = 0
        for productRepair in repairlistScheduled {
        print(productRepair.date)
        print(Date())
            if dateFormatter.string(from:productRepair.date) == dateFormatter.string(from: Date()) {

                count += 1

            }


        }
        return count
    }
}
