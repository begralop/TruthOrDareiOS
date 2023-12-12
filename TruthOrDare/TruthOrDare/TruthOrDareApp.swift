//
//  TruthOrDareApp.swift
//  TruthOrDareeeeeee
//
//  Created by Belén Grande López on 13/11/23.
//

import SwiftUI

@main
struct TruthOrDareApp: App {
    
    @StateObject private var coordinator = Coordinator()

    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .environmentObject(coordinator)
        }
    }
}
