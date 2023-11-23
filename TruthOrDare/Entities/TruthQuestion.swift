//
//  TruthQuestion.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 23/11/23.
//

import Foundation

struct TruthQuestion: Decodable {
    let id, question: String
    let translations: TranslationsResponse

    static var example: TruthQuestion {
        return TruthQuestion(
            id:"l75qocvngv44", question:"What piece of art has had a large impact on you?", translations: TranslationsResponse(
                es: "¿Qué obra de arte ha tenido un gran impacto en ti?",
                fr: "Quelle œuvre d'art a eu un grand impact sur vous ?"
            )
        )
    }
}
