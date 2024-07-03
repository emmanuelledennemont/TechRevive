import SwiftUI
import MapKit

struct ReparationViewDetails: View {

    var productRepair: ProductRepairs
    var repairman : Repairman {
        productRepair.findRepairman() ?? Repairman(name: "-", info: "-", adress: CLLocationCoordinate2D(), phoneNumber: "-", openingHours: "_", reparingCategory: .device, image: "")
    }
    @State private var address = ""

    var body: some View {
        HStack() {
            VStack( spacing: 10) {
                VStack(alignment: .leading, spacing: 5 ){
                    ListItemCard(imageName:repairman.image, name: repairman.name, address: address, actionButtonVisibility: false)
                    Divider()
                    ReparationListItemView(productRepair: productRepair, displayProblem: false)
                }



                VStack(alignment: .leading , spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Votre Réparation")
                            .font(.title2)
                            .bold().padding(.bottom,10).padding(.top,20)


                        ReparationStatusView(productRepair: productRepair, descriptionPanne: productRepair.breakDownInfo)
                    }
                    
                    VStack(
                        alignment: .leading,
                        spacing: 10
                    ) {
                        Text("Détail de la panne")
                            .font(.title2)
                            .bold().padding(.top, 20).padding(.bottom, 10)




                        ZStack(alignment: .topLeading) {

                        RoundedRectangle(cornerRadius: 25).stroke(.gray, lineWidth: 0).background(Color(.systemGray6)).clipShape(RoundedRectangle(cornerRadius: 10)).frame( width : 360 , height : 90 )


                            HStack  {

                                DescriptionCard(text: productRepair.breakDownInfo)



                            }

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
                    }.padding(.vertical)

                }
                Spacer()
            }
            .padding()
            
        }.task {
            address = await repairman.getadress()
        }

    }
    
    
}

//struct ReparationViewDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        ReparationViewDetails(productRepair: productRparDataSample[0])
//    }
//}
