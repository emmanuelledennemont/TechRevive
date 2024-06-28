//
//  FormView.swift
//  Formulaire2
//
//  Created by Emmanuelle  Dennemont on 25/06/2024.
//

import SwiftUI

struct FormView: View {

    @State private var appareil: String = ""
    @State private var description: String = ""

    @State private var selectedDate = Date()
    @State private var originalDate = Date()




    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                section("ApPareil") {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Appareil")
                            .foregroundColor(.black)
                            .bold()
                        TextField("Entrez le type d'appareil", text: $appareil)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                    }

                
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Description")
                        .foregroundColor(.black)
                        .bold()
                    TextEditor(text: $description)
                        .padding()
                        .frame(maxWidth: 365, minHeight: 100)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                    
                 
                }


                    CategoriesView()


            }
            .padding()
            
            // Apply padding to the VStack containing DatePickerView
            DatePickerView().padding(.horizontal)
        }
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
    }

    private func section<Content: View>(for section: FormSection, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(section.headerText)
                .font(.title2)
                .bold()
                .padding(.bottom, 10)
            content()
        }
        .padding(.horizontal, 35)
    }

    private func personalInfoField(field: FormField) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(field.label)
                .foregroundColor(.black)
                .bold()
            TextField(field.placeholder, text: binding(for: field))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
        }
        .padding(.vertical, 5)
    }

    private func binding(for field: FormField) -> Binding<String> {
        switch field {
        case .nom:
            return $name
        case .email:
            return $email
        case .phoneNumber:
            return $phoneNumber
        default:
            return .constant("")
        }
    }
}


#Preview {
    FormView()
}
