//
//  ProfileController.swift
//  maqueta
//
//  Created by Miguel Roncallo on 2/1/17.
//  Copyright © 2017 Nativapps. All rights reserved.
//

import UIKit
import DropDown

class ProfileController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        // Do any additional setup after loading the view.
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: 1200)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        
        let label = UILabel()
        label.text = "PROFILE"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.sizeToFit()
        
        
        let saveButton = UIBarButtonItem(title: "SAVE", style: .plain, target: nil, action: nil)
        
        saveButton.tintColor = UIColor(red: 25/255, green: 90/255, blue: 85/255, alpha: 1.0)
        self.navigationItem.rightBarButtonItems = [saveButton]
        
        self.navigationItem.titleView = label
    }
}
