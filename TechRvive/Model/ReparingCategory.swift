//
//  ReparingCategory.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

import Foundation

    enum ReparingCategory: String {
        case bigElec = "Gros électroménager"
        case smallElec = "Petit Electroménager "
        case device = "Device"
        case mobility = "e-Mobilité"

        var imageName: String {
            switch self {
            case .bigElec:
                return "washer.fill"
            case .smallElec:
                return "microwave"
            case .device:
                return "iphone"
            case .mobility:
                return "bicycle"
            }
        }
    }
