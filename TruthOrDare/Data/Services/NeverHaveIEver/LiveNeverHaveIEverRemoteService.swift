//
//  LiveNeverHaveIEverRemoteService.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 7/12/23.
//

import Foundation
struct LiveNeverHaveIEverRemoteService: NeverHaveIEverRemoteService {
    
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getNeverHaveIEver() async throws -> [NeverHaveIEverQuestion] {
        let response: APIResponse<NeverHaveIEverQuestion> = try await networkClient.getCall(url: NetworkConstants.neverHaveIEverQuestionUrl, queryParams: nil)
        
        return response.results
    }
}
