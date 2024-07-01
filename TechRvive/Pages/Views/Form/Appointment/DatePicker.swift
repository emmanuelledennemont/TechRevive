import SwiftUI

struct DatePickerView: View {
    @Binding  var selectedDate : Date 
   // @State private var originalDate = Date() // Pour stocker la date d'origine en cas d'annulation
    


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

                 // Réduire le padding en bas du bouton




            }
            .padding()
            .environment(\.locale, Locale(identifier: "fr_FR"))

            
        } // Définir la langue française par défaut
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short // Inclure l'heure dans l'affichage du texte
        return formatter
    }()
}



#Preview {
    DatePickerView(selectedDate: .constant(Date()) )
}
