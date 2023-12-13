//
//  NeverHaveIEverRemoteService.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 7/12/23.
//

import Foundation
protocol NeverHaveIEverRemoteService {
    func getNeverHaveIEver() async throws -> NeverHaveIEverQuestion
}
