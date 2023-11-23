//
//  NeverHaveIEverQuestion.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 23/11/23.
//
import Foundation

// MARK: - NeverHaveIEverQuestion
struct NeverHaveIEverQuestion: Decodable {
    let id, question: String
    let translations: TranslationsResponse
    
    static var example: NeverHaveIEverQuestion {
        return NeverHaveIEverQuestion(
            id:"kv441ru9tkiz", question:"Never have I ever been in a relationship", translations: TranslationsResponse(
                es: "Nunca he estado en una relación",
                fr: "Je n'ai jamais été en couple"
        )
    )
    }
}
