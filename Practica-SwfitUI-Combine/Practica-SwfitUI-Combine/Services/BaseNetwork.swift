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

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let content = "aplication/json"
    
}

enum Endpoint: String {
    case url = "https://gateway.marvel.com"
    case hero = "/v1/public/characters"
    case series = "/v1/public/characters/{characterId}/series" //Pendiente de configurar en postman
}


//let params: [String: Any] = [
//    "apikey": server.apikey.rawValue,
//    "ts": server.ts.rawValue,
//    "hash": server.hash.rawValue,
//    "parameters": Hero(from: Decoder.self, as! Decoder)
//]
//
//do {
//    request.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
//} catch let error {
//    print("Error serializing parameters: \(error.localizedDescription)")
//}
//
//let session = URLSession.shared
//let task = session.dataTask(with: request) { data, response, error in
//    if let error = error {
//        print("Error: \(error.localizedDescription)")
//        return
//    }
//    
//    guard let data = data else {
//        print("No data returned from server")
//        return
//    }
//    
//    do {
//        let json = try JSONSerialization.jsonObject(with: data, options: [])
//        print("Response JSON: \(json)")
//    } catch let error {
//        print("Error serializing JSON response: \(error.localizedDescription)")
//    }
//}
//
//task.resume()






