//
//  RootView.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 26/3/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        switch rootViewModel.status{
        case .none:
            LoginView()
        case .loaded:
            Text("home")
        case .error(error: let errorString):
            Text("Error-> \(errorString)")
        case .loading:
            Text("Cargando... ")
        case .register:
            Text("Registro")
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(RootViewModel())
    }
}
