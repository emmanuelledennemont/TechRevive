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
    var repairStatus : RepairStatus = .repared
    @Published var breakDownInfo : String
    @Published var idRepairMan : UUID
    @Published var reparingCategory : ReparingCategory
    @Published var date : Date
    @Published var isValid = false



    init(productName: String, modelName: String, repairStatus: RepairStatus, breakDownInfo: String, idRepairMan: UUID, reparingCategory: ReparingCategory, date: Date){
        self.productName = productName
        self.modelName = modelName
        self.repairStatus = repairStatus 
        self.breakDownInfo = breakDownInfo
        self.idRepairMan = idRepairMan
        self.reparingCategory = reparingCategory
        self.date = date

    }

    init(productName: String, modelName: String, breakDownInfo: String, idRepairMan: UUID, reparingCategory: ReparingCategory, date: Date) {
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
        self.idRepairMan = UUID()
        self.reparingCategory = .bigElec
        self.date = Date()
    }

    func checkText()  {

        isValid = false




    }



    func fliedFunc () {
        guard !productName.isEmpty, !breakDownInfo.isEmpty  else {


            return
        }
        isValid = true

    }

    func findRepairman() -> Repairman? {
        return repairmenExemple.findRepairmen(id: idRepairMan)
    }



    func findRepairmanName() -> String {
        let repairman: Repairman? = findRepairman()
        if let safeRepairman = repairman {
             return safeRepairman.name
        }
        return "-"
    }
    }

