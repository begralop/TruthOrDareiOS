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

    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                Text(viewModel.neverHaveIEver?.first?.question ?? "N/A")
            }
        }.task {
            await viewModel.getNeverHaveIEver()
            print(viewModel.neverHaveIEver?.first ?? "")
        }.alert("Error", isPresented: Binding.constant(viewModel.error != nil)) {
            Button("OK") {}
            Button("Retry") {
                Task {
                    await viewModel.getNeverHaveIEver()
                }
            }
        } message: {
            Text(viewModel.error?.localizedDescription ?? "")
        }    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeNeverHaveIEverView()
        .environmentObject(coordinator)
}

