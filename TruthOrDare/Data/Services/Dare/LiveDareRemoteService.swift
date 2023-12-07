//
//  LiveDareRemoteService.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 7/12/23.
//

import Foundation
struct LiveDareRemoteService: DareRemoteService {
    
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getDare() async throws -> [DareQuestion] {
        let response: APIResponse<DareQuestion> = try await networkClient.getCall(url: NetworkConstants.dareQuestionUrl, queryParams: nil)
        
        return response.results
    }
}
