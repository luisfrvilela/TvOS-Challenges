//
//  CustomTextView.swift
//  DesafioLayout
//
//  Created by Luís Resende on 11/05/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit

class CustomTextView: UITextView {

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
        
        if self == context.nextFocusedView {
            coordinator.addCoordinatedAnimations({
                
                self.backgroundColor = UIColor.whiteColor()
                
                }, completion: nil)
        }else if self == context.previouslyFocusedView {
            
            coordinator.addCoordinatedAnimations({
                
                self.backgroundColor = UIColor.clearColor()
                
                }, completion: nil)
            
        }
        
    }

}
