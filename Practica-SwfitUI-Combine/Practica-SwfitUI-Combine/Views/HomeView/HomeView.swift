//
//  HomeView.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 28/3/23.
//

import SwiftUI

struct HomeView: View {
    @State private var selection = 0
    
    var body: some View {
        
        ZStack {
            TabView(selection: $selection){
                HeroView(viewModel: viewModelHero())
                    .tabItem {
                        Image(systemName: "person")
                        Text ("Hero")
                    }.tag(0)
                
                Text("Detail Hero")
                    .tabItem {
                        Image(systemName:"list.bullet.circle")
                        Text ("DetailHero")
                    }.tag(1)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
