//
//  RetrieveImage.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 9/8/20.
//

import Foundation
import Alamofire
import SwiftUI

extension API {
    
    class func retrieveImage(id: String) {
        let params = ["id":id]
        if let url = URL(string: API.imageRetrievalByIDURL){
            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
                .responseData { (response) in
                    if let data = response.data {
                        if let uiImage = UIImage(data: data) {
                            API.main.imageCache[id] = uiImage
                            API.imageRetrievalResultReady()
                        } else if let err = String(data: data, encoding: .utf8) {
                            API.main.imageErrorCache[id] = err
                            API.imageRetrievalResultReady()
                        }
                        else {
                            API.main.imageErrorCache[id] = "Error processing HTTP response body."
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
