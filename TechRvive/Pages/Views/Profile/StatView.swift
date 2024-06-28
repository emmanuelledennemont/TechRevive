//
//  StatView.swift
//  TechReviveCristina
//
//  Created by Cristina Casañas on 27/6/24.
//

import SwiftUI

struct StatView: View {
    let imageName: String
    let title: String
    let value: String
    let backgroundColor: Color
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    ZStack {
                        Circle()
                            .frame(height: 40 )
                            .foregroundColor(Color(.systemGray2))
                        Image(systemName: imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.white)
                            .frame(width: 24, height: 24)
                        
                    }
                    
                      
                    Spacer()
                    Text(value)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                Spacer().frame(height: 8)
                Text(title)
                    .font(.headline)
                    .foregroundColor(.gray)
                    
            }
           
            
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(UIColor.systemGray6))
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    StatView(imageName: "pencil", title: "test", value: "test", backgroundColor: .blue)
}
