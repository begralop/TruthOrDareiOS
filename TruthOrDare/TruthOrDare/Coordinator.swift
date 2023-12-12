//
//  File.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 23/11/23.
//

import Foundation

class Coordinator: ObservableObject {
    
    private let truthOrDareRepository: TruthOrDareRepository
    private let neverHaveIEverRepository: NeverHaveIEverRepository
    @Published var isQuestionViewActive: Bool = false

    init(mock: Bool = false) {
        let networkClient = URLSessionNetworkClient()
        
        // MARK: Truth or Dare
        let truthRemoteService: TruthRemoteService = mock ? MockTruthRemoteService() : LiveTruthRemoteService(networkClient: networkClient)
        let dareRemoteService: DareRemoteService = mock ? MockDareRemoteService() : LiveDareRemoteService(networkClient: networkClient)

        self.truthOrDareRepository = TruthOrDareRepository(truthRemoteService: truthRemoteService, dareRemoteService: dareRemoteService)
        
        // MARK: NeverHaveIEver
        let neverHaveIEverRemoteService: NeverHaveIEverRemoteService = mock ? MockNeverHaveIEverRemoteService() : LiveNeverHaveIEverRemoteService(networkClient: networkClient)

        self.neverHaveIEverRepository = NeverHaveIEverRepository(neverHaveIEverRemoteService: neverHaveIEverRemoteService)
    }
    
    // MARK: Truth views
    func makeQuestionView(truthOrDare: String) -> QuestionView {
        return QuestionView(viewModel: makeQuestionViewModel(), truthOrDare: truthOrDare)
    }
    
    private func makeQuestionViewModel() -> QuestionViewModel {
        return QuestionViewModel(truthOrDareRepository: truthOrDareRepository)
    }
    
    func makeSelectTruthOrDareView() -> SelectTruthOrDareView {
        return SelectTruthOrDareView()
    }
    
    private func makeSelectTruthOrDareViewModel() -> SelectTruthOrDareViewModel {
        return SelectTruthOrDareViewModel()
    }
    
    // MARK: Never have i ever views
    func makeNeverHaveIEverView() -> NeverHaveIEverView {
        return NeverHaveIEverView(viewModel: self.makeNeverHaveIEverViewModel())
    }
    
    private func makeNeverHaveIEverViewModel() -> NeverHaveIEverViewModel {
        return NeverHaveIEverViewModel(neverHaveIEverRepository: neverHaveIEverRepository)
    }
}
