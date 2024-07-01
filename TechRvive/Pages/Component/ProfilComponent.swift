//
//  ProfilComponent.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 01/07/2024.
//

import SwiftUI

struct ProfilComponent: View {

    @EnvironmentObject var user : User

    var body: some View {

        HStack (spacing : 20){
            Image(user.image).resizable().aspectRatio(contentMode: .fit).clipShape(RoundedRectangle(cornerRadius: 10)).frame( width : 50, height: 50)
            VStack(alignment :. leading) {
                Text(user.name).font(.headline)
                Text(user.adressMail).font(.caption).foregroundStyle(.gray)
                Text(user.telephone).font(.caption).foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    ProfilComponent().environment(userTest)
}
