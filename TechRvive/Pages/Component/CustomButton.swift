//
//  CustomButton.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 28/06/2024.
//

import SwiftUI


struct CustomButton: View {
    let title: String
    let action: () -> Void
    let isFilled: Bool

    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(isFilled ? .white : .orange)
                .frame(maxWidth: 300)
                .padding()
                .background(isFilled ? Color.orange : Color.clear)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.orange, lineWidth: isFilled ? 0 : 2)
                )
        }
    }
}

#Preview {
    VStack {
        CustomButton(title: "flilled", action: {
        }, isFilled: true )
//        CustomButton(title: "Unflilled", action: {
//        }, isFilled: false )


    }



}
