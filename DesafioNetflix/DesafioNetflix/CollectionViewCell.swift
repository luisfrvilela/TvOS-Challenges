//
//  CollectionViewCell.swift
//  DesafioNetflix
//
//  Created by Luís Resende on 27/04/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    static let identifier = "cellCustom"
    
    var movie:ModelMedia! {
        didSet{
            updateUI()
        }
    }
    
    private func updateUI(){
        image.image = UIImage(named:movie.nameImage)
        name.text = movie.name
    }
}
