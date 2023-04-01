//
//  LoaderView.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 26/3/23.
//

import SwiftUI

struct LoaderView: View {
    
    @State private var animationAmount = 0.4
    @State private var animate = false
    
    var body: some View {
        VStack {
            Image(decorative: "36713_footer_marvel_sq_l")
                .resizable()
                .frame(width: 100, height: 100)
                .scaleEffect(animationAmount)
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses:true), value: animationAmount)
                .onAppear{
                    animationAmount = 1
                        
                }
                .id(0)
            
            Text("Cargando...")
                .font(.title)
                .bold()
                .foregroundColor(.red)
                .padding(.top, 100)
                .id(1)
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
