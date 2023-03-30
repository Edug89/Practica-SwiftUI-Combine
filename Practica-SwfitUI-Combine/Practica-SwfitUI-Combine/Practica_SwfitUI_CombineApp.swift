//
//  Practica_SwfitUI_CombineApp.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 25/3/23.
//

import SwiftUI

@main
struct Practica_SwfitUI_CombineApp: App {
  //  let persistenceController = PersistenceController.shared
    @StateObject var rootViewModel = viewModelHero() //Esto es un singeltond desde cualquier pantalla tenemos acceso
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(rootViewModel) //Cargamos RootView como pantalla principal.
        }
    }
}
