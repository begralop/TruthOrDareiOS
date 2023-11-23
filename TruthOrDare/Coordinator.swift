//
//  File.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 23/11/23.
//

import Foundation

class Coordinator: ObservableObject {
    private let truthRepository: TruthRepository
    
    init(mock: Bool = false) {
        let networkClient = URLSessionNetworkClient()
        
        // MARK: Truth
        let truthRemoteService: TruthRemoteService = mock ? MockTruthRemoteService() : LiveTruthRemoteService(networkClient: networkClient)
        
        self.truthRepository = TruthRepository(remoteService: truthRemoteService)
    
    }
    
    // MARK: Truth views
    //func makeTruthView() -> Truth {
      //  return FilmsView(viewModel: makeFilmsViewModel())
    //}

}
