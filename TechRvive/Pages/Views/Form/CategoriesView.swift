//
//  ContentView.swift
//  Categories
//
//  Created by Emmanuelle  Dennemont on 21/06/2024.
//

import SwiftUI

struct CategoriesView: View {
    @State private var selectedCategory = ReparingCategory.bigElec

    let categories = ReparingCategory.allCases

    var body: some View {
        VStack(alignment: .leading, spacing: 0) { // Aligner tout le contenu à gauche avec moins d'espacement


            HStack(spacing: 20) {
                ForEach(categories) { category in
                    CategoryButton(category: category, selectedCategory: $selectedCategory)
                }
            }

            .background(
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
            )
            .padding(.horizontal) // Ajouter du padding autour de la carte
            .frame(maxWidth: .infinity) // Aligner la carte à gauche
        }
        .padding() // Padding global pour la VStack principale
    }
}

struct CategoryButton: View {
    var category: ReparingCategory
    @Binding var selectedCategory: ReparingCategory

    var body: some View {
        Button(action: {
            selectedCategory = category
        }) {
            VStack {

                ComponentElementsTypeOfReperman(imageName: category.imageName, background: true, color: selectedCategory == category)

                Text(category.rawValue)
                    .font(.caption)
                    .foregroundColor(selectedCategory == category ? .orange : .black)

            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
#Preview {
    CategoriesView()
}
