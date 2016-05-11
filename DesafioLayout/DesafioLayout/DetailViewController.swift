//
//  DetailViewController.swift
//  DesafioLayout
//
//  Created by Luís Resende on 11/05/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var topicName: UILabel!
    @IBOutlet weak var topicDescription: UITextView!
    
    var topic:ModelTopic! = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
        self.addDefaultTopic()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func updateUI(){
        topicName.text = topic.name
        topicDescription.text = topic.descriptionTopic
    }
    
    private func addDefaultTopic(){
        let defaultTopic = ModelTopic()
        defaultTopic.name = "General"
        defaultTopic.descriptionTopic = topic.descriptionTopic
        topic.subtopics?.insertObject(defaultTopic, atIndex: 0)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: UITableViewDataSource , UITableViewDelegate{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (topic.subtopics?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableViewCell.identifier, forIndexPath: indexPath) as! TableViewCell
        cell.subTopic = topic.subtopics![indexPath.row] as! ModelTopic
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! TableViewCell
        topicDescription.text = cell.subTopic.descriptionTopic
    }
}
