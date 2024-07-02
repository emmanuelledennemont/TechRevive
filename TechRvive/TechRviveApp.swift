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
    let modal = ModalPresentation()
    var body: some Scene {
        WindowGroup {


           //AppointmentView(reparman:  parisRepairmen.repairmenListe[0])
           // MapView(repairmen: repairmenExemple)
            Splash().environment(user).environment(modal)

        }
    }
}
