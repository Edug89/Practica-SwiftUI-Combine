//
//  viewModelHero.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 28/3/23.
//

import Foundation
import Combine

final class viewModelHero : ObservableObject{
    @Published var hero: [Hero]?
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()
    
    init(testing:Bool = false){
        if (testing){
            getHerosDesting()
        }else{
            getHero(sortBy: .formerModified)
        }
    }
    
    func getHero(sortBy order: OrderBy){ //PENDIENTE DE HACER DEBUUGER
        self.status = .none
        self.status = .loading
        
        URLSession.shared.dataTaskPublisher(for: BaseNetwork().getMarvelHeroes(sortBy: .formerModified))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else{
                    debugPrint("URL: \(String(describing: $0.response.url))")
                    throw URLError(.badServerResponse)
                    
                }
                return $0.data
            }
            .decode(type: Instruction.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure:
                    self.status = Status.error(error: "Error PASA")
                    //debugPrint("Completrion . failure:")
                case.finished:
                    debugPrint("Completrion . finished")
                    self.status = .loaded
                    
                }
            } receiveValue: { instruction in
                self.hero = instruction.data.results
            }
            .store(in: &suscriptors)
    }
    
    //For UI Desing //SOLU
    func getHerosDesting(){
        let hero1 = Hero(id: 1, name: "SOLUCION1", description: "prueba", modified: "", thumbnail: Thumbnail(path: "thubpath", thumbnailExtension: .jpg), resourceURI: "prueba", comics: Comics(available: -5, collectionURI: "prueba", items: [], returned: -1), series: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), stories: Stories(available: -1, collectionURI: "prueba", items: [], returned: -1), events: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), urls: [])
        
        let hero2 = Hero(id: 2, name: "SOLUCION 2", description: "prueba", modified: "", thumbnail: Thumbnail(path: "thubpath", thumbnailExtension: .jpg), resourceURI: "prueba", comics: Comics(available: -5, collectionURI: "prueba", items: [], returned: -1), series: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), stories: Stories(available: -1, collectionURI: "prueba", items: [], returned: -1), events: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), urls: [])
        
        let hero3 = Hero(id: 3, name: "SOLUCION 3", description: "prueba", modified: "", thumbnail: Thumbnail(path: "thubpath", thumbnailExtension: .jpg), resourceURI: "prueba", comics: Comics(available: -5, collectionURI: "prueba", items: [], returned: -1), series: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), stories: Stories(available: -1, collectionURI: "prueba", items: [], returned: -1), events: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), urls: [])
        
        let hero4 = Hero(id: 4, name: "SOLUCION 4", description: "prueba", modified: "", thumbnail: Thumbnail(path: "thubpath", thumbnailExtension: .jpg), resourceURI: "prueba", comics: Comics(available: -5, collectionURI: "prueba", items: [], returned: -1), series: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), stories: Stories(available: -1, collectionURI: "prueba", items: [], returned: -1), events: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), urls: [])
        
        self.hero = [hero1, hero2, hero3, hero4]
    }
    
}
