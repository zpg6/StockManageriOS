//
//  RetrieveItemByID.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 9/8/20.
//

import Foundation
import Alamofire

extension API {
    
    class func retrieveItems(withUserDesignatedID: String, storeID: String) {
        let params = ["userDesignatedID":withUserDesignatedID,"storeID":storeID]
        if let url = URL(string: API.itemRetrievalByID){
            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
                .response { (response) in
                    print(response.debugDescription)
                    if let data = response.data {
                        if let jsonAny = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                            if let json = jsonAny as? [String:Any],
                               let itemArray = json["items"] as? Array<[String:Any]> {
                                
                                let items = itemArray.map({InventoryItem.from($0)})
                                API.main.itemQueryResult = items
                                API.itemRetrievalResultReady()
                                
                            } else {
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
    
    class func itemRetrievalResultReady() {
        NotificationCenter.default.post(name: NSNotification.Name.itemRetrievalResult, object: nil)
    }
}
