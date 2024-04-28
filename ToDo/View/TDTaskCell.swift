//
//  TDTaskCell.swift
//  ToDo
//
//  Created by Rafael González on 20/04/24.
//

import UIKit

class TDTaskCell: UITableViewCell {

    @IBOutlet weak var taskTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
