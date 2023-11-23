//
//  TruthRepository.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 23/11/23.
//

import Foundation
struct TruthRepository {
    let remoteService: TruthRemoteService
    
    init(remoteService: TruthRemoteService) {
        self.remoteService = remoteService
    }
    
    func getTruth() async throws -> [TruthQuestion] {
        return try await remoteService.getTruth()
    }
}
