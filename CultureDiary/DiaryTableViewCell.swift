//
//  DiaryTableViewCell.swift
//  CultureDiary
//
//  Created by SWUCOMPUTER on 2018. 5. 29..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {
    @IBOutlet var labelDate: UILabel!
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var viewRate: CosmosView!
    @IBOutlet var labelReview: UILabel!
    @IBOutlet var genreImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
