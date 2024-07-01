import SwiftUI

struct ReparationViewDetails: View {

    var body: some View {
        HStack() {
            VStack(alignment: .leading, spacing: 10) {
                ListItemCard(imageName: "repairman", name: "Repartout", address: "Rue Arènes Romaines, 31100 Toulouse", actionButtonVisibility: false)
                
                VStack(alignment: .leading , spacing: 20) {
                    VStack(
                        alignment: .leading,
                        spacing: 10
                    ) {
                        Text("Votre Réparation")
                            .font(.headline)
                            .bold()
                        ReparationStatusView()
                    }
                    
                    VStack(
                        alignment: .leading,
                        spacing: 10
                    ) {
                        Text("Détail de la panne")
                            .font(.headline)
                            .bold()
                        VStack(alignment: .leading) {
                            DescriptionCard(text: "Accumulation de glace due à un joint de porte défectueux ou un système de dégivrage en panne, nécessite réparation.")
                        }
                        
                    }
                    
                    Button(action: {}) {
                        Text("Contacter le Réparateur")
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.orange)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.orange, lineWidth: 1)
                            )
                    }
                    
                }
            }
            .padding()
            
        }
      
    }
    
    
}

struct ReparationViewDetails_Previews: PreviewProvider {
    static var previews: some View {
        ReparationViewDetails()
    }
}
