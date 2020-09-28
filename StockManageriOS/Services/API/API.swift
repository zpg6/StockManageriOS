//
//  API.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 9/5/20.
//

import Foundation
import Alamofire
import SwiftUI

class API {
    
    static let main = API()
    
    static let baseURL = "https://smapi.ngrok.io/"
    
    static let authenticateURL = API.baseURL + "user/authenticate"
    
    static let createAccountURL = API.baseURL + "user/create"
    
    static let itemRetrievalByUDIDURL = API.baseURL + "item/query/udid"
    
    static let imageRetrievalByIDURL = API.baseURL + "item/image"
    
    var user: User? = nil
    
    var authenticationError: String = ""
    
    var createAccountError: String = ""
    
    var itemQueryResult: [InventoryItem] = []
    
    var itemQueryError: String = ""
        
    var imageCache: [String:UIImage] = [:]
    
    var imageErrorCache: [String:String] = [:]
}
