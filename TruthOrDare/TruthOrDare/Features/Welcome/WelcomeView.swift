//
//  WelcomeView.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 14/11/23.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var isPlayWelcomeViewActive = false
    @State private var isPlayNHIEWelcomeViewActive = false
    @EnvironmentObject var coordinator: Coordinator
    @State private var selection: String? = nil

    var body: some View {

        NavigationStack {
            ZStack {
                Image("BackgroundImage")
                    .resizable()
                    .frame(width: 1000, height: 1000)
                    .opacity(0.88)

                VStack {
                    Text(NSLocalizedString("welcome_view_text", comment: ""))
                        .font(.title)
                        .foregroundColor(Color.black)
                        .padding(.top, 335)
                        .multilineTextAlignment(.center)
                        .bold()
                        .minimumScaleFactor(0.5)
                    
                    Button(action: {
                        isPlayWelcomeViewActive = true
                    }) {
                        Text(NSLocalizedString("btn_play_welcome_view", comment: ""))
                            .frame(width: 200, height: 60)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                    }
                    .padding(.top, 28)
                    .navigationDestination(isPresented: $isPlayWelcomeViewActive) {
                        PlayersView()
                    }

                    Button(action: {
                        isPlayNHIEWelcomeViewActive = true
                    }) {
                    Text(NSLocalizedString("btn_play_nhie_welcome_view", comment: ""))
                        .font(.custom("custom_font", size: 18))
                        .frame(width: 160, height: 60)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                    }
                    .padding(.top, 28)
                    .navigationDestination(isPresented: $isPlayNHIEWelcomeViewActive) {
                        coordinator.makeNeverHaveIEverView()
                    }
                    Spacer()

                }
                .padding()
            }
        }
    }
}

#Preview {
    WelcomeView()
        .environmentObject(Coordinator())
}
