//
//  HomeView.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 28/3/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView{
            HeroView()
                .tabItem {
                    Image(systemName: "person")
                    Text ("Hero")
                }
            Text("Detail Hero")
                .tabItem {
                    Image(systemName:"list.bullet.circle")
                    Text ("DetailHero")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
