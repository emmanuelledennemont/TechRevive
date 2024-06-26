//
//  CoponentElements.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 25/06/2024.
//

import SwiftUI

struct ComponentElementsButtonMap: View {
    let imageName : String
    var body: some View {
        ZStack {

            Circle()
                .fill(Color.orange).frame(width: 50)
            Image(systemName: imageName).foregroundStyle(.white).font(.title)

        }
    }
}



struct ComponentElementsTypeOfReperman: View {
    let imageName : String
    let background : Bool
    let color : Bool
    @State private var colorForeground = Color(.systemGray2)

    var body: some View {
        ZStack {
            if background {
                Circle()
                    .foregroundStyle(Color(.systemGray6)).frame(width: 75)
            }

            Image(systemName: imageName).foregroundStyle(colorForeground).font(.system(size: 40))

        }
        .task {
            if color {
                colorForeground = Color(.orange)
            }
        }
    }
}


#Preview {
    ComponentElementsTypeOfReperman(imageName: "microwave.fill", background: true, color: false)
}
