//
//  PTVirtualController.swift
//  maqueta
//
//  Created by Miguel Roncallo on 2/2/17.
//  Copyright © 2017 Nativapps. All rights reserved.
//

import UIKit

class PTVirtualController: UIViewController {

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //Supporting functions
    
    func setNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        
        let label = UILabel()
        label.text = "VIRTUAL PT"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.sizeToFit()
        
        self.navigationItem.titleView = label
    }
}

extension PTVirtualController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PT Virtual Cell") as! PTVirtualCell
        
        return cell
    }
}
