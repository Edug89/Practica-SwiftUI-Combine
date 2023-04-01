//
//  HeroView.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 28/3/23.
//

import SwiftUI

struct HeroView: View {
    @StateObject var heroviewModel: viewModelHero
    
    
    var body: some View {
        NavigationStack{
            List{
                if let hero = heroviewModel.hero{
                    ForEach(hero) { hero in
                        NavigationLink{
                            SeriesView(heroSerieViewModel: viewModelSerie(hero: hero),hero:hero)
                        } label: {
                            HeroRowView(hero: hero)
                        }
                    }
                }
            }
        }
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(heroviewModel: viewModelHero(testing: true))
    }
}
