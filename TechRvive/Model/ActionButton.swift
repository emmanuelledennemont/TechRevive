//
//  ActionButton.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

import Foundation

enum ActionButton: String, CaseIterable {
    case nav = "Itinéraire"
    case rdv = "RDV"
    case call = "Appel"
    case fav = "Favori"

    var imageName: String {
        switch self {
        case .nav:
            return "arrow.uturn.right.square.fill"
        case .rdv:
            return "calendar"
        case .call:
            return "phone.fill"
        case .fav:
            return "start"
        }
    }
}
