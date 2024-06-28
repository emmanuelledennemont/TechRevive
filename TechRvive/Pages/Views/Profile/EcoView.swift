//
//  EcoView.swift
//  TechReviveCristina
//
//  Created by Cristina Casañas on 27/6/24.
//

import SwiftUI

import SwiftUI

struct EcoView: View {
    let icon: String
    let title: String
    let value: String
    let backgroundColor: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack {
                    Circle()
                        .frame(height: 40 )
                        .foregroundColor(Color(.green))
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.white)
                        .frame(width: 24, height: 24)
                    
                }
                Spacer()
                Text(value)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            Spacer().frame(height: 8)
            Text(title)
                .font(.headline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(UIColor.systemGray6))
        //.cornerRadius(10)
        
        .clipShape(RoundedRectangle(cornerRadius: 10))    }
}


#Preview {
    EcoView(icon: "", title: "", value: "", backgroundColor: .blue )
}
