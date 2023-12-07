//
//  TruthRepository.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 23/11/23.
//

import Foundation
struct TruthOrDareRepository {
    let truthRemoteService: TruthRemoteService
    let dareRemoteService: DareRemoteService

    init(truthRemoteService: TruthRemoteService, dareRemoteService: DareRemoteService) {
        self.truthRemoteService = truthRemoteService
        self.dareRemoteService = dareRemoteService
    }
    
    func getTruth() async throws -> [TruthQuestion] {
        return try await truthRemoteService.getTruth()
    }
    
    func getDare() async throws -> [DareQuestion] {
        return try await dareRemoteService.getDare()
    }
}
