//
//  AuthenticateUser.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 9/5/20.
//

import Foundation
import Alamofire

extension API {
    
    class func authenticate(email: String, password: String) {
        let params = ["email":email, "password":password]
        if let url = URL(string: API.authenticateURL){
            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
                .response { (response) in
                    if let data = response.data {
                        if let jsonAny = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                            if let json = jsonAny as? [String:Any] {
                                let user = User.from(json)
                                API.main.user = user
                                API.authenticationResultReady()
                            } else {
                                API.main.authenticationError = "JSON casting error."
                                API.authenticationResultReady()
                            }
                        } else if let err = String(data: data, encoding: .utf8) {
                            API.main.authenticationError = err
                            API.authenticationResultReady()
                        }
                        else {
                            API.main.authenticationError = "JSON serialization error."
                            API.authenticationResultReady()
                        }
                    } else {
                        API.main.authenticationError = "Error retrieving data from server."
                        API.authenticationResultReady()
                    }
                }
        } else {
            API.main.authenticationError = "Error contacting the server."
            API.authenticationResultReady()
        }
    }
    
    class func authenticationResultReady() {
        NotificationCenter.default.post(name: NSNotification.Name.authenticationResult, object: nil)
    }
}
