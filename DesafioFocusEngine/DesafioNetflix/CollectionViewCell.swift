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
    
    var canFocus:Bool!{
        didSet{
            self.canBecomeFocused()
        }
    }
    
    
    private func updateUI(){
        image.image = UIImage(named:movie.nameImage)
        name.text = movie.name
    }
    
    override func canBecomeFocused() -> Bool {
        return self.canFocus
    }
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        
        if self == context.nextFocusedView {
            coordinator.addCoordinatedAnimations({
                
                self.image.adjustsImageWhenAncestorFocused = true
                self.name.textColor = UIColor.blackColor()
                self.name.font = UIFont(name: (self.name.font?.fontName)!, size: 18)
                self.name.backgroundColor = UIColor.whiteColor()
                
                }, completion: nil)
        }else if self == context.previouslyFocusedView {
            
            coordinator.addCoordinatedAnimations({
                
                self.name.textColor = UIColor.blackColor()
                self.name.font = UIFont(name: (self.name.font?.fontName)!, size: 15)
                self.name.backgroundColor = UIColor.clearColor()
                
                }, completion: nil)
            
        }
    }
}
