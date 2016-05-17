//
//  Util.swift
//  DesafioNetflix
//
//  Created by Luís Resende on 27/04/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit



class Util: NSObject {
    
    static let KEY_FAVOURITES = "favoritos"
    static var favourites = Array<ModelMedia>()
    
    static func getAllMedias () -> Array<Array<ModelMedia>>{
        
        var arraysMedias = Array<Array<ModelMedia>>()
        let arrayFilms = getAllFilms()
        arraysMedias.append(arrayFilms)
        arraysMedias.append(arrayFilms.reverse())
        return arraysMedias
    }
    
    
    static func getAllFilms () -> Array<ModelMedia>{
        
        var arrayFilms = Array<ModelMedia>()
        
        for dictMovie in Movies.movies {
            let media = ModelMedia(_name: dictMovie.0, _descriptionMedia: dictMovie.1, _releaseDate: dictMovie.2, _nameImage: dictMovie.3)
            arrayFilms.append(media)
        }
        
        return arrayFilms
    }
    
    static func getAllFavourites () -> Array<ModelMedia>{
        return favourites;
    }
    
    static func getFavourite(media:ModelMedia)->Bool{
        for mediaFav in favourites {
            if mediaFav.name == media.name {
                return true
            }
        }
        return false
    }
    
    static func saveFavourite(media:ModelMedia){
        favourites.append(media)
        print("salvei \(media.name)")
    }
    
    static func removeFavourite(mediaName:String){
        for (index,media) in favourites.enumerate() {
            if media.name == mediaName {
                favourites.removeAtIndex(index)
                return
            }
        }
    }

}
