//
//  CreateUser.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 9/5/20.
//

import Foundation
import Alamofire

extension API {
    
    class func createUser(invitationCode: String, firstName: String, lastName: String, email: String, password: String) {
        let params = ["invitationCode":invitationCode, "firstName":firstName, "lastName":lastName, "email":email, "password":password]
        if let url = URL(string: API.createAccountURL){
            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
                .response { (response) in
                    if let data = response.data {
                        if let jsonAny = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                            if let json = jsonAny as? [String:Any] {
                                let user = User.from(json)
                                API.main.user = user
                                API.createAccountResultReady()
                            } else {
                                API.main.createAccountError = "JSON casting error."
                                API.createAccountResultReady()
                            }
                        } else if let err = String(data: data, encoding: .utf8) {
                            API.main.createAccountError = err
                            API.createAccountResultReady()
                        }
                        else {
                            API.main.createAccountError = "JSON serialization error."
                            API.createAccountResultReady()
                        }
                    } else {
                        API.main.createAccountError = "Error retrieving data from server."
                        API.createAccountResultReady()
                    }
                }
                
        } else {
            API.main.createAccountError = "Error contacting the server."
            API.createAccountResultReady()
        }
    }
    
    class func createAccountResultReady() {
        NotificationCenter.default.post(name: NSNotification.Name.createAccountResult, object: nil)
    }
}
