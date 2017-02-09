//
//  Message.swift
//  maqueta
//
//  Created by Miguel Roncallo on 2/6/17.
//  Copyright © 2017 Nativapps. All rights reserved.
//

import Foundation
import SwiftyJSON

class Message{
    
    var id: Int!
    var type: String!
    var rcpt_id: Int!
    var rcpt_type: String!
    var rcpt_name: String!
    var message: String!
    var subject: String!
    var sentDate: Date!
    var openDate: Date?
    
    
    func messageFromJson(_ json: JSON) -> Message{
        let message = Message()
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        message.id = json["id"].intValue
        message.type = json["type"].stringValue
        message.rcpt_id = json["rcpt_id"].intValue
        message.rcpt_type = json["rcpt_type"].stringValue
        message.rcpt_name = json["rcpt_name"].stringValue
        message.message = json["message"].stringValue
        message.subject = json["subject"].stringValue
        
        message.sentDate = formatter.date(from: json["sentDate"].stringValue)!
        
        if json["openDate"].string != ""{
            
            message.openDate = formatter.date(from: json["openDate"].stringValue)!
        }
        
        return message
    }
}
