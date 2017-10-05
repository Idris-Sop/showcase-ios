//
//  HeaderDetailsTableViewCell.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/09/29.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit

class HeaderDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var appNameLabel: UILabel!

    @IBOutlet weak var appIconImageView: UIImageView!
    @IBOutlet weak var installButton: UIButton!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var clientNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layer.cornerRadius = 2.0
        self.layer.borderWidth = 0.5
//        self.layer.borderColor = UIColor.lightGray.cgColor
        self.selectionStyle = UITableViewCellSelectionStyle.none
        installButton.layer.cornerRadius = 5.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
