//
//  ProfileView.swift
//  TechReviveCristina
//
//  Created by Cristina Casañas on 27/6/24.
//



import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var user : User
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Profil")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.leading)
                    
                    HStack(spacing: 16) {
                        StatView(imageName: "calendar", title: "Aujourd'hui", value: user.howManyToday().description, backgroundColor: (user.howManyToday() > 0) ? Color(.orange): Color(.systemGray))
                        StatView(imageName: "calendar", title: "Programmé", value: "\(user.repairlistScheduled.count)", backgroundColor: (user.repairlistScheduled.count > 0) ? Color(.orange): Color(.systemGray))
                    }
                    .padding(.horizontal)
                    
                    StatView(imageName: "tray", title: "Archivé", value: "\(user.repairListArchive.count)", backgroundColor: (user.repairListArchive.count > 0) ? Color(.orange): Color(.systemGray))
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
                        ForEach(user.favReparmain.repairmenListe) { repairmain in

                            FavoriteView(imageName: repairmain.image, name: repairmain.name, address:"" )


                        }
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
    ProfileView().environment(userTest)
}

