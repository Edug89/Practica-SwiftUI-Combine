//
//  HomeView.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 28/3/23.
//


import SwiftUI

struct TabBarView: View {
    @State private var selection = 0
 
    
    var body: some View {
        
        ZStack {
            TabView(selection: $selection){
                HeroView(heroviewModel: viewModelHero())
                    .tabItem {
                        Image(systemName: "person")
                        Text ("Hero")
                    }.tag(0)
                
                SeriesView(heroSerieViewModel: viewModelSerie(hero: Hero(id: 1, name: "SOLUCION1", description: "prueba", modified: "", thumbnail: Thumbnail(path: "thubpath", thumbnailExtension: .jpg), resourceURI: "prueba", comics: Comics(available: -5, collectionURI: "prueba", items: [], returned: -1), series: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), stories: Stories(available: -1, collectionURI: "prueba", items: [], returned: -1), events: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), urls: [])))
                    .tabItem {
                        Image(systemName: "list.dash.header.rectangle")
                        Text ("DetailSeries")
                    }.tag(1)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

