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
    
    @IBOutlet var kilometersLabel: UILabel!
    
    @IBOutlet var dayButton: UIButton!
    
    @IBOutlet var weekButton: UIButton!
    
    @IBOutlet var monthButton: UIButton!
    
    
    var stats = [Stat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.setNavigationBar()
        
        startAnimating(message: "cargando", type: NVActivityIndicatorType.ballClipRotate)
        
        minLabel.isHidden = true
        calLabel.isHidden = true
        stepsLabel.isHidden = true
        kilometersLabel.isHidden = true
        
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
                
                self.kilometersLabel.text = "\(self.stats[0].distance!)"
                
                self.minLabel.isHidden = false
                self.calLabel.isHidden = false
                self.stepsLabel.isHidden = false
                self.kilometersLabel.isHidden = false
            }
        }   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Actions
    
    @IBAction func changeStats(_ sender: UIButton) {
        
        switch sender.tag{
        case 1:
            //Day Stats
            
            self.dayButton.backgroundColor = UIColor(red: 0, green: 178/255, blue: 169/255, alpha: 1)
            self.weekButton.backgroundColor = UIColor.clear
            self.monthButton.backgroundColor = UIColor.clear
            
            self.setStats(self.stats[0])
            
        case 2:
            //Week Stats
            
            self.dayButton.backgroundColor = UIColor.clear
            self.weekButton.backgroundColor = UIColor(red: 0, green: 178/255, blue: 169/255, alpha: 1)
            self.monthButton.backgroundColor = UIColor.clear
            
            self.setStats(self.stats[1])
            
        case 3:
            //Month Stats
            
            self.dayButton.backgroundColor = UIColor.clear
            self.weekButton.backgroundColor = UIColor.clear
            self.monthButton.backgroundColor = UIColor(red: 0, green: 178/255, blue: 169/255, alpha: 1)
            
            self.setStats(self.stats[2])
            
        default: break
        }
    }
    
    
    
    //Supporting Functions
    
    func setStats(_ stat: Stat){
        self.calLabel.text = "\(stat.cal!)"
        self.minLabel.text = "\(stat.time/60):\(stat.time % 60)"
        self.stepsLabel.text = "\(stat.steps!)"
        self.kilometersLabel.text = "\(stat.distance!)"
    }
    
    func setNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        
        let label = UILabel()
        label.text = "MY STATS"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.sizeToFit()
        
        self.navigationItem.titleView = label
    }
    
}
