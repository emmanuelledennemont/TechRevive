import SwiftUI

struct CircularProgressView: View {
    @Binding var status: RepairStatus
    let lineWidth: Double = 31.1

    var body: some View {
        ZStack {
            Circle()
          
                .stroke(Color.orange.opacity(0.2), lineWidth: lineWidth)
            Circle()
                .trim(from: 0.0, to: progressAmount)
                .stroke(Color.orange, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(Angle(degrees: -90))
                .animation(.easeInOut(duration: 1), value: progressAmount)
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(.orange)
                .overlay(
                    Image(systemName: "arrow.forward")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                )
                .offset(x: 0, y: -lineWidth * 2.333)
                .rotationEffect(Angle(degrees: chevronAngle))
                .animation(.easeInOut(duration: 1), value: chevronAngle)
            VStack {
                Text("\(Int(progressAmount * 100))%")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }
        }
    }

    private var progressAmount: CGFloat {
        switch status {
        case .readyToRepair:
            return 0.0
        case .repairing:
            return 0.60
        case .repared:
            return 1.0
        }
    }

    private var chevronAngle: Double {
        switch status {
        case .readyToRepair:
            return 0.0
        case .repairing:
            return 0.60 * 360
        case .repared:
            return 1.0 * 360
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    @State private static var status = RepairStatus.readyToRepair

    static var previews: some View {
        VStack(alignment: .leading, spacing: 12) {
            Group {
                CircularProgressView(status: $status)
                    .previewDisplayName("Ready to Repair")
                
                CircularProgressView(status: .constant(.repairing))
                    .previewDisplayName("Repairing")
                
                CircularProgressView(status: .constant(.repared))
                    .previewDisplayName("Repared")
            }
            .padding()
        .previewLayout(.sizeThatFits)
        }
    }
}
