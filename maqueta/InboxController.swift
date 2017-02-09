//
//  InboxController.swift
//  maqueta
//
//  Created by Miguel Roncallo on 1/30/17.
//  Copyright © 2017 Nativapps. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class InboxController: UIViewController, NVActivityIndicatorViewable {

    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var searchBar: UISearchBar!
    
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startAnimating(message: "cargando", type: NVActivityIndicatorType.ballClipRotate)

        DataService.sharedInstance.getToken("asier@evo.com", "vitale",{error,token in
            
            if let e = error{
                print(e)
                self.stopAnimating()
            }else{
                print("token: \(token!)")
                
                DataService.sharedInstance.getInbox(token!, {
                    error, messages in
                    
                    if let _ = error{
                        self.stopAnimating()
                    }else{
                        
                        self.messages = messages!
                        self.tableView.reloadData()
                        self.stopAnimating()
                    }
                    
                })
                
            }
            
        })
        

        setSearchBarColor()
        setNavigationBar()
        
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Supporting functions
    
    
    func setSearchBarColor(){
        for view in searchBar.subviews {
            for subview in view.subviews {
                if subview.isKind(of: UITextField.self) {
                    let textField: UITextField = subview as! UITextField
                    textField.backgroundColor = UIColor.black
                }
            }
        }
    }
    
    func setNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        
        let label = UILabel()
        label.text = "INBOX"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.sizeToFit()
        
        self.navigationItem.titleView = label
    }

}

extension InboxController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Message Detail VC") as! MessageDetailController
        vc.message = self.messages[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Inbox Cell") as! InboxCell
        
        cell.senderLabel.text = self.messages[indexPath.row].rcpt_name
        cell.messageSummaryLabel.text = self.messages[indexPath.row].subject
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self.messages[indexPath.row].sentDate)
        let minutes = calendar.component(.minute, from: self.messages[indexPath.row].sentDate)
        cell.timeSentLabel.text = "\(hour):\(minutes)"
        
        return cell
    }
    
}
