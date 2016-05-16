//
//  TableViewCell.swift
//  DesafioLayout
//
//  Created by Luís Resende on 11/05/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameSubTopic: UILabel!
    
    static let identifier = "cellTableView"
    
    var subTopic:ModelTopic! {
        didSet{
            updateUI()
        }
    }
    
    private func updateUI(){
        nameSubTopic.text = subTopic.name
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
                
                self.nameSubTopic.font = UIFont.boldSystemFontOfSize(30)
                
                }, completion: nil)
        }else if self == context.previouslyFocusedView {
            
            coordinator.addCoordinatedAnimations({
                
                self.nameSubTopic.font = UIFont.systemFontOfSize(25)
                
                }, completion: nil)
            
        }
    }

}
