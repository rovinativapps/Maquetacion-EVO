//
//  InboxCell.swift
//  maqueta
//
//  Created by Miguel Roncallo on 1/30/17.
//  Copyright © 2017 Nativapps. All rights reserved.
//

import UIKit

class InboxCell: UITableViewCell {

    @IBOutlet var senderLabel: UILabel!
    
    @IBOutlet var timeSentLabel: UILabel!
    
    @IBOutlet var messageSummaryLabel: UILabel!
    
    @IBOutlet var statusImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
