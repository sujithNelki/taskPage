//
//  MessageCell.swift
//  taskPage
//
//  Created by Sujith on 07/09/22.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var RatingLabel: UILabel!
   
    @IBOutlet var leftImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productView.layer.cornerRadius = 25
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
