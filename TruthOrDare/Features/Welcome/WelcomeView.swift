//
//  WelcomeView.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 14/11/23.
//

import SwiftUI

struct WelcomeView: View {
        
    var body: some View {
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
                    .minimumScaleFactor(0.5) // Factor de escala mínimo

                Button(action: {
                    
                }) {
                    Text(NSLocalizedString("btn_play_welcome_view", comment: ""))
                       // .font(.custom("custom_font", size: 18))
                        .frame(width: 200, height: 60)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                }
                .padding(.top, 28)

                Button(action: {
                    // Action for "Play NHIE" button
                }) {
                    Text(NSLocalizedString("btn_play_nhie_welcome_view", comment: ""))
                        .font(.custom("custom_font", size: 18))
                        .frame(width: 160, height: 60)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                }
                .padding(.top, 28)

                Spacer()

                ProgressView()
                    .frame(width: nil, height: nil, alignment: .center)
                    .padding(.top, 28)
                    .opacity(0.0) // Set to 1.0 if you want it initially visible
            }
            .padding()
        }
    }
}

#Preview {
    
 //   let coordinator = Coordinator()
    WelcomeView()
       // .environmentObject(coordinator)
}
