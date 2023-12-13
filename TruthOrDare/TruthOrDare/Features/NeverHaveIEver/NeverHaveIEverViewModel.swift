//
//  NeverHaveIEverViewModel.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 7/12/23.
//

import Foundation

class NeverHaveIEverViewModel: ObservableObject {
    
    private let neverHaveIEverRepository: NeverHaveIEverRepository
    
    @Published var isLoading = false
    @Published var neverHaveIEver: NeverHaveIEverQuestion?

    @Published var error: Error?
    
    init(neverHaveIEverRepository: NeverHaveIEverRepository) {
        self.neverHaveIEverRepository = neverHaveIEverRepository
    }
    
    @MainActor
    func getNeverHaveIEver() async {
        error = nil
        isLoading = true
        
        do {
            neverHaveIEver = try await neverHaveIEverRepository.getNeverHaveIEver()
        } catch (let error) {
            self.error = error
        }
        
        isLoading = false
    }
}
