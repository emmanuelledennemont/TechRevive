import SwiftUI

struct DatePickerView: View {
    @State private var selectedDate = Date()
    @State private var originalDate = Date() // Pour stocker la date d'origine en cas d'annulation
    @State var showConfirmation = false
    var selectedCategory : ReparingCategory
    @Binding var infoRepair : ProductRepairs
    var body: some View {
        ZStack {
            VStack {


                DatePicker("Date et heure", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .accentColor(.orange) // Changer la couleur de la date sélectionnée

                Text("Date et heure sélectionnées : \(selectedDate, formatter: dateFormatter)")
                    .font(.headline)
                    .foregroundColor(.orange) // Changer la couleur du texte de la date sélectionnée
                    .padding(.vertical)

                CustomButton(title: "Confirmer", action: {
                    infoRepair.reparingCategory = selectedCategory
                    infoRepair.date = selectedDate
                    print(infoRepair.productName)
                    showConfirmation.toggle()

                    originalDate = selectedDate

                }, isFilled: true)
                .padding(.bottom, 5) // Réduire le padding en bas du bouton

                CustomButton(title: "Annuler", action: {
                    // Annuler : réinitialiser la date à sa valeur d'origine
                    selectedDate = originalDate
                }, isFilled: false)
                .padding(.top, 5) // Réduire le padding en haut du bouton


            }
            .padding()
            .environment(\.locale, Locale(identifier: "fr_FR"))

            if showConfirmation {
                CustomAlertView(show: $showConfirmation)

            }
        } // Définir la langue française par défaut
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short // Inclure l'heure dans l'affichage du texte
        return formatter
    }()
}

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
    DatePickerView(selectedCategory: .bigElec, infoRepair: .constant(productRparDataSample[0]) )
}
