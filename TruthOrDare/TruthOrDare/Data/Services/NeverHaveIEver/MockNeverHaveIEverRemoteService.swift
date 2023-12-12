//
//  MockNeverHaveIEverRemoteService.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 7/12/23.
//

import Foundation
struct MockNeverHaveIEverRemoteService: NeverHaveIEverRemoteService {
    func getNeverHaveIEver() async throws -> [NeverHaveIEverQuestion] {
        return [.example]
    }
}
