//
//  ActionButtonView.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 28/06/2024.
//


import SwiftUI

struct ActionButtonView: View {
    var title: String
    var imageName: String
    var isHighlighted: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10).stroke(isHighlighted ? .orange : .gray, lineWidth: 0).background(isHighlighted ? Color.orange.opacity(0.2) : Color(.systemGray6)).clipShape(RoundedRectangle(cornerRadius: 10)).frame( width : 75 , height: 60 )
                VStack(spacing : 8) {
                    Image(systemName: imageName)
                        .foregroundColor(isHighlighted ? .orange : .gray)
                    Text(title).foregroundColor(isHighlighted ? .orange : .gray).font(.footnote)
                }
            }

        }
    }
}
