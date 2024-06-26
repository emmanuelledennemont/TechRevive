//
//  ReparingCategory.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 21/06/2024.
//

import Foundation
import SwiftUI

enum ReparingCategory: String, CaseIterable  {
        case bigElec = "Gros électroménager"
        case smallElec = "Petit Electroménager "
        case device = "Device"
        case mobility = "e-Mobilité"
       

        var imageName: String {
            switch self {
            case .bigElec:
                return "washer.fill"
            case .smallElec:
                return "microwave.fill"
            case .device:
                return "iphone"
            case .mobility:
                return "bicycle.circle"
            }
        }
    }
