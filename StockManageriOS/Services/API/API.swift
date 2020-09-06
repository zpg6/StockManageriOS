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
    
    static let baseURL = "https://ee4b341b4fa1.ngrok.io/"
    
    static let authenticateURL = API.baseURL + "user/authenticate"
    
    static let createAccountURL = API.baseURL + "user/create"
    
    var user: User? = nil
    
    var authenticationError: String = ""
    
    var createAccountError: String = ""
}
