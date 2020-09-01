//
//  TableViewCell.swift
//  MovieFormatDisplay
//
//  Created by Yuta Toba on 2020/07/31.
//  Copyright © 2020 Yuta Toba. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var dateLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static let identifier = "TableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    
    func setcell(item:Item){
        self.nameLabel.text = item.name as String
        self.dateLabel.text = item.date as String
    }
}
