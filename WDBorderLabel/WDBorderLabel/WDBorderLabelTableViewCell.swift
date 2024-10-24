//
//  WDBorderLabelTableViewCell.swift
//  WDBorderLabel
//
//  Created by Dong Lei on 2024/10/24.
//

import UIKit

class WDBorderLabelTableViewCell: UITableViewCell {

    @IBOutlet weak var borederLabel: WDBorderLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        borederLabel.c_borderWidth = 5
        borederLabel.font = .systemFont(ofSize: 17, weight: .black)
        borederLabel.textColor = .label
        borederLabel.c_borderColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
