//
//  TechRviveApp.swift
//  TechRvive
//
//  Created by Emmanuelle  Dennemont on 21/06/2024.
//

import SwiftUI

@main
struct TechRviveApp: App {

    let user = userTest
    var body: some Scene {
        WindowGroup {


           //AppointmentView(reparman:  parisRepairmen.repairmenListe[0])
           // MapView(repairmen: repairmenExemple)
            Splash().environment(user)

        }
    }
}
