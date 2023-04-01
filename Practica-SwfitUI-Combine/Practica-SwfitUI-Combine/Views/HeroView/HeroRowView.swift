//
//  HeroRowView.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 30/3/23.
//

import SwiftUI

struct HeroRowView: View {
    var hero: Hero
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(.gray)
                .frame(width: 350, height: 350)
                .cornerRadius(20)
            VStack{
                AsyncImage(url: URL(string: "\(hero.thumbnail.path).\(hero.thumbnail.thumbnailExtension)")){Image in
                    Image
                        .resizable()
                        .frame(width:300 ,height: 250)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20)
                        .padding()
                        .id(0)
                    
                } placeholder: {
                    Image(systemName: "person")
                }
                
                Text(hero.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .id(1)
            }
        }
    }
}


struct HeroRowView_Previews: PreviewProvider {
    static var previews: some View {
        HeroRowView(hero: Hero(id: 1, name: "SOLUCION1", description: "prueba", modified: "", thumbnail: Thumbnail(path: "thubpath", thumbnailExtension: .jpg), resourceURI: "prueba", comics: Comics(available: -5, collectionURI: "prueba", items: [], returned: -1), series: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), stories: Stories(available: -1, collectionURI: "prueba", items: [], returned: -1), events: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), urls: []))
    }
}


//Tool.shared.ThumbnailToURLConverter(this: hero.thumbnail, withAspect: .portraitUncanny))
