//
//  FavoriteView.swift
//  TechReviveCristina
//
//  Created by Cristina Casañas on 27/6/24.
//

import SwiftUI

struct FavoriteView: View {
    let imageName: String
    let name: String
    let address: String
    
    var body: some View {
        HStack {
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
            }

            Spacer()
            Text("Prendre RDV >")
                .foregroundColor(.orange)
                .font(.caption)
        }
        .padding(.vertical, 8)
    }
}


#Preview {
    FavoriteView(imageName: "", name: "", address: "")
}
