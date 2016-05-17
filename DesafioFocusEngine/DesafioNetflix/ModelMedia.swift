//
//  ModelMedia.swift
//  DesafioNetflix
//
//  Created by Luís Resende on 27/04/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit

class ModelMedia: NSObject {
    
    var name:String!
    var descriptionMedia:String!
    var releaseDate:String!
    var nameImage:String!
    
    init(_name:String, _descriptionMedia:String, _releaseDate:String, _nameImage:String){
        super.init()
        self.name = _name
        self.descriptionMedia = _descriptionMedia
        self.releaseDate = _releaseDate
        self.nameImage = _nameImage
    }
    
}
