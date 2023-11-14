//
//  ContentView.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 13/11/23.
//

import SwiftUI
//import Lottie

struct SplashScreen: View {
    
    @State var isActive: Bool = false

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
                               // Puedes agregar cualquier lógica que desees ejecutar cuando la vista aparezca
                               DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                   withAnimation {
                                       self.isActive = true
                                    }
                               }
                           }
                        LottieView(name: Constants.loading)
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
