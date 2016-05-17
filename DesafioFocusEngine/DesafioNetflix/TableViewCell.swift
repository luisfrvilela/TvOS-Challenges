//
//  TableViewCell.swift
//  DesafioNetflix
//
//  Created by Luís Resende on 17/05/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    static let identifier = "tableViewCellCustom"
    
    var arrayMedia:Array<ModelMedia>! {
        didSet{
            updateUI()
        }
    }
    
    var canFocusCollection = true
    
    
    private func updateUI(){
        collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        self.focusStyle = .Custom
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func canBecomeFocused() -> Bool {
        return false
    }

}



extension TableViewCell: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayMedia.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CollectionViewCell.identifier, forIndexPath: indexPath) as! CollectionViewCell
        cell.movie = arrayMedia[indexPath.row]
        cell.canFocus = canFocusCollection
        return cell
    }
}

extension TableViewCell: UICollectionViewDelegate {
    
}
