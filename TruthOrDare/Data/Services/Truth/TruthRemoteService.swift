//
//  TruthRemoteService.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 23/11/23.
//

import Foundation
protocol TruthRemoteService {
    func getTruth() async throws -> [TruthQuestion]
}
