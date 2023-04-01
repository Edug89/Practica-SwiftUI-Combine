//
//  SeriesRowView.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 1/4/23.
//

import SwiftUI

struct SeriesRowView: View {
    var serie : Series
    
    var body: some View {
        VStack {
            Text(serie.title)
                .font(.title)
                .padding()
                .bold()
                .opacity(0.7)
            
            AsyncImage(url: URL(string: "\(serie.thumbnail.path).\(serie.thumbnail.thumbnailExtension)")) { Image in
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .opacity(0.7)
                    .padding()
                    .id(0)
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .opacity(0.7)
                    .padding()
            }
            if let description = serie.description {
                Text("\(description)")
                    .font(.callout)
                    .foregroundColor(.black)
                    .padding()
                
            } else {
                Text("No description")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
            }
            
        }
    }
    
    struct SeriesRowView_Previews: PreviewProvider {
        static var previews: some View {
            SeriesRowView(serie: Series(id: 145896, title: "Prueba Test Serie", description: "", resourceURI: "", urls: [], startYear: 3, endYear: 5, rating: "", type: "", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg), creators: Creators(available: 5, collectionURI: "", items: [], returned: 9), characters: Characters(available: 2, collectionURI: "", items: [], returned: 5), stories: Stories(available: 1, collectionURI: "", items: [], returned: 3), comics: Characters(available: 2, collectionURI: "", items: [], returned: 4), events: Characters(available: 5, collectionURI: "", items: [], returned: 9)))
        }
    }
}
