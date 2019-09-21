//
//  ParentListItemTableViewCell.swift
//  NestedTableView
//
//  Created by saw pyaehtun on 15/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit

class ParentListItemTableViewCell: UITableViewCell {

    @IBOutlet weak var lblParentName: UILabel!
    @IBOutlet weak var tableViewChildList: UITableView!
    
    
    var parentVO : ParentVO? {
        didSet {
            lblParentName.text = parentVO?.parentName
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
        tableViewChildList.delegate = self
        tableViewChildList.dataSource = self
        tableViewChildList.separatorStyle = .none
        tableViewChildList.isScrollEnabled = false
        tableViewChildList.register(UINib(nibName: String(describing: String(describing: ChildListItemTableViewCell.self)), bundle: nil), forCellReuseIdentifier: String(describing: ChildListItemTableViewCell.self))
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ParentListItemTableViewCell : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parentVO?.childs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChildListItemTableViewCell.self), for: indexPath) as! ChildListItemTableViewCell
        cell.childVO = parentVO?.childs![indexPath.row]
        return cell
    }
    
    
}

extension ParentListItemTableViewCell : UITableViewDelegate {
    
}
