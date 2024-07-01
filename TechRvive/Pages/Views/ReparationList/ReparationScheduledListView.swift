// ContentView.swift


import SwiftUI

struct ReparationScheduledListView: View {
    @EnvironmentObject  var user : User

    var body: some View {
        NavigationStack {
            ScrollView() {
                ForEach(user.repairlistScheduled) { repair in

                        VStack {
                            HStack {

                                    createDatePicker(
                                        label: "Date",
                                        date: repair.date,
                                        displayedComponents: [.date]
                                    ) { newDate in

                                    }.disabled(true)

                                    Spacer()
                                        .padding()
                                    
                                    createDatePicker(
                                        label: "Heure",
                                        date: repair.date,
                                        displayedComponents: [.hourAndMinute]
                                    ) { newDate in

                                    }.disabled(false)

                            }
                            .padding(.top)

                            Divider()
                                .background(Color.gray)
                                .padding(.horizontal)
                            
                            HStack(alignment: .center) {
                                ComponentElementsTypeOfReperman(imageName:  repair.reparingCategory.imageName, background: false, color: true)


                                VStack(alignment: .leading) {
                                    Text(repair.findRepairmanName())
                                        .font(.title3)
                                        .bold()

                                    Text(repair.productName)
                                        .foregroundColor(.gray)
                                }

                                Spacer()

                                NavigationLink(destination: DetailView()) {
                                    HStack(spacing: 5) {
                                        Text("Voir plus")
                                            .foregroundColor(.orange)
                                            .underline()

                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.orange)
                                    }
                                }
                            }
                            .padding()
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .modifier(BottomShadowModifier(radius: 2, yOffset: 2))

                    .padding(.horizontal)
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle("Mes Prochain RDV ")
        }
    }
    
    private func createDatePicker(
        label: String,
        date: Date,
        displayedComponents: DatePicker.Components,
        onDateChange: @escaping (Date) -> Void
    ) -> some View {
        DatePicker(label, selection: Binding<Date>(
            get: { date },
            set: { newDate in
                onDateChange(newDate)
            }
        ), displayedComponents: displayedComponents)
        .labelsHidden()
        .datePickerStyle(.compact)
        .environment(\.locale, Locale(identifier: "fr_FR")) // Utilisation de la locale française
        .padding(.horizontal)
    }
}



struct DetailView: View {

    @State var isPresented = false
    @State var dismisToggle = false
    var body: some View {
        ZStack {
            Button(action: {
                isPresented.toggle()

            }, label: {
                Text("dismiss")
            })
            .navigationBarTitle("Détails", displayMode: .inline)
            if isPresented {
                CustomAlertView(show: $dismisToggle)
            }
        }    }
}

struct BottomShadowModifier: ViewModifier {
    var radius: CGFloat
    var yOffset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geometry in
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: geometry.size.width, height: geometry.size.height + yOffset)
                        .shadow(color: Color.black.opacity(0.1), radius: radius, x: 0, y: yOffset)
                }
            )
    }
}

#Preview {
    ReparationScheduledListView()
}
