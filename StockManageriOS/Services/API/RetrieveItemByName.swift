//
//  RetrieveItemByName.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 10/1/20.
//

import Foundation

import Foundation
import Alamofire

extension API {
    
    class func retrieveItems(withName: String, storeID: String) {
        let params = ["name":withName,"storeID":storeID]
        if let url = URL(string: API.itemRetrievalByNameURL){
            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
                .response { (response) in
                    print(response.debugDescription)
                    if let data = response.data {
                        if let jsonAny = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                            if let json = jsonAny as? [String:Any] {
                                let item = InventoryItem.from(json)
                                API.main.itemQueryResult = [item]
                                API.itemRetrievalResultReady()
                            }
                            else if let json = jsonAny as? [[String:Any]] {
                                API.main.itemQueryResult = json.map({InventoryItem.from($0)})
                                API.itemRetrievalResultReady()
                            }
                            else {
                                API.main.itemQueryError = "JSON casting error."
                                API.itemRetrievalResultReady()
                            }
                        } else if let err = String(data: data, encoding: .utf8) {
                            API.main.itemQueryError = err
                            API.itemRetrievalResultReady()
                        }
                        else {
                            API.main.itemQueryError = "JSON serialization error."
                            API.itemRetrievalResultReady()
                        }
                    } else {
                        API.main.itemQueryError = "Error retrieving data from server."
                        API.itemRetrievalResultReady()
                    }
                }
                
        } else {
            API.main.itemQueryError = "Error contacting the server."
            API.itemRetrievalResultReady()
        }
    }
}
