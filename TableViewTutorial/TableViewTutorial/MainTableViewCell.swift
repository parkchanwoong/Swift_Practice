//
//  MainTableViewCell.swift
//  TableViewTutorial
//
//  Created by 박찬웅 on 2017. 9. 11..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
//MARK: - Variable
    @IBOutlet weak var titleLabel: UILabel!
// Variable_End
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
