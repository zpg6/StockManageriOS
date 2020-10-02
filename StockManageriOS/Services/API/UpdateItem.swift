//
//  UpdateItem.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 10/1/20.
//

import Foundation
import Alamofire

extension API {
    
    class func updateItem(item: InventoryItem) {
        (0..<API.main.itemQueryResult.count).forEach { (existing) in
            if item.id == API.main.itemQueryResult[existing].id {
                API.main.itemQueryResult[existing] = item
            }
            itemRetrievalResultReady()
        }
        var params = item.json
        params["storeID"] = API.main.user?.storeID ?? "error"
        if let url = URL(string: API.updateItemURL){
            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
                .response { (response) in
                    if let data = response.data {
                        if let jsonAny = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                            if let json = jsonAny as? [String:Any] {
                                let received = InventoryItem.from(json)
                                if item == received {
                                    API.main.updateItemError = ""
                                    API.itemUpdateResultReady()
                                } else {
                                    API.main.updateItemError = "JSON casting error."
                                    API.itemUpdateResultReady()
                                }
                            } else {
                                API.main.updateItemError = "JSON casting error."
                                API.itemUpdateResultReady()
                            }
                        } else if let err = String(data: data, encoding: .utf8) {
                            API.main.updateItemError = err
                            API.itemUpdateResultReady()
                        }
                        else {
                            API.main.updateItemError = "JSON serialization error."
                            API.itemUpdateResultReady()
                        }
                    } else {
                        API.main.updateItemError = "Error retrieving data from server."
                        API.itemUpdateResultReady()
                    }
                }
                
        } else {
            API.main.updateItemError = "Error contacting the server."
            API.itemUpdateResultReady()
        }
    }
    
    class func itemUpdateResultReady() {
        NotificationCenter.default.post(name: NSNotification.Name.updateItemResult, object: nil)
    }
}
