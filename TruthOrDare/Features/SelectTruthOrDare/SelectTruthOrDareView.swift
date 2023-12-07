//
//  SelectTruthOrDareView.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 7/12/23.
//

import SwiftUI

struct SelectTruthOrDareView: View {
    
    @State private var playerName: String = "BELÉN"
    @State private var nameList: [String] = []

    var body: some View {
        ZStack {
                    Image("BackgroundImage")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.99)

            VStack {
                Button(action: {
                    // Acción para el botón de verdad
                }) {
                    Text(NSLocalizedString("select_btn_truth_view", comment: ""))
                        .font(.custom("custom_font", size: 24))
                        .foregroundColor(.white)
                        .frame(width: 250, height: 150)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom))
                        )
                }
                .padding([.leading, .trailing], 48)
                .padding(.bottom, 50)
                .overlay(
                    LottieView(name: LottieConstants.angel)
                                              .scaleEffect(0.13)                        .padding(.bottom, 225)
                )
                Spacer()
            }
            .padding(.top, 100)

            Text(playerName)
                .font(.custom("custom_font", size: 60))
                .bold()
                .foregroundColor(.white)
            
            Spacer()
            
            VStack {
                Button(action: {
                    // Acción para el botón de verdad
                }) {
                    Text(NSLocalizedString("select_btn_dare_view", comment: ""))
                        .font(.custom("custom_font", size: 24))
                        .foregroundColor(.white)
                        .frame(width: 250, height: 150)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom))
                        )
                }
                .padding([.leading, .trailing], 48)
                .padding(.bottom, 50)
                .overlay(
                    LottieView(name: LottieConstants.demon)
                        .scaleEffect(1)
                        .padding(.bottom, 225)
                )
            }
            .padding(.top, 550)
        }
        
        
        
        .onAppear {
            nameList = loadNameList()
            playerName = randomPlayerName()
        }
        .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            
                        }
                    }
                    .navigationBarBackButtonHidden(true)
    }
    
    func loadNameList() -> [String] {
            return UserDefaults.standard.stringArray(forKey: "NameListKey") ?? []
        }

        func randomPlayerName() -> String {
            guard !nameList.isEmpty else {
                return "BELÉN" // Valor predeterminado si la lista está vacía
            }

            return nameList.randomElement() ?? "BELÉN"
        }
}

#Preview {
    SelectTruthOrDareView()
}
