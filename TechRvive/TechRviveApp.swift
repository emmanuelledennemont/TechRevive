//
//  TechRviveApp.swift
//  TechRvive
//
//  Created by Emmanuelle  Dennemont on 21/06/2024.
//

import SwiftUI

@main
struct TechRviveApp: App {
    var body: some Scene {
        WindowGroup {
            //LandingPage()
            MapView(repairmen: repairmenExemple)
        }
    }
}
