//
//  ChatListTableViewCell.swift
//  70_AlexChat
//
//  Created by Alex Koh on 10/09/2017.
//  Copyright © 2017 AlexKoh. All rights reserved.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageLabel: UIImageView!
    
    @IBOutlet weak var textLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
