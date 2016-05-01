//
//  FirstViewController.swift
//  DesafioNetflix
//
//  Created by Luís Resende on 27/04/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var allFilms = Array<ModelMedia>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension FirstViewController: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allFilms = Util.getAllFilms()
        return allFilms.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CollectionViewCell.identifier, forIndexPath: indexPath) as! CollectionViewCell
        
        cell.movie = allFilms[indexPath.row]
        
        return cell
    }
}

extension FirstViewController: UICollectionViewDelegate {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let controller = segue.destinationViewController as! DetailViewController
        let cell = sender as! CollectionViewCell
        controller.media = cell.movie
    }
}

