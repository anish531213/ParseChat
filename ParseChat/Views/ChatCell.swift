//
//  ChatCell.swift
//  ParseChat
//
//  Created by Anish Adhikari on 2/21/18.
//  Copyright © 2018 Anish Adhikari. All rights reserved.
//

import UIKit
import Parse

class ChatCell: UITableViewCell {

    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    var message: PFObject? {
        didSet {
            messageLabel.text = message?.value(forKey: "text") as? String
            if let user = message!["user"] as? PFUser {
                // User found! update username label with username
                userLabel.text = user.username
            } else {
                // No user found, set default username
                userLabel.text = "🤖"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
