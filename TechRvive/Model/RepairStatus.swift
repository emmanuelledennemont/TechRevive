//
//  RepairStatus.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

enum RepairStatus: Int, CaseIterable {
    case readyToRepair = 0
    case repairing
    case repared

    var status: String {
        switch self {
        case .readyToRepair:
            return "À réparer"
        case .repairing:
            return "En réparation"
        case .repared:
            return "Déjà réparé"
        }
    }
}
