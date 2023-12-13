//
//  DareRemoteService.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 7/12/23.
//

import Foundation
protocol DareRemoteService {
    func getDare() async throws -> DareQuestion
}
