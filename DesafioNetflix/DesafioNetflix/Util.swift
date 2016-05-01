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
    
    static func getAllFilms () -> Array<ModelMedia>{
        
        var arrayFilms = Array<ModelMedia>()
        
        for dictMovie in Movies.movies {
            let media = ModelMedia(_name: dictMovie.0, _descriptionMedia: dictMovie.1, _releaseDate: dictMovie.2, _nameImage: dictMovie.3)
            arrayFilms.append(media)
        }
        
        return arrayFilms
    }
    
    static func getAllFavourites () -> Array<ModelMedia>{
        
        var arrayFilms = Array<ModelMedia>()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if let dict = userDefaults.objectForKey(KEY_FAVOURITES) {
            for dictMovie in dict as! NSMutableDictionary {
                let movie = dictMovie as! NSMutableDictionary
                
                let media = ModelMedia(_name: movie.objectForKey("name") as! String, _descriptionMedia: movie.objectForKey("description") as! String, _releaseDate: movie.objectForKey("releaseDate") as! String, _nameImage: movie.objectForKey("nameImage") as! String)
                arrayFilms.append(media)
            }
        }
        for dictMovie in Movies.movies {
            if let _ = userDefaults.objectForKey(dictMovie.0) {
                let media = ModelMedia(_name: dictMovie.0, _descriptionMedia: dictMovie.1, _releaseDate: dictMovie.2, _nameImage: dictMovie.3)
                arrayFilms.append(media)

            }
        }
        
        return arrayFilms
    }
    
    static func saveFavourite(media:ModelMedia){
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let dictMedia = NSMutableDictionary()
        dictMedia.setObject(media.name, forKey: "name")
        dictMedia.setObject(media.descriptionMedia, forKey: "description")
        dictMedia.setObject(media.nameImage, forKey: "nameImage")
        dictMedia.setObject(media.releaseDate, forKey: "releaseDate")
        
        var dictFavourites = NSMutableDictionary()
        
        if let dict = userDefaults.objectForKey(KEY_FAVOURITES) {
            dictFavourites = dict as! NSMutableDictionary
        }
        dictFavourites.setObject(dictMedia, forKey: media.name)
        userDefaults.setObject(dictFavourites, forKey: KEY_FAVOURITES)
        userDefaults.synchronize()
    }
    
    static func removeFavourite(mediaName:String){
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let dictFavourites = userDefaults.objectForKey(KEY_FAVOURITES)
        dictFavourites?.removeObjectForKey(mediaName)
        userDefaults.setObject(dictFavourites, forKey: KEY_FAVOURITES)
        userDefaults.synchronize()
    }

}
