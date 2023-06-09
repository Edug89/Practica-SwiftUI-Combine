//
//  LoginView.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 25/3/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var rootviewModel: RootViewModel
    
    var body: some View {
        NavigationView {
            ZStack{
                //Imagen de fondo
                Image(decorative: "07e402cfdd81cdbad158e0a9bb6a6bec")
                    .resizable()
                    .opacity(1)
                
                //Hacemos un poco más oscuro con otra imagen negra
                Image(decorative: "")
                    .resizable()
                    .background(Color.black)
                    .opacity(0.1)
                
                VStack{
                    NavigationLink(destination: HeroView(heroviewModel: viewModelHero(testing: true))){
                        Text("Entrar")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200, height: 45)
                            .background(.blue)
                            .cornerRadius(15.0)
                            .shadow(radius: 10.0, x:20, y:10)
                            .id(0)
                    }
                    .padding(.top, 550)
                    .opacity(0.8)
                }
            }
            .ignoresSafeArea()
        }
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
}
