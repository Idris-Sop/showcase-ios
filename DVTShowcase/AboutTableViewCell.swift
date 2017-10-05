//
//  AboutTableViewCell.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/09/26.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit

class AboutTableViewCell: UITableViewCell {

    @IBOutlet weak var aboutLabel: UILabel!

    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var facebookIconButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var twitterIconButton: UIButton!
    @IBOutlet weak var websiteIconButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 2.0
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
