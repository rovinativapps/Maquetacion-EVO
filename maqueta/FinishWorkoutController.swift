//
//  FinishWorkoutController.swift
//  maqueta
//
//  Created by Miguel Roncallo on 2/9/17.
//  Copyright © 2017 Nativapps. All rights reserved.
//

import UIKit

class FinishWorkoutController: UIViewController {

    
    @IBOutlet var minLabel: UILabel!
    
    @IBOutlet var kcalLabel: UILabel!
    
    
    @IBOutlet var bar1Image: UIImageView!
    
    @IBOutlet var bar2Image: UIImageView!
    
    @IBOutlet var bar3Image: UIImageView!
    
    @IBOutlet var bar4Image: UIImageView!
    
    @IBOutlet var bar5Image: UIImageView!
    
    @IBOutlet var likeImage: UIImageView!
    
    @IBOutlet var dislikeImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectLevel(_ sender: UIButton) {
        
        switch sender.tag{
        case 1:
            bar1Image.image = UIImage(named: "bar1f")
            bar2Image.image = UIImage(named: "bar2e")
            bar3Image.image = UIImage(named: "bar3e")
            bar4Image.image = UIImage(named: "bar4e")
            bar5Image.image = UIImage(named: "bar5e")
        case 2:
            bar1Image.image = UIImage(named: "bar1e")
            bar2Image.image = UIImage(named: "bar2f")
            bar3Image.image = UIImage(named: "bar3e")
            bar4Image.image = UIImage(named: "bar4e")
            bar5Image.image = UIImage(named: "bar5e")
        case 3:
            bar1Image.image = UIImage(named: "bar1e")
            bar2Image.image = UIImage(named: "bar2e")
            bar3Image.image = UIImage(named: "bar3f")
            bar4Image.image = UIImage(named: "bar4e")
            bar5Image.image = UIImage(named: "bar5e")
        case 4:
            bar1Image.image = UIImage(named: "bar1e")
            bar2Image.image = UIImage(named: "bar2e")
            bar3Image.image = UIImage(named: "bar3e")
            bar4Image.image = UIImage(named: "bar4f")
            bar5Image.image = UIImage(named: "bar5e")
        case 5:
            bar1Image.image = UIImage(named: "bar1e")
            bar2Image.image = UIImage(named: "bar2e")
            bar3Image.image = UIImage(named: "bar3e")
            bar4Image.image = UIImage(named: "bar4e")
            bar5Image.image = UIImage(named: "bar5f")
        default: break
        }
    }
    
    @IBAction func likeWorkout(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            likeImage.image = UIImage(named: "likef")
            dislikeImage.image = UIImage(named: "dislike")
            
        case 2:
            likeImage.image = UIImage(named: "like")
            dislikeImage.image = UIImage(named: "dislikef")
            
        default:
            break
        }
    }
    
    
    
    //Supporting functions
    
    func setNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        
        let label = UILabel()
        label.text = "EVO MOVE"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.sizeToFit()
        
        
        let shareButton = UIBarButtonItem(image: UIImage(named: "share"), style: .plain, target: nil, action: nil)
        
//        shareButton.tintColor = UIColor(red: 25/255, green: 90/255, blue: 85/255, alpha: 1.0)
        self.navigationItem.rightBarButtonItems = [shareButton]
        
        self.navigationItem.titleView = label
    }

    
}
