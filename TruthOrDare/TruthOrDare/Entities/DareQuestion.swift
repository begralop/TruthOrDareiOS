//
//  DareQuestion.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 23/11/23.
//

// MARK: - DareQuestionResponse
struct DareQuestion: Decodable {
    let id, question: String
    let translations: TranslationsResponse
    
    static var example: DareQuestion {
        return DareQuestion(
            id:"ku9abgpjq6wc", question:"Delete the last 10 pictures in your camera roll permanently (remove them from recently deleted too).", translations: TranslationsResponse(
                es: "Elimine las últimas 10 imágenes en el carrete de la cámara de forma permanente (elimínelas también de las eliminadas recientemente).",
                fr: "Supprimez définitivement les 10 dernières images de votre pellicule (supprimez-les également de celles récemment supprimées)."
        )
    )
    }
}
