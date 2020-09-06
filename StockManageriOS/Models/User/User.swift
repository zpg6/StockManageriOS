//
//  User.swift
//  StockManagerServerApplication
//
//  Created By Zachary Grimaldi and Joseph Paul on 8/16/20.
//

/// Stock Manager User Object is used for authentication with:
/// 1) Web App
/// 2) iOS App
/// 3) Android App
/// 4) API Endpoints
struct User {
    
    /// the unique identifier of this User throughout our system
    var userID: String
    
    /// the user's first name
    var firstName: String
    
    /// the user's last name
    var lastName: String
    
    /// the user's email address
    var email: String
    
    /// the unique identifier of the store this user works at
    var storeID: String
    
    /// the unique identifier of the company the user works for
    var companyID: String
    
    /// the date of the last login to any Stock Manager service
    var lastLoginDate: Int64?
    
    /// all IP addresses that are used to access this user account (ever)
    var ipAddresses: [String]
    
    /// the role which defines the user's access to the applications
    var userRole: UserRole
    
    /// a constructor in which all parameters default to optional, and thus, none are required to initialize a User object
    init(userID: String = "", firstName: String = "", lastName: String = "", email: String = "", storeID: String = "", companyID: String = "", lastLoginDate: Int64? = nil, ipAddresses: [String] = [], userRole: UserRole = .user){
        self.userID = userID
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.storeID = storeID
        self.companyID = companyID
        self.lastLoginDate = lastLoginDate
        self.ipAddresses = ipAddresses
        self.userRole = userRole
    }
}
