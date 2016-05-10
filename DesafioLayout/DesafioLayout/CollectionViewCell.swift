//
//  CollectionViewCell.swift
//  DesafioNetflix
//
//  Created by Luís Resende on 27/04/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    
    static let identifier = "cellCustom"
    
    var topic:ModelTopic! {
        didSet{
            updateUI()
        }
    }
    
    private func updateUI(){
        name.text = topic.name
    }
    
    override func canBecomeFocused() -> Bool {
        return true
    }
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        
        if self == context.nextFocusedView {
            coordinator.addCoordinatedAnimations({
                
                self.name.textColor = UIColor.blackColor()
                self.name.font = UIFont(name: (self.name.font?.fontName)!, size: 86)
                self.name.backgroundColor = UIColor.whiteColor()
                
                }, completion: nil)
        }else if self == context.previouslyFocusedView {
            
            coordinator.addCoordinatedAnimations({
                
                self.name.textColor = UIColor.whiteColor()
                self.name.font = UIFont(name: (self.name.font?.fontName)!, size: 73)
                self.name.backgroundColor = UIColor.grayColor()
                
                }, completion: nil)
            
        }
    }
}
