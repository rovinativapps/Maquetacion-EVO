//
//  MyStats1Controller.swift
//  maqueta
//
//  Created by Miguel Roncallo on 2/2/17.
//  Copyright © 2017 Nativapps. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class MyStats1Controller: UIViewController, NVActivityIndicatorViewable {

    
    @IBOutlet var minLabel: UILabel!
    
    @IBOutlet var calLabel: UILabel!
    
    @IBOutlet var stepsLabel: UILabel!
    
    var stats = [Stat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startAnimating(message: "cargando", type: NVActivityIndicatorType.ballClipRotate)
        
        minLabel.isHidden = true
        calLabel.isHidden = true
        stepsLabel.isHidden = true
        
        DataService.sharedInstance.getStats { (error, stats) in
            if let e = error{
                print(e)
                self.stopAnimating()
            }else{
                self.stats = stats!
                self.stopAnimating()
                self.calLabel.text = "\(self.stats[0].cal!)"
                
                self.minLabel.text = "\(self.stats[0].time/60):\(self.stats[0].time % 60)"
                
                self.stepsLabel.text = "\(self.stats[0].steps!)"
                
                self.minLabel.isHidden = false
                self.calLabel.isHidden = false
                self.stepsLabel.isHidden = false
            }
        }
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
