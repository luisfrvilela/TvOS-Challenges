//
//  DetailTableViewCell.swift
//  DesafioLayout
//
//  Created by Luís Resende on 11/05/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var nameSubSubTopic: UILabel!
    
    static let identifier = "cellDetailTableView"
    
    var subSubTopic:ModelTopic! {
        didSet{
            updateUI()
        }
    }
    
    private func updateUI(){
        nameSubSubTopic.text = subSubTopic.name
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func canBecomeFocused() -> Bool {
        return true
    }
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocusInContext(context, withAnimationCoordinator: coordinator)
        
        if self == context.nextFocusedView {
            coordinator.addCoordinatedAnimations({
                
                self.nameSubSubTopic.font = UIFont.boldSystemFontOfSize(22)
                
                }, completion: nil)
        }else if self == context.previouslyFocusedView {
            
            coordinator.addCoordinatedAnimations({
                
                self.nameSubSubTopic.font = UIFont.systemFontOfSize(17)
                
                }, completion: nil)
            
        }
    }

}
