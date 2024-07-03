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
                RoundedRectangle(cornerRadius: 10).stroke(.orange,lineWidth: 2).background(isHighlighted ? Color.orange.opacity(0.2) : .white).clipShape(RoundedRectangle(cornerRadius: 10)).frame( width : 75 , height: 60 )
                VStack(spacing : 8) {
                    Image(systemName:  isHighlighted ?  imageName+".fill" : imageName).font(.title).foregroundColor(.orange)

                    Text(title).foregroundColor(.orange).font(.footnote)                }
            }

        }
    }
}


#Preview {
    ActionButtonView(title: "Test", imageName: "star", isHighlighted: true) {

    }
}
