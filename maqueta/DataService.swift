//
//  DataService.swift
//  maqueta
//
//  Created by Miguel Roncallo on 2/6/17.
//  Copyright © 2017 Nativapps. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataService {
    
    static let sharedInstance = DataService()
    
    let baseUrl = "http://www.myvitale.com/api/v1.2"
    
    let loginUrl = "http://www.myvitale.com/oauth/v2"
    
    var token = ""
    
    var messages = [Message]()
    
    var dayStat = Stat()
    var weekStat = Stat()
    var monthStat = Stat()
    
    var stats = [Stat]()
    
    func getToken(_ user: String, _ password: String, _ cb: @escaping ((_ error: NSError?, _ token: String?)->())){
        let url = URL(string: "\(loginUrl)/token?grant_type=password&client_id=43_4yth2lkyzhoo4cggko8wkkokokowscc4kk8c4w4s0o8gsss40g&client_secret=g4o9ih7h2gowwgkscockwos0o0cwgos8kwcso48coc8cg4gk0&username=\(user)&password=\(password)")
        
        Alamofire.request(url!, method: .get, encoding: JSONEncoding.default).validate().responseJSON { (response) in
            
            switch response.result{
            case .success:
                if let value = response.result.value{
                    let json = JSON(value)
                    
                    if let _ = json["error"].string{
                        cb(NSError(
                            domain: "root",
                            code: -99,
                            userInfo: [NSLocalizedDescriptionKey:json["error_description"].stringValue]
                        ), nil)
                    }else{
                        self.token = json["access_token"].stringValue
                        cb(nil, self.token)
                    }
                }
                
                
            case .failure(let error):
                print(error.localizedDescription)
                cb(error as NSError! , nil)
            }
        }
    }
    
    func getInbox(_ token: String,_ cb: @escaping((_ error: NSError?,_ messages: [Message]?)->())){
      
        let url = URL(string: "\(baseUrl)/messages/all?access_token=\(token)")
        self.messages.removeAll()
        
        Alamofire.request(url!, method: .get, encoding: JSONEncoding.default).validate().responseJSON { (response) in
            
            switch response.result{
            case .success:
                if let value = response.result.value{
                    let json = JSON(value)
                    
                    if let _ = json["error"].string{
                        cb(NSError(
                            domain: "root",
                            code: -99,
                            userInfo: [NSLocalizedDescriptionKey:json["error_description"].stringValue]
                        ), nil)
                    }else{
                        
                        for  (_,subJson):(String, JSON) in json {
                            let message = Message().messageFromJson(subJson)
                            self.messages.append(message)
                        }
                        
                        cb(nil, self.messages)
                    }

                }
                
                
            case .failure(let error):
                print(error.localizedDescription)
                cb(error as NSError!, nil)
            }
        }
    }
    
    func messageRead(_ messageId: Int, _ cb: @escaping(()->()) ){
        let url = URL(string: "\(baseUrl)/messages/\(messageId)?access_token=\(self.token)")
        
        Alamofire.request(url!, method: .post, encoding: JSONEncoding.default).validate().responseJSON { (response) in
            
            
        }
    }
    
    func getStats(_ cb: @escaping((_ error: NSError?, _ stat: [Stat]?)->())){
        
        let url = URL(string: "http://www.myvitale.com/app_dev.php/api/v1.2/evo/stats?access_token=\(self.token)")
        
        Alamofire.request(url!, method: .get, encoding: JSONEncoding.default).validate().responseJSON { (response) in
            
            switch response.result{
            case .success:
                
                if let value = response.result.value{
                    let json = JSON(value)
                    
                    if let _ = json["error"].string{
                        cb(NSError(
                            domain: "root",
                            code: -99,
                            userInfo: [NSLocalizedDescriptionKey:json["error_description"].stringValue]
                        ), nil)
                    }else{
                        
                        self.dayStat = Stat().statFromJson(json["day"])
                        self.monthStat = Stat().statFromJson(json["month"])
                        self.weekStat = Stat().statFromJson(json["week"])
                        
                        self.stats.removeAll()
                        self.stats.append(self.dayStat)
                        self.stats.append(self.weekStat)
                        self.stats.append(self.monthStat)
                        
                        cb(nil, self.stats)
                        
                    }
                }
                
                
            case .failure(let error):
                
                print(error.localizedDescription)
                cb(error as NSError!, nil)
                
            }
        }
        
    }
    
    
}
