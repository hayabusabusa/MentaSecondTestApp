//
//  MovieListTableViewCell.swift
//  MovieFormatDisplay
//
//  Created by Yuta Toba on 2020/08/07.
//  Copyright © 2020 Yuta Toba. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet var listNameLabel:UILabel!
    @IBOutlet var listDateLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static let identifier = "ListTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "ListTableViewCell", bundle: nil)
    }
    
    func setcell(object:RegisteredMovie) {
        self.listNameLabel.text = object.name
        self.listDateLabel.text = object.date
    }
    
}
