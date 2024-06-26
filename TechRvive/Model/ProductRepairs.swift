//
//  ProductRepairs.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

import Foundation

struct ProductRepairs : Identifiable {
    let id = UUID()
    var productName : String
    var modelName : String
    var repairStatus : RepairStatus = .readyToRepair
    var breakDownInfo : String
    var idRepairMan : String
    var reparingCategory : ReparingCategory
    var date : Date


    mutating func modifyDate(date : Date){
        self.date = date
    }


}
