//
//  MockDareRemoteService.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 7/12/23.
//

import Foundation
struct MockDareRemoteService: DareRemoteService {
    func getDare() async throws -> DareQuestion {
        return .example
    }
}
