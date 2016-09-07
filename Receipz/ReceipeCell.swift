//
//  ReceipeCell.swift
//  Receipz
//
//  Created by Arpita Bhatia on 9/6/16.
//  Copyright © 2016 Arpita Bhatia. All rights reserved.
//

import UIKit

class ReceipeCell: UITableViewCell {
    
    @IBOutlet weak var receipeTitle: UILabel!
    @IBOutlet weak var receipeImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(receipe: Receipe) {
        
        receipeTitle.text = receipe.title
        receipeImg.image = receipe.getReceipeImage()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
