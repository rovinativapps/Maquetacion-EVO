//
//  TabBarController.swift
//  maqueta
//
//  Created by Miguel Roncallo on 1/30/17.
//  Copyright © 2017 Nativapps. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        
        let label = UILabel()
        label.text = "INBOX"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.sizeToFit()
        
        DispatchQueue.main.async {
            self.navigationItem.titleView = label
        }
        
        
        
    }
}
