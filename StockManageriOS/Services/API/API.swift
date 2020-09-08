//
//  API.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 9/5/20.
//

import Foundation
import Alamofire

class API {
    
    static let main = API()
    
    static let baseURL = "https://4086c4ea04bc.ngrok.io/"
    
    static let authenticateURL = API.baseURL + "user/authenticate"
    
    static let createAccountURL = API.baseURL + "user/create"
    
    static let itemRetrievalByID = API.baseURL + "item/query/udid"
    
    var user: User? = nil
    
    var authenticationError: String = ""
    
    var createAccountError: String = ""
    
    var itemQueryResult: [InventoryItem] = []
    
    var itemQueryError: String = ""
}
