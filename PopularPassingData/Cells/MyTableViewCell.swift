//
//  MyTableViewCell.swift
//  PopularPassingData
//
//  Created by Dino Minh Dao on 2020/03/21.
//  Copyright © 2020 DinoByCloud. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func dark(_ sender: Any) {

    }

    @IBAction func light(_ sender: Any) {

    }
}
