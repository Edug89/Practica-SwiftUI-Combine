//
//  RootView.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 26/3/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel: viewModelHero
    
    var body: some View {
        switch rootViewModel.status{
        case .none:
            LoginView()
        case .loaded:
            HeroView(heroviewModel: rootViewModel)
        case .loading:
            LoaderView()
        case .error(error: let errorString):
            Text("error: \(errorString)")
       
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(viewModelHero())
    }
}
