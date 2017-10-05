//
//  FunctionalityTableViewCell.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/10/02.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit

class FunctionalityTableViewCell: UITableViewCell {

    @IBOutlet weak var functionalityLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
