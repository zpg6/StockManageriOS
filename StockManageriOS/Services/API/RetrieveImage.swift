//
//  RetrieveImage.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 9/8/20.
//

import Foundation
import Alamofire

extension API {
    
    class func retrieveImage(id: String) {
        if API.main.imageCache.keys.contains(id) {  }
        let params = ["id":id]
        if let url = URL(string: API.imageRetrievalByIDURL){
            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
                .response { (response) in
                    print(response.debugDescription)
                    if let data = response.data {
                        if let jsonAny = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                            if let json = jsonAny as? [String:Data] {
                                for (identifier,imageData) in json {
                                    API.main.imageCache[identifier] = imageData
                                    API.imageRetrievalResultReady()
                                }
                            } else {
                                API.main.imageErrorCache[id] = "JSON casting error."
                                API.imageRetrievalResultReady()
                            }
                        } else if let err = String(data: data, encoding: .utf8) {
                            API.main.imageErrorCache[id] = err
                            API.imageRetrievalResultReady()
                        }
                        else {
                            API.main.imageErrorCache[id] = "JSON serialization error."
                            API.imageRetrievalResultReady()
                        }
                    } else {
                        API.main.imageErrorCache[id] = "Error retrieving data from server."
                        API.imageRetrievalResultReady()
                    }
                }
                
        } else {
            API.main.imageErrorCache[id] = "Error contacting the server."
            API.imageRetrievalResultReady()
        }
    }
    
    class func imageRetrievalResultReady() {
        NotificationCenter.default.post(name: NSNotification.Name.imageRetrievalResult, object: nil)
    }
}
