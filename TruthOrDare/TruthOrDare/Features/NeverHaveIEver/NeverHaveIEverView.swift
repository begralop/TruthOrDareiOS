//
//  NeverHaveIEverView.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 7/12/23.
//

import SwiftUI

struct NeverHaveIEverView: View {
    
    @StateObject var viewModel: NeverHaveIEverViewModel
    @EnvironmentObject var coordinator: Coordinator
    @State private var questionText: String = ""

    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                ZStack {
                    Image("BackgroundImage")
                        .resizable()
                        .frame(width: 1000, height: 1000)
                    VStack {
                        Text(questionText)
                            .font(Font.custom("Alex-Murphy-Solid", size: 65))
                            .foregroundColor(.white)
                            .padding()
                            .multilineTextAlignment(.center)
                            .frame(width: 325, height: 360)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom))
                            )
                        Button(action: {
                            Task {
                                await loadQuestion()
                            }
                        }) {
                            Text(NSLocalizedString("btn_next_questions_view", comment: ""))
                                .font(Font.custom("Alex-Murphy-Solid", size: 40))
                                .frame(width: 200, height: 80)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(12)
                        }
                        .padding(.top, 30)
                    }
                }
            }
        }
        .task {
            await loadQuestion()
        }
        .alert(NSLocalizedString("error_alert", comment: ""), isPresented: Binding.constant(viewModel.error != nil)) {
            Button(NSLocalizedString("confirmation_button", comment: "")) {}
            Button(NSLocalizedString("retry_button", comment: "")) {
                Task {
                    await viewModel.getNeverHaveIEver()
                }
            }
        } message: {
            Text(viewModel.error?.localizedDescription ?? "")
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(NSLocalizedString("btn_play_nhie_welcome_view", comment: ""))
                        .font(Font.custom("Alex-Murphy-Solid", size: 65))
                        .foregroundColor(Color.black)
                        .padding(.top, 24)
                }
            }
        }                    
    }
    
    func loadQuestion() async {
        await viewModel.getNeverHaveIEver()
        if let firstNhieQuestion = viewModel.neverHaveIEver?.translations.es {
            questionText = firstNhieQuestion
        } else {
            questionText = NSLocalizedString("N/A", comment: "")
        }
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeNeverHaveIEverView()
        .environmentObject(coordinator)
}

