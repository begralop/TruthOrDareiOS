//
//  QuestionView.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 23/11/23.
//

import SwiftUI

struct QuestionView: View {
    
    @StateObject private var viewModel: QuestionViewModel
    @EnvironmentObject var coordinator: Coordinator
    @State private var questionText: String = ""
    @State private var dataLoaded: Bool = false
    @State private var isPlaySelectTruthOrDareViewActive = false

    let truthOrDare: String
    
    init(viewModel: QuestionViewModel, truthOrDare: String) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.truthOrDare = truthOrDare
    }
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                ZStack {
                    Image("BackgroundImage")
                        .resizable()
                        .frame(width: 1000, height: 1000)
                        .opacity(0.88)
                    
                    VStack {
                        Spacer()
                        Text(questionText)
                            .font(Font.custom("Alex-Murphy-Solid", size: 50))                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
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
                            coordinator.isQuestionViewActive = false
                            isPlaySelectTruthOrDareViewActive = true
                        }) {
                            Text(NSLocalizedString("btn_next_questions_view", comment: ""))
                                .font(Font.custom("Alex-Murphy-Solid", size: 40))
                                .frame(width: 200, height: 80)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(12)
                        }
                        .padding(.top, 80)
                        .navigationDestination(isPresented: $isPlaySelectTruthOrDareViewActive) {
                            SelectTruthOrDareView()
                        }
                        Spacer()
                    }
                }
            }
        }
        .task {
                await verifyTruthOrDare(truthOrDare: truthOrDare)
            }
        .alert("Error", isPresented: Binding.constant(viewModel.error != nil)) {
                Button("OK") {}
                Button("Retry") {
                    Task {
                        await verifyTruthOrDare(truthOrDare: truthOrDare)
                    }
                }
            } message: {
                Text(viewModel.error?.localizedDescription ?? "")
            }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {}
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func verifyTruthOrDare(truthOrDare: String) async {
        if truthOrDare == "1" {
            await viewModel.getTruth()
            if let firstTruthQuestion = viewModel.truth?.translations.es {
                questionText = firstTruthQuestion
            } else {
                questionText = NSLocalizedString("N/A", comment: "")
            }
        }
        if truthOrDare == "2" {
            await viewModel.getDare()
            if let firstDareQuestion = viewModel.dare?.translations.es {
                questionText = firstDareQuestion
            } else {
                questionText = NSLocalizedString("N/A", comment: "")
            }
        }
        dataLoaded = true
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeQuestionView(truthOrDare: "")
        .environmentObject(coordinator)
}
