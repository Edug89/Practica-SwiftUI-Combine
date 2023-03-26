//
//  HeroModel.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 26/3/23.
//

import Foundation

struct Hero: Codable, Identifiable {
    var id: UUID
    var name: String
    var description: String
    var photo: String
    var series: String
}

struct HerosFilter: Codable {
    var name: String
} // for server calls
