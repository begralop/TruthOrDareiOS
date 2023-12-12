//
//  QuestionViewModel.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 5/12/23.
//

import Foundation
class QuestionViewModel: ObservableObject {
    
    private let truthOrDareRepository: TruthOrDareRepository
    @Published var isLoading = false
    @Published var truth: [TruthQuestion] = []
    @Published var dare: [DareQuestion] = []

    @Published var error: Error?
    
    init(truthOrDareRepository: TruthOrDareRepository) {
        self.truthOrDareRepository = truthOrDareRepository
    }
    
    @MainActor
    func getTruth() async {
        error = nil
        isLoading = true
        
        do {
            truth = try await truthOrDareRepository.getTruth()
        } catch (let error) {
            self.error = error
        }
        
        isLoading = false
    }
    
    @MainActor
    func getDare() async {
        error = nil
        isLoading = true
        
        do {
            dare = try await truthOrDareRepository.getDare()
        } catch (let error) {
            self.error = error
        }
        
        isLoading = false
    }
}
