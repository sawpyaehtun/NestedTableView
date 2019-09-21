//
//  ChildListItemTableViewCell.swift
//  NestedTableView
//
//  Created by saw pyaehtun on 15/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit

class ChildListItemTableViewCell: UITableViewCell {

    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var lblStudentName: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    
    var childVO : ChildVo? {
        didSet  {
            lblStudentName.text = childVO?.childName
            lblGender.text = childVO?.gender
            
            if childVO?.gender  == "Male" {
                ivProfile.image =  UIImage(named: "boy")
            } else {
                ivProfile.image = UIImage(named: "girl")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
