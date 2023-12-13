//
//  HttpError.swift
//  RickAndMorty
//
//  Created by Marcos Angel Calvo García on 30/10/23.
//

import Foundation

enum NetworkError: Error {
    case nilResponse
    case badUrl
    case encoding
    case response(Int)
}
