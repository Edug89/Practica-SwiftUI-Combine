//
//  SeriesModel.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 31/3/23.
//

import Foundation

// MARK: - Welcome
struct Serie: Codable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: SeriesDataClass
}

// MARK: - DataClass
struct SeriesDataClass: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Series]
}

// MARK: - Result
struct Series: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let resourceURI: String
    let urls: [URLElement]
    let startYear, endYear: Int
    let rating, type: String
    let modified: String
    let thumbnail: Thumbnail
    let creators: Creators
    let characters: Characters
    let stories: Stories
    let comics, events: Characters
    //let next, previous: (any Hashable)?
}

// MARK: - Characters
struct Characters: Codable {
    let available: Int
    let collectionURI: String
    let items: [CharactersItem]
    let returned: Int
}

// MARK: - CharactersItem
struct CharactersItem: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Creators
struct Creators: Codable {
    let available: Int
    let collectionURI: String
    let items: [CreatorsItem]
    let returned: Int
}

// MARK: - CreatorsItem
struct CreatorsItem: Codable {
    let resourceURI: String
    let name: String
    let role: String
}



enum TypeEnum: String, Codable {
    case cover = "cover"
    case interiorStory = "interiorStory"
}


