//
//  BaseNetwork.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 26/3/23.
//

import Foundation

let server = "https://gateway.marvel.com"

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let conten = "aplication/json"
    
}

enum endpoint: String {
    case characters = "/v1/public/characters"
    case series = "/v1/public/characters/{characterId}/series" //Pendiente de configurar en postman
}


