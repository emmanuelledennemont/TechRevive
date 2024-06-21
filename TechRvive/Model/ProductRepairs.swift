//
//  ProductRepairs.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

import Foundation

struct ProductRepairs : Identifiable {
    let id = UUID().uuidString
    var productName : String
    var modelName : String
    var repairStatus : RepairStatus = .readyToRepair
    var breakDownInfo : String
    var idRepairMan : String
    var reparingCategory : ReparingCategory





}
