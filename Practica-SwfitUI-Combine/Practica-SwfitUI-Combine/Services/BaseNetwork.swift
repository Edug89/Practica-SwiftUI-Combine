//
//  BaseNetwork.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 26/3/23.
//

import Foundation

//Datos server
enum server:String{
    case ts = "1"
    case apikey = "e332a6e423ff9b702d1b0bbecfdc4970"
    case hash = "a59273a735ad3a611f56d4b3b5ccc9df"
}

enum HTTPMethods:String {
    case post = "POST"
    case get = "GET"
    case content = "aplication/json"
    
}

enum EndPoints: String {
    case url = "https://gateway.marvel.com"
    case hero = "/v1/public/characters"
    case series = "/v1/public/characters/{characterId}/series" //Pendiente de configurar en postman
}

enum OrderBy: String {
    case formerModified = "-modified"
    case recentModified = "modified"
    case startYear = "startYear"
}


struct BaseNetwork{
    
    func getMarvelHeroes(sortBy orderMethod: OrderBy) -> URLRequest{
        
        //URL generation
        let accessAuth = "?ts=\(server.ts.rawValue)&apikey=\(server.apikey.rawValue)&hash=\(server.hash.rawValue)"
        let sortBy = "&orderBy=\(orderMethod.rawValue)"
        let urlString = "\(EndPoints.url.rawValue)\(EndPoints.hero.rawValue)\(accessAuth)\(sortBy)"
        let url = URL(string: urlString)
        
        //Request
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.get.rawValue
        
        return request
        
    }
}


