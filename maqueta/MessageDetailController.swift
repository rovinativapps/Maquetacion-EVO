//
//  MessageDetailController.swift
//  maqueta
//
//  Created by Miguel Roncallo on 2/7/17.
//  Copyright © 2017 Nativapps. All rights reserved.
//

import UIKit

class MessageDetailController: UIViewController {

    
    @IBOutlet var senderLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var subjectLabel: UILabel!
    
    @IBOutlet var messageTextView: UITextView!
    
    var message: Message!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBar()
        self.setMessage()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //Supporting functions
    
    func setMessage(){
        
        self.senderLabel.text = self.message.rcpt_name
        self.subjectLabel.text = self.message.subject
        self.messageTextView.text = self.message.message
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MMMM d, yyyy 'a las' HH:mm"
        
        print(formatter.string(from: self.message.sentDate))
        
        self.dateLabel.text = formatter.string(from: self.message.sentDate)
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
