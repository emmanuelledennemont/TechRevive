//
//  FavoriteView.swift
//  TechReviveCristina
//
//  Created by Cristina Casañas on 27/6/24.
//

import SwiftUI

struct ListItemCard: View {
    let imageName: String
    let name: String
    let address: String
    
    @State var actionButtonVisibility: Bool = false
    
    var body: some View {
        HStack(alignment: .top) {
            Image(imageName)
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.body)
                    .fontWeight(.semibold)
                
                Text(address)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(1) // Pour éviter le retour à la ligne
            }
            
            Spacer()
            
            if actionButtonVisibility {
                Text("Prendre RDV >")
                    .foregroundColor(.orange)
                    .font(.caption)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ListItemCard(imageName: "repairman", name: "RepairMan", address: "Nom de la rue", actionButtonVisibility: true)
}
