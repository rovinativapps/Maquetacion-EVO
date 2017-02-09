//
//  Stat.swift
//  maqueta
//
//  Created by Miguel Roncallo on 2/8/17.
//  Copyright © 2017 Nativapps. All rights reserved.
//

import Foundation
import SwiftyJSON

class Stat{
    var cal: Int!
    var time: Int!
    var distance: Int!
    var steps: Int!
    
    func statFromJson(_ json: JSON) -> Stat{
        let stat = Stat()
        
        stat.cal = json["cal"].intValue
        stat.time = json["time"].intValue
        stat.distance = json["distance"].intValue
        stat.steps = json["steps"].intValue 
        
        return stat
    }
}
