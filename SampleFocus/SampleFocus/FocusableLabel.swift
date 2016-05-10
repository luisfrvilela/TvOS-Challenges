//
//  FocusableLabel.swift
//  SampleFocus
//
//  Created by Luís Resende on 09/05/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit

class FocusableLabel: UILabel {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func canBecomeFocused() -> Bool {
        return true
    }
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        print(#function,coordinator)
        
        if self == context.nextFocusedView {
            coordinator.addCoordinatedAnimations({ 
                
                self.textColor = UIColor.whiteColor()
                self.font = UIFont(name: (self.font?.fontName)!, size: 40)
                
                self.layer.shadowColor = UIColor.blackColor().CGColor
                self.layer.shadowOpacity = 0.5
                self.layer.shadowRadius = 20
                self.layer.shadowOffset = CGSize(width: 0, height: 5)
                
                }, completion: nil)
        }else if self == context.previouslyFocusedView {
            
            coordinator.addCoordinatedAnimations({
                
                self.textColor = UIColor.blackColor()
                self.font = UIFont(name: (self.font?.fontName)!, size: 30)
                
                self.layer.shadowColor = UIColor.clearColor().CGColor
                self.layer.shadowOffset = CGSizeZero
                
                }, completion: nil)
            
        }
    }

}
