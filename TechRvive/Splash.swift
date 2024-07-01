//
//  ContentView.swift
//  AnimatedScreen
//
//  Created by Emmanuelle  Dennemont on 30/06/2024.
//

import SwiftUI

struct Splash: View {
    @State var isHomeRootScreen = false
    @State var showOrange = false
    @State var scaleAmount: CGFloat = 4 // Increased initial size
    
    var body: some View {
        ZStack {
            if showOrange {
                Color.orange
                    .ignoresSafeArea()
            } else {
                Color("orange")
                    .ignoresSafeArea()
            }
            
            if isHomeRootScreen {
                Home()
            } else {
                Image("Recurso 1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(scaleAmount)
                    .frame(width: 25)
            }
        }
        .onAppear {
            // Initial beat effect
            withAnimation(Animation.easeInOut(duration: 0.5).repeatCount(3, autoreverses: true)) {
                scaleAmount = 4.4 // Increased to match the initial size adjustment
            }
            
            // Continue with the rest of the animations after the beat effect
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                // Shrink the icon less drastically
                withAnimation(.easeOut(duration: 1)) {
                    scaleAmount = 3 // Adjusted to a less drastic shrink
                }
                
                // Enlarge the logo more slowly but to a smaller size
                withAnimation(.easeInOut(duration: 2).delay(1)) {
                    scaleAmount = 10 // Kept to a smaller value for enlargement
                }
                
                // Change to orange color after the animations are done
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation(.easeInOut(duration: 2)) { // Increased duration for slower transition
                        showOrange = true
                    }
                }
                
                // Switch to home screen after a brief delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // Adjusted to allow time for slower transition
                    isHomeRootScreen = true
                }
            }
        }
    }
}

#Preview {
    Splash()
}
