//
//  ProductRepairs.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

import Foundation
import SwiftUI
import Combine

class ProductRepairs : ObservableObject, Identifiable  {
    let id = UUID()
    @Published var productName : String
    @Published  var modelName : String
     var repairStatus : RepairStatus = .readyToRepair
    @Published var breakDownInfo : String
    @Published var idRepairMan : String
    @Published var reparingCategory : ReparingCategory
    @Published var date : Date



    init(productName: String, modelName: String, repairStatus: RepairStatus, breakDownInfo: String, idRepairMan: String, reparingCategory: ReparingCategory, date: Date){
        self.productName = productName
        self.modelName = modelName
        self.repairStatus = repairStatus 
        self.breakDownInfo = breakDownInfo
        self.idRepairMan = idRepairMan
        self.reparingCategory = reparingCategory
        self.date = date

    }

    init(productName: String, modelName: String, breakDownInfo: String, idRepairMan: String, reparingCategory: ReparingCategory, date: Date) {
        self.productName = productName
        self.modelName = modelName
        self.breakDownInfo = breakDownInfo
        self.idRepairMan = idRepairMan
        self.reparingCategory = reparingCategory
        self.date = date
    }
    
    init(){
        self.productName = ""
        self.modelName = ""
        self.breakDownInfo = ""
        self.idRepairMan = ""
        self.reparingCategory = .bigElec
        self.date = Date()
    }

    func modifyDate(date : Date){
        self.date = date
    }
}

