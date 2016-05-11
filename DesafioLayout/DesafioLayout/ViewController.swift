//
//  ViewController.swift
//  DesafioLayout
//
//  Created by Luís Resende on 10/05/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let arrayTopics = iOSRequest.getArrayDictionary()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayTopics.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CollectionViewCell.identifier, forIndexPath: indexPath) as! CollectionViewCell
        
        cell.topic = arrayTopics[indexPath.row]
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let controller = segue.destinationViewController as! DetailViewController
        let cell = sender as! CollectionViewCell
        controller.topic = cell.topic
    }
}

