//
//  MockTruthRemoteService.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 23/11/23.
//

import Foundation
struct MockTruthRemoteService: TruthRemoteService {
    
    func getTruth() async throws -> [TruthQuestion] {
        return [.example]
    }
}
