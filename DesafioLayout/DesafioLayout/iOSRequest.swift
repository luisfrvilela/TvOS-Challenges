//
//  iOSRequest.swift
//  DesafioLayout
//
//  Created by Luís Resende on 10/05/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit

internal let jsonURL  = "https://bit.ly/1UQul1N"

class iOSRequest: NSObject{
    
    static func parseJSON(data: NSData) -> NSArray{
        var jsonResult = NSArray()
        do{
            jsonResult = try (NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? NSArray)!
        }catch{
            print(error)
        }
        
        return jsonResult
    }
    
    static func getJSON(urlToRequest: String) -> NSArray{
        let jsonData = NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
        return parseJSON(jsonData)
    }
    
    static func getArrayDictionary()-> [ModelTopic]{

        let arrayAllTopics = getJSON(jsonURL)
        var arrayTopics = [ModelTopic]()
        
        
        for (_,topic) in arrayAllTopics.enumerate() {
            
            let dictTopic = topic as! NSMutableDictionary
            
            
            let name = dictTopic.objectForKey("name") as! String
            let description = dictTopic.objectForKey("description") as! String
            
            let subtopicsJSON = dictTopic.objectForKey("subtopic") as! NSMutableArray
            
            let subtopics = NSMutableArray()
            
            for subtopic in subtopicsJSON {
                
                let dict = subtopic as! NSMutableDictionary
                let nameSub = dict.objectForKey("name") as! String
                let descriptionSub = dict.objectForKey("description") as! String
                
                let subsubtopics = NSMutableArray()
                
                if let haveSubtopics = dict.objectForKey("subtopic") {
                    let iteratorSubtopics = haveSubtopics as! NSMutableArray
                    for subTopics in iteratorSubtopics {
                        let modelSubSubTopic = ModelTopic()
                        modelSubSubTopic.name = (subTopics as! NSDictionary).objectForKey("name") as? String
                        modelSubSubTopic.descriptionTopic = (subTopics as! NSDictionary).objectForKey("description") as? String
                        subsubtopics.addObject(modelSubSubTopic)
                    }
                }
                
                let modelSubTopic = ModelTopic()
                modelSubTopic.name = nameSub
                modelSubTopic.descriptionTopic = descriptionSub
                modelSubTopic.subtopics = subsubtopics
                
                subtopics.addObject(modelSubTopic)
                
            }
            
            let modelTopic = ModelTopic()
            modelTopic.name = name
            modelTopic.descriptionTopic = description
            modelTopic.subtopics = subtopics
            
            arrayTopics.append(modelTopic)
        }
        
        return arrayTopics
    }
}

