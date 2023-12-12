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

    let truthOrDare: String
    
    init(viewModel: QuestionViewModel, truthOrDare: String) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.truthOrDare = truthOrDare
    }
    
    var body: some View {
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
                    
                    Text("\(questionText)")
                        .font(Font.custom("font_play", size: 18))
                        .foregroundColor(Color.black)
                        .padding(.horizontal, 32)
                        .padding(.top, 255)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Button(action: {
                        coordinator.isQuestionViewActive = false
                    }) {
                        Text("Siguiente")
                            .font(.custom("custom_font", size: 28))
                            .foregroundColor(Color.white)
                            .frame(width: 160, height: 60)
                    }
                    .padding(.top, 36)
                    
                    Spacer()
                }
            }
            .task {
                await print(viewModel.getTruth())
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
                ToolbarItem(placement: .principal) {
                    
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    func verifyTruthOrDare(truthOrDare: String) async {
        if truthOrDare == "1" {
            await viewModel.getTruth()
            if let firstTruthQuestion = viewModel.truth.first?.question {
                print(firstTruthQuestion)
                questionText = firstTruthQuestion
            } else {
                questionText = "N/A"
            }
        }

        if truthOrDare == "2" {
            await viewModel.getDare()
            if let firstDareQuestion = viewModel.dare.first?.question {
                questionText = firstDareQuestion
            } else {
                questionText = "N/A"
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
