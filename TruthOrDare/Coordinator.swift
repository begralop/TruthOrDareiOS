//
//  File.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 23/11/23.
//

import Foundation

class Coordinator: ObservableObject {
    private let truthRepository: TruthOrDareRepository
    
    init(mock: Bool = false) {
        let networkClient = URLSessionNetworkClient()
        
        // MARK: Truth
        let truthRemoteService: TruthRemoteService = mock ? MockTruthRemoteService() : LiveTruthRemoteService(networkClient: networkClient)
        
        self.truthRepository = TruthOrDareRepository(remoteService: truthRemoteService)
    
    }
    
    // MARK: Truth views
    func makeQuestionView() -> QuestionView {
        return QuestionView(viewModel: makeQuestionViewModel())
    }
    
    private func makeQuestionViewModel() -> QuestionViewModel {
        return QuestionViewModel(truthOrDareRepository: truthRepository)
    }

}
