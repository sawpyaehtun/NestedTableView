//
//  ViewController.swift
//  NestedTableView
//
//  Created by saw pyaehtun on 15/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tableViewParentList: UITableView!
    
    var parentList : [ParentVO] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIs()
        fetchParentsData()
    }
    
    private func setupUIs(){
        setupTableView()
    }
    
    private func setupTableView(){
        tableViewParentList.delegate = self
               tableViewParentList.dataSource = self
               tableViewParentList.separatorStyle = .none
               
               tableViewParentList.register(UINib(nibName: String(describing: ParentListItemTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ParentListItemTableViewCell.self))
    }
    
    
    private func fetchParentsData(){
        ParentModel.shared().apiGetParents(success: {
            self.parentList = ParentModel.shared().parents
            self.tableViewParentList.reloadData()
        }) { (err) in
            print(err)
        }
    }

}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let childItemCount = parentList[indexPath.row].childs?.count
        return CGFloat(76 + (116 * childItemCount!))
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ParentListItemTableViewCell.self), for: indexPath) as! ParentListItemTableViewCell
        cell.parentVO = parentList[indexPath.row]
        return cell
    }
    
    
}
