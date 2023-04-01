//
//  viewModelSerie.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 1/4/23.
//

import Foundation
import Combine

final class viewModelSerie : ObservableObject{
    @Published var hero: Hero
    @Published var series: [Series] = []
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()
    
    init(hero: Hero, testing:Bool = false){
        self.hero = hero
        if (testing){
            self.getSeriesTesting()
        }else{
            self.getSerie()
        }
    }
    
    func getSerie(){
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getMarvelSeries(with: hero.id, sortBy: .startYear))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else{
                    debugPrint("URL: \(String(describing: $0.response.url))")
                    throw URLError(.badServerResponse)
                    
                }
                return $0.data
            }
            .decode(type: Serie.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure:
                    self.status = Status.error(error: "Error buscando series")
                case.finished:
                    self.status = .loaded
                    
                }
            } receiveValue: { data in
                self.series = data.data.results
            }
            .store(in: &suscriptors)
    }
    
    //For UI Desing //Pasar parámetros series
    func getSeriesTesting(){
        let series1 = Series(id: 145896, title: "Prueba Test Serie", description: "", resourceURI: "", urls: [], startYear: 3, endYear: 5, rating: "", type: "", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg), creators: Creators(available: 5, collectionURI: "", items: [], returned: 9), characters: Characters(available: 2, collectionURI: "", items: [], returned: 5), stories: Stories(available: 1, collectionURI: "", items: [], returned: 3), comics: Characters(available: 2, collectionURI: "", items: [], returned: 4), events: Characters(available: 5, collectionURI: "", items: [], returned: 9))
        
        let series2 = Series(id: 145898, title: "Prueba Test Serie", description: "", resourceURI: "", urls: [], startYear: 3, endYear: 5, rating: "", type: "", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg), creators: Creators(available: 5, collectionURI: "", items: [], returned: 9), characters: Characters(available: 2, collectionURI: "", items: [], returned: 5), stories: Stories(available: 1, collectionURI: "", items: [], returned: 3), comics: Characters(available: 2, collectionURI: "", items: [], returned: 4), events: Characters(available: 5, collectionURI: "", items: [], returned: 9))
        
        let series3 = Series(id: 145897, title: "Prueba Test Serie", description: "", resourceURI: "", urls: [], startYear: 3, endYear: 5, rating: "", type: "", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg), creators: Creators(available: 5, collectionURI: "", items: [], returned: 9), characters: Characters(available: 2, collectionURI: "", items: [], returned: 5), stories: Stories(available: 1, collectionURI: "", items: [], returned: 3), comics: Characters(available: 2, collectionURI: "", items: [], returned: 4), events: Characters(available: 5, collectionURI: "", items: [], returned: 9))
            
        self.series = [series1, series2, series3]
        
        
    }
    
}
