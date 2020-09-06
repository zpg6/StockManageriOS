//
//  UserExtensions.swift
//  StockManagerServerApplication
//
//  Created By Zachary Grimaldi and Joseph Paul on 8/17/20.
//

import Foundation

/// An extension for our custom User object that handles encoding to and decoding from JSON
extension User {

    /// a statically available function to decode JSON into a User object
    static func from(_ object: [String:Any]) -> User {

        // uncomment the following line to print the JSON object for debugging
        // print(object.debugDescription)

        // initialize an empty User object
        var user = User()

        // if the dictionary contains a `userID` value, add it to the User object
        if let userID = object["userID"] as? String {
            user.userID = userID
        }
        // otherwise, create one based on our chosen format
        else {
            user.userID = UUID.uuidStringTwentyCharsNoDashes
        }

        // if the dictionary contains a `firstName` value, add it to the User object
        if let userFirstName = object["firstName"] as? String {
            user.firstName = userFirstName
        }

        // if the dictionary contains a `lastName` value, add it to the User object
        if let userLastName = object["lastName"] as? String {
            user.lastName = userLastName
        }

        // if the dictionary contains a `email` value, add it to the User object
        if let email = object["email"] as? String {
            user.email = email
        }

        // if the dictionary contains a `ipAddresses` value, add it to the User object
        if let ipAddresses = object["ipAddresses"] as? [String] {
            user.ipAddresses = ipAddresses
        }

        // if the dictionary contains a `storeID` value, add it to the User object
        if let storeID = object["storeID"] as? String {
            user.storeID = storeID
        }

        // if the dictionary contains a `companyID` value, add it to the User object
        if let companyID = object["companyID"] as? String {
            user.companyID = companyID
        }

//        // if the dictionary contains a `lastLoginDate` value in the form of a Timestamp, add it to the User object
//        if let lastLoginDate = object["lastLoginDate"] as? Timestamp? {
//            user.lastLoginDate = lastLoginDate?.seconds
//        }
//        // otherwise, if the dictionary contains a `lastLoginDate` value in the dataString format, convert and add it to the User object
//        else if let lastLoginDate = object["lastLoginDate"] as? String, lastLoginDate.contains("FIRTimestamp") {
//            let lastLoginDateFromString = Timestamp(dataString: lastLoginDate)
//            if lastLoginDateFromString.seconds != 0 {
//                user.lastLoginDate = lastLoginDateFromString.seconds
//            }
//        }

        // if the dictionary contains a `userRole` value, add it to the User object
        if let userRole = object["userRole"] as? UserRole {
            user.userRole = userRole
        } else if let userRole = object["userRole"] as? String {
            user.userRole = User.UserRole(rawValue: userRole) ?? .user
        }

        // return the filled User object
        return user
    }

    /// a computed variable that returns the JSON object of a user
    /// this version uses the Timestamp object as a string to be used
    /// outside of Firebase services
    var json: [String:Any] {

        // initialize empty dictionary
        var result = [String:Any]()

        // add userID of this User if un-empty
        if self.userID != "" {
            result["userID"] = self.userID
        }
        
        if self.email != "" {
            result["email"] = self.email
        }

        // add firstName of this User if un-empty
        if self.firstName != "" {
            result["firstName"] = self.firstName
        }

        // add lastName of this User if un-empty
        if self.lastName != "" {
            result["lastName"] = self.lastName
        }

        // add storeID of this User if un-empty
        if self.storeID != "" {
            result["storeID"] = self.storeID
        }

        // add companyID of this User if un-empty
        if self.companyID != "" {
            result["companyID"] = self.companyID
        }

        // add ipAddresses of this User if un-empty
        if !self.ipAddresses.isEmpty {
            result["ipAddresses"] = self.ipAddresses
        }

        // add userID of this User if un-empty
        if self.lastLoginDate != nil {
            result["lastLoginDate"] = self.lastLoginDate
        }

        // add userRole of this User
        result["userRole"] = self.userRole.rawValue

        // return filled dictionary
        return result
    }

    enum UserRole: String, Codable {
        case user = "User"
        case admin = "Admin"
        case developer = "Developer"
    }
}

