//
//  StatusModel.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 26/3/23.
//

import Foundation

//Implanto numeraciones de estado

enum Status {
    case loaded, none, loading, register, error (error:String)
}