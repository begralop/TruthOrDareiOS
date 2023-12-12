//
//  NeverHaveIEverRepository.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 7/12/23.
//

import Foundation
struct NeverHaveIEverRepository {
    let neverHaveIEverRemoteService: NeverHaveIEverRemoteService

    init(neverHaveIEverRemoteService: NeverHaveIEverRemoteService) {
        self.neverHaveIEverRemoteService = neverHaveIEverRemoteService
    }
    
    func getNeverHaveIEver() async throws -> [NeverHaveIEverQuestion] {
        return try await neverHaveIEverRemoteService.getNeverHaveIEver()
    }
}
