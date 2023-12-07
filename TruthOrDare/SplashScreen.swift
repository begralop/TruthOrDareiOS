//
//  ContentView.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 13/11/23.
//

import SwiftUI
import Lottie

struct SplashScreen: View {
    
    @State var isActive: Bool = false
    @EnvironmentObject var coordinator : Coordinator

    var body: some View {
        ZStack {
            if self.isActive {
                    WelcomeView()
                } else {
                    Color.backgroundSplash.edgesIgnoringSafeArea(.all)
                    VStack {
                        Image("AppLogo")
                           .resizable()
                           .padding(.bottom, -430)
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 400, height: 400)
                           .onAppear {
                               DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                   withAnimation {
                                       self.isActive = true
                                    }
                               }
                           }
                        LottieView(name: LottieConstants.loading)
                            .scaleEffect(0.8)
                            .padding(.top, 40)
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
