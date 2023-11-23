//
//  APIResponse.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 23/11/23.
//
import Foundation

struct APIResponse<T: Decodable>: Decodable {
    let results: [T]
}
