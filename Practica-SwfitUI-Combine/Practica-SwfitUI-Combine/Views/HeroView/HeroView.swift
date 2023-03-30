//
//  HeroView.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 28/3/23.
//

import SwiftUI

struct HeroView: View {
    @StateObject var viewModel: viewModelHero
    //@State private var filter = "" TODO barra de búsqueda
    
    var body: some View {
        NavigationStack{
            List{
                if let hero = viewModel.hero{
                    ForEach(hero) { hero in
                        NavigationLink{
                            //TODO Pendiente de poner vista series
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
        HeroView(viewModel: viewModelHero(testing: true))
    }
}
