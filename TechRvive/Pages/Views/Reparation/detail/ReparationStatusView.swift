//
//  ReparationStatusView.swift
//  TechReviveV1
//
//  Created by Cristina Casañas on 28/6/24.
//

import SwiftUI

struct ReparationStatusView: View {
    @State private var status: RepairStatus = .readyToRepair
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            ProgressionView(status: $status)
            
            Spacer()
            
            CircularProgressView(status: $status)
                .frame(width: 150, height: 150)
                .padding()
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: false)) {
                self.status = .repairing
            }
        }
        .onReceive(timer) { _ in
            withAnimation {
                switch status {
                case .readyToRepair:
                    status = .repairing
                case .repairing:
                    status = .repared
                case .repared:
                    status = .readyToRepair
                }
            }
        }
    }
    
}

#Preview {
    ReparationStatusView()
}
