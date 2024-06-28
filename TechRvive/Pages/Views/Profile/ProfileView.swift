//
//  ProfileView.swift
//  TechReviveCristina
//
//  Created by Cristina Casañas on 27/6/24.
//



import SwiftUI

struct ProfileView: View {
    var user : User
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Profil")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.leading)
                    
                    HStack(spacing: 16) {
                        StatView(imageName: "calendar", title: "Aujourd'hui", value: user.howManyToday(), backgroundColor: Color(UIColor.systemGray6))
                        StatView(imageName: "calendar", title: "Programmé", value: "\(user.repairlistScheduled.count)", backgroundColor: Color(UIColor.systemGray6))
                    }
                    .padding(.horizontal)
                    
                    StatView(imageName: "tray", title: "Archivé", value: "\(user.repairListArchive.count)", backgroundColor: Color(UIColor.systemGray6))
                        .padding(.horizontal)
                    
                       
                    Text("Mes économies")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.leading)
                    
                    HStack(spacing: 16) {
                        EcoView(icon: "carbon.dioxide.cloud.fill", title: "Co2 économisé", value: "20Kg", backgroundColor: Color.white)
                        EcoView(icon: "eurosign.circle", title: "Économisé", value: "50€", backgroundColor: Color.white)
                    }
                    .padding(.horizontal)
                    
                    Text("Mes favoris")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.leading)
                    
                    VStack(spacing: 8) {
                        FavoriteView(imageName: "repair1", name: "Repartout", address: "Rue Arènes Romaines, 31100 Toulouse")
                        FavoriteView(imageName: "repair2", name: "Ryadrepar", address: "3 Rue Lucien Sampaix, 75010 Paris")
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.top)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView(user: userTest)
}

