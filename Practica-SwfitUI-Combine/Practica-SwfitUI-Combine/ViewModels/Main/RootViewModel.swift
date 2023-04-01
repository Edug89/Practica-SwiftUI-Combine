//
//  RootViewModel.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 26/3/23.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject {
    @Published var status = Status.none //indicamos que si hay cambio informe
    @Published var iSlogged: Bool = false
    
}
