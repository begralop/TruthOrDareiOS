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
    
    
    init(viewModel: QuestionViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
            ZStack {
                Image("BackgroundImage")
                    .resizable()
                    .frame(width: 1000, height: 1000)
                    .opacity(0.88)
                
                VStack {
                    Spacer()
                    
                    Text("\(viewModel.truth?[0].question ?? "N/A")")
                        .font(Font.custom("font_play", size: 18))
                            .foregroundColor(Color.black)
                            .padding(.horizontal, 32)
                            .padding(.top, 255)
                            .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Button(action: {
                        // Acción del botón
                    }) {
                        Text("Siguiente")
                            .font(.custom("custom_font", size: 28))
                            .foregroundColor(Color.white)
                            .frame(width: 160, height: 60)
                            .background(Image("play_button"))
                    }
                    .padding(.top, 36)
                    
                    Spacer()
                }
            }.task {
                await viewModel.getTruth()
            }.alert("Error", isPresented: Binding.constant(viewModel.error != nil)) {
                Button("OK") {}
                Button("Retry") {
                    Task {
                        await viewModel.getTruth()
                    }
                }
            } message: {
                Text(viewModel.error?.localizedDescription ?? "")
            }
        }
    }


#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeQuestionView()
        .environmentObject(coordinator)
}
