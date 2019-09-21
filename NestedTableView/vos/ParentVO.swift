//
//  ParentVO.swift
//  NestedTableView
//
//  Created by saw pyaehtun on 15/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation

struct ParentVO : Codable {
    var id : Int?
    var parentName : String?
    var childs : [ChildVo]?
}
