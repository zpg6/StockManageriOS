//
//  NotificationName+Extensions.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 9/5/20.
//

import Foundation

extension Notification.Name {
    
    static let authenticationResult = Notification.Name("Authentication Result Received")
    
    static let createAccountResult = Notification.Name("Create Account Result Received")
    
    static let itemRetrievalResult = Notification.Name("Item Query Result Received")
    
    static let imageRetrievalResult = Notification.Name("Image Query Result Received")
}
