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

            Image(systemName: imageName).foregroundStyle(color ? Color.orange : Color(.systemGray2)).font(.system(size: 40))

        }
//        .task {
//            if color {
//                colorForeground = Color(.orange)
//            }
//        }
    }
}


struct ComponentElementsTypeOfRepairmanC: View {
    let imageName: String
    let background: Bool
    let repairStatus: RepairStatus
    @State private var colorForeground = Color(.systemGray4)

    var body: some View {
        ZStack {
            if background {
                Circle()
                    .foregroundStyle(Color(.systemGray6))
                    .frame(width: 75)
            }

            Image(systemName: imageName)
                .foregroundColor(colorForeground)
                .font(.system(size: 40))
        }
        .onAppear {
            switch repairStatus {
            case .repared:
                colorForeground = Color(.systemGray4)
            default:
                colorForeground = Color(.orange)
            }
        }
    }
}


#Preview {
    ComponentElementsTypeOfReperman(imageName: "microwave.fill", background: true, color: false)
}
