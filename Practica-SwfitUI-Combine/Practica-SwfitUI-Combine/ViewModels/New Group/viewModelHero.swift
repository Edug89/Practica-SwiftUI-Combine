//
//  viewModelHero.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 28/3/23.
//

import Foundation
import Combine

final class viewModelHero : ObservableObject {
    @Published var hero: [Hero]?
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()
    
    func getHeros(filtro: String) {
        
    }
    
    //For UI Desing
//    func getHerosDesting(){
//        let hero1 = Hero(id: UUID(), name: "", description: "", photo: "")
//        
//        self.hero = [hero1]
//    }
//    
}
