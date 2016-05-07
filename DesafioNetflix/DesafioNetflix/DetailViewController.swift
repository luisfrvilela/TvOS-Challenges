//
//  DetailViewController.swift
//  DesafioNetflix
//
//  Created by Luís Resende on 27/04/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateRelease: UILabel!
    @IBOutlet weak var addFavourite: UIButton!
    @IBOutlet weak var name: UILabel!
    
    var media:ModelMedia! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI(media)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func updateUI(media:ModelMedia){
        
        image.image = UIImage(named: media.nameImage)
        descriptionLabel.text = media.descriptionMedia
        dateRelease.text = "Data de lançamento: " + media.releaseDate
        name.text = media.name
        
        if Util.getFavourite(media) == true {
            addFavourite.setTitle("Remover dos Favoritos", forState: UIControlState.Normal)
            addFavourite.setTitle("Remover dos Favoritos", forState: UIControlState.Selected)
        }else{
            addFavourite.setTitle("Adicionar aos Favoritos", forState: UIControlState.Normal)
            addFavourite.setTitle("Adicionar aos Favoritos", forState: UIControlState.Selected)
        }
    }
    
    @IBAction func addFavourite(sender: AnyObject) {
        if Util.getFavourite(media) == false {
            Util.saveFavourite(media)
        }else{
            Util.removeFavourite(media.name)
        }
        self.updateUI(media)
    }
    
}
