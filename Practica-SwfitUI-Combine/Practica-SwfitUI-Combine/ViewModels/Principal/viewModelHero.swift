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
    
    //Inicializamos funciones
    init(testing:Bool = false){
            if !testing{
                self.getHero()
            }else{
                self.getHerosDesting()
            }
        }
    
    func getHero(){ //PENDIENTE DE HACER DEBUUGER
        self.status = .loading
        
        URLSession.shared.dataTaskPublisher(for: BaseNetwork.shared.getMarvelHeroes())
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
                    debugPrint("Completrion . failure:")
//                    self.status = .error(errorMsg: "Error: Failure at retrieven the heroes")
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
        let heroe1 = Hero(id: 54543, name: "SOLUCION1", description: "prueba", modified: Date(), thumbnail: Thumbnail(path: "thubpath", thumbnailExtension: .jpg), resourceURI: "prueba", comics: Comics(available: -5, collectionURI: "prueba", items: [], returned: -1), series: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), stories: Stories(available: -1, collectionURI: "prueba", items: [], returned: -1), events: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), urls: [])
        let heroe2 = Hero(id: 54543, name: "SOLUCION 2", description: "prueba", modified: Date(), thumbnail: Thumbnail(path: "thubpath", thumbnailExtension: .jpg), resourceURI: "prueba", comics: Comics(available: -5, collectionURI: "prueba", items: [], returned: -1), series: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), stories: Stories(available: -1, collectionURI: "prueba", items: [], returned: -1), events: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), urls: [])
        
        self.hero = [heroe1, heroe2]
    }
    
}
