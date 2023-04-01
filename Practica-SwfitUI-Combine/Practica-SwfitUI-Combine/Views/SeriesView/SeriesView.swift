//
//  SeriesView.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 31/3/23.
//

import SwiftUI

struct SeriesView: View {
    @StateObject var heroSerieViewModel: viewModelSerie
    var hero: Hero?
    

    var body: some View {
        NavigationStack{
            List{
                ForEach(heroSerieViewModel.series) { serie in
                    SeriesRowView(serie: serie)

                }
            }
        }
    }
}


struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(heroSerieViewModel: viewModelSerie(hero: Hero(id: 1, name: "PRUEBA", description: "Prueba Descripción", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg), resourceURI: "", comics: Comics(available: 1, collectionURI: "", items: [], returned: 7), series: Comics(available: 1, collectionURI: "", items: [], returned: 7), stories: Stories(available: 3, collectionURI: "", items: [], returned: 3), events: Comics(available: 4, collectionURI: "", items: [], returned: 5), urls: []),testing: true))
        }
}
