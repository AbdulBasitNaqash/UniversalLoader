//
//  CardTableViewCell.swift
//  MindValleyLoader
//
//  Created by Abdul Basit on 23/03/19.
//  Copyright © 2019 Abdul Basit. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var mainImageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var cancelAction: (() -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        cancelAction?()
    }
    
}
