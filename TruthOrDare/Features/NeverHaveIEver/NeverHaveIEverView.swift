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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeNeverHaveIEverView()
        .environmentObject(coordinator)}
