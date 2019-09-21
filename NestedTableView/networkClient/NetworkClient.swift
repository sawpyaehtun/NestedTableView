//
//  NetworkClient.swift
//  NestedTableView
//
//  Created by saw pyaehtun on 21/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation
import Alamofire

class NetworkClient {
    
    private static var sharedNerworkClient : NetworkClient = {
        return NetworkClient()
    }()
    
    class func shared() -> NetworkClient {
        return sharedNerworkClient
    }
    
    public func getData(route : String , success: @escaping (Any) -> Void, fauilure: @escaping (String) -> Void){
        Alamofire.request(SharedConstant.BASE_URL + route).responseData { (response) in
            switch response.result {
            case .success(let data) :
                success(data)
            case .failure(let err) :
                fauilure(err.localizedDescription)
                break
            }
        }
    }
}
