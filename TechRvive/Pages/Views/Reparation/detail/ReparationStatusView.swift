//
//  ReparationStatusView.swift
//  TechReviveV1
//
//  Created by Cristina Casañas on 28/6/24.
//

import SwiftUI
import Combine

struct ReparationStatusView: View {

    var productRepair : ProductRepairs
    @State private var status: RepairStatus = .readyToRepair
    @State private var cancellable: AnyCancellable?
    var descriptionPanne : String

    let timer  = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()

    var body: some View {
        HStack {
            ProgressionView(status: $status, descriptionPanne: descriptionPanne)

            Spacer()

            CircularProgressView(status: $status)
                .frame(width: 150, height: 150)
                .padding()
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: false)) {
               // self.status = .repairing
            }
        }
        .onReceive(timer) { _ in
            cancellable = timer.sink { _ in
                if status == productRepair.repairStatus {
                    stopTimer()
                } else {

                    withAnimation {
                        switch status {
                        case .readyToRepair:
                            status = .repairing
                        case .repairing:
                            status = .repared
                        case .repared:
                            status = .repared
                        }
                    }


                }

            }

        }
    }
    func stopTimer() {
           cancellable?.cancel()
           cancellable = nil
       }
}

    #Preview {
        ReparationStatusView(productRepair: productRparDataSample[0], descriptionPanne: "Ne marche pas")
    }
