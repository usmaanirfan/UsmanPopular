//
//  MasterTableCell.swift
//  UsmanPopular
//
//  Created by Usman Ansari on 28/07/19.
//  Copyright © 2019 Usman Test. All rights reserved.
//

import UIKit

class MasterTableCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
