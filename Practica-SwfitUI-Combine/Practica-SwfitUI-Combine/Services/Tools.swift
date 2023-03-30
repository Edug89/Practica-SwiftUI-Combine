//
//  Tools.swift
//  Practica-SwfitUI-Combine
//
//  Created by Eduardo Martinez Palomino on 30/3/23.
//

import Foundation

enum ImageAspectRatio:String{
    case portraitSmall = "portrait_small"
    case portraitMedium = "portrait_medium"
    case portraitXlage = "portrait_xlarge"
    case portraitFantastic = "portrait_fantastic"
    case portraitUncanny = "portrait_uncanny"
    case portraitIncredible = "portrait_incredible"
    

}

final class Tool{
    
    static let shared = Tool()
    
    func ThumbnailToURLConverter(this thumbnail: Thumbnail, withAspect aspectRatio: ImageAspectRatio) -> URL{
        let url = URL(string: "\(thumbnail.path)/\(aspectRatio.rawValue).\(thumbnail.thumbnailExtension)")!
        return url
        
    }
}
