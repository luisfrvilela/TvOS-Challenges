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
    @IBOutlet weak var subtopicDescription: UITextView!
    @IBOutlet weak var tableViewTopic: UITableView!
    @IBOutlet weak var tableViewSubTopic: UITableView!
    
    var topic:ModelTopic! = nil
    var subTopic:ModelTopic! = nil
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
        self.addDefaultTopic()
        
        self.subtopicDescription.selectable = true
        self.subtopicDescription.userInteractionEnabled = true
        self.subtopicDescription.scrollEnabled = true
        self.subtopicDescription.showsVerticalScrollIndicator = true
        self.subtopicDescription.panGestureRecognizer.allowedTouchTypes = [UITouchType.Indirect.rawValue]
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
        if tableView == tableViewTopic {
            return (topic.subtopics?.count)!
        }else{
            if subTopic != nil {
                return (subTopic.subtopics?.count)!
            }else{
                return 0
            }
            
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView == tableViewTopic {
            let cell = tableView.dequeueReusableCellWithIdentifier(TableViewCell.identifier, forIndexPath: indexPath) as! TableViewCell
            cell.subTopic = topic.subtopics![indexPath.row] as! ModelTopic
            return cell
        }else{
            if subTopic != nil {
                let cellSub = tableView.dequeueReusableCellWithIdentifier(DetailTableViewCell.identifier, forIndexPath: indexPath) as! DetailTableViewCell
                cellSub.subSubTopic = subTopic.subtopics![indexPath.row] as! ModelTopic
                return cellSub

            }else{
                return UITableViewCell()
            }
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView == tableViewTopic {
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! TableViewCell
            topicDescription.text = cell.subTopic.descriptionTopic
            if cell.subTopic.subtopics?.count>0 {
                topicDescription.hidden = true
                subtopicDescription.hidden = false
                tableViewSubTopic.hidden = false
                subTopic = cell.subTopic
                subtopicDescription.text = subTopic.descriptionTopic
                tableViewSubTopic.reloadData()
            }else{
                topicDescription.hidden = false
                subtopicDescription.hidden = true
                tableViewSubTopic.hidden = true
                subTopic = nil
            }
        }else{
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! DetailTableViewCell
            subtopicDescription.text = cell.subSubTopic.descriptionTopic
        }
    }
}
