//
//  MyStats2Controller.swift
//  maqueta
//
//  Created by Miguel Roncallo on 2/2/17.
//  Copyright © 2017 Nativapps. All rights reserved.
//

import UIKit

class MyStats2Controller: UIViewController {

    
    @IBOutlet var floorsLabel: UILabel!
    
    @IBOutlet var hoursLabel: UILabel!
    
    @IBOutlet var kilometersLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.kilometersLabel.text = "\(DataService.sharedInstance.stats[0].distance!)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
