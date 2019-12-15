//
//  optionsTableViewCell.swift
//  habit
//
//  Created by Apple on 2019/11/19.
//  Copyright © 2019 ZYY.4.17.SE.SCUT. All rights reserved.
//

import UIKit

class optionsTableViewCell: UITableViewCell {

    @IBOutlet weak var NameOfOptions: UILabel!
    @IBOutlet weak var imageOfOptions: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
