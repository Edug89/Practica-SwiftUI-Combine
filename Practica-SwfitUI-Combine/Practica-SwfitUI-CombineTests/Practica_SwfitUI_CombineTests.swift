//
//  Practica_SwfitUI_CombineTests.swift
//  Practica-SwfitUI-CombineTests
//
//  Created by Eduardo Martinez Palomino on 25/3/23.
//

import XCTest
import ViewInspector
import SwiftUI
import Combine
@testable import Practica_SwfitUI_Combine //Importando todos los codigos de la aplicación para poder hacer texts

final class Practica_SwfitUI_CombineTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHeroRowView() throws {
        let view = HeroRowView(hero: Hero(id: 1, name: "SOLUCION1", description: "prueba", modified: "", thumbnail: Thumbnail(path: "thubpath", thumbnailExtension: .jpg), resourceURI: "prueba", comics: Comics(available: -5, collectionURI: "prueba", items: [], returned: -1), series: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), stories: Stories(available: -1, collectionURI: "prueba", items: [], returned: -1), events: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), urls: []))
        //Vista no nil
        XCTAssertNotNil(view)
        
        //Número de vistas
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        //Imagen de heroe si contiene.
        let img = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(img)
        
        //Nombre heroe
        _ = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(img)
    }
    
    
    func testSeriesRowView() throws{
        let view = SeriesRowView(serie: Series(id: 145896, title: "Prueba Test Serie", description: "", resourceURI: "", urls: [], startYear: 3, endYear: 5, rating: "", type: "", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg), creators: Creators(available: 5, collectionURI: "", items: [], returned: 9), characters: Characters(available: 2, collectionURI: "", items: [], returned: 5), stories: Stories(available: 1, collectionURI: "", items: [], returned: 3), comics: Characters(available: 2, collectionURI: "", items: [], returned: 4), events: Characters(available: 5, collectionURI: "", items: [], returned: 9)))
        //Vista no nil
        XCTAssertNotNil(view)
        
        //Número de vistas
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        //Imagen de heroe si contiene.
        let img = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(img)
    }
    
    
    func testLoaderView() throws{
        let view = LoaderView()
        
        //Vista no nil
        XCTAssertNotNil(view)
        
        //Número de vistas
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        //Imagen de spinner si contiene
        let img = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(img)
        
        //Si contiene text contenido
        _ = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(img)
    }
    
    
    func testErrorView() throws{
        let view = ErrorView(error: "Testing")
            .environmentObject(viewModelHero())
        
        //Vista no nil
        XCTAssertNotNil(view)
        
        //Número de vistas
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        
        //Si contiene text contenido
        let text = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(text)
        
        //boton
        let boton = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(boton)
        try boton.button().tap()
    }
    
    
    //Testing de Modelos
    func testHeroModels() throws {
        let hero = Hero(id: 1, name: "TEST", description: "prueba", modified: "", thumbnail: Thumbnail(path: "thubpath", thumbnailExtension: .jpg), resourceURI: "prueba", comics: Comics(available: -5, collectionURI: "prueba", items: [], returned: -1), series: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), stories: Stories(available: -1, collectionURI: "prueba", items: [], returned: -1), events: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), urls: [])
        //Vista no nil
        XCTAssertNotNil(hero)
        //Name igual a TEST
        XCTAssertEqual(hero.name, "TEST")
        //id no nil
        XCTAssertNotNil(hero.id)
        
        
    func testHeroDecoding() throws {
        let jsonData = """
        {
            "id": 1011334,
            "name": "Spider-Man",
            "description": "A radioactive spider gave Peter Parker superhuman abilities.",
            "modified": "2022-03-31T18:29:04-0400",
            "thumbnail": {
                "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                "extension": "jpg"
            },
            "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011334",
            "comics": {
                "available": 364,
                "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
                "items": []
            },
            "series": {
                "available": 173,
                "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/series",
                "items": []
            },
            "stories": {
                "available": 1710,
                "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/stories",
                "items": []
            },
            "events": {
                "available": 29,
                "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/events",
                "items": []
            },
            "urls": []
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let hero = try decoder.decode(Hero.self, from: jsonData)
        
        XCTAssertEqual(hero.id, 1011334)
        XCTAssertEqual(hero.name, "Spider-Man")
        XCTAssertEqual(hero.description, "A radioactive spider gave Peter Parker superhuman abilities.")
            
    }
        
        
    func testSeriesModels() throws{
        let serie = Series(id: 145896, title: "Prueba Test Serie", description: "", resourceURI: "", urls: [], startYear: 3, endYear: 5, rating: "", type: "", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg), creators: Creators(available: 5, collectionURI: "", items: [], returned: 9), characters: Characters(available: 2, collectionURI: "", items: [], returned: 5), stories: Stories(available: 1, collectionURI: "", items: [], returned: 3), comics: Characters(available: 2, collectionURI: "", items: [], returned: 4), events: Characters(available: 5, collectionURI: "", items: [], returned: 9))
        //Vista no nil
        XCTAssertNotNil(serie)
        //titulo igual a "Prueba Test Serie"
        XCTAssertEqual(serie.title, "Prueba Test Serie")
            
        }
    }
}
