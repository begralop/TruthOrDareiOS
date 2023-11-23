//
//  LiveTruthRemoteService.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 23/11/23.
//

import Foundation
struct LiveTruthRemoteService: TruthRemoteService {
    
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getTruth() async throws -> [TruthQuestion] {
        let response: APIResponse<TruthQuestion> = try await networkClient.getCall(url: NetworkConstants.truthQuestionUrl, queryParams: nil)
        
        return response.results
    }
}
