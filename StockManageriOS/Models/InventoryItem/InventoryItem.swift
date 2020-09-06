//
//  InventoryItem.swift
//  
//
//  Created By Zachary Grimaldi and Joseph Paul on 5/18/20.
//

/**
 
## Description

This is the base class for an inventory-managed product in the StockManagerAPI.
 
 
## Dependencies

[`Foundation`](https://developer.apple.com/documentation/foundation)
[`Firebase`](https://github.com/firebase/firebase-ios-sdk)
 
*/

import Foundation

struct InventoryItem: Identifiable {
    
    /// the unique internal identifier, specific to our system
    var id : String
    
    /// Identifier optional if client has their own system identifier
    var userDesignatedID: String
    
    /// the name of the item
    var name: String
    
    /// An array of `Location` objects pertaining to this item
    var locations: [Location]
    
    /// the quantity of this item available for purchase by customers
    var customerAccessibleQuantity: Int?
    
    /// the quantity of this item NOT available for purchase by customers. This may be because the item is unprocessed, on hold, etc.
    var backstockQuantity: Int?
    
    /// The date that this item was last purchased from a register at this location. (Independent of any store returns)
    /// Type: [`Timestamp`](https://developers.google.com/protocol-buffers/docs/reference/java/com/google/protobuf/Timestamp.html?is-external=true)
    var dateLastPurchased: Int64?
    
    
    /// a constructor in which all parameters default to optional, and thus, none are required to initialize an InventoryItem object
    init(userDesignatedID: String = "", name: String = "", locations: [Location] = [], dateLastPurchased: Int64? = nil, customerAccessibleQuantity: Int? = nil, backstockQuantity: Int? = nil) {
        self.id = UUID.uuidStringTwentyCharsNoDashes
        self.userDesignatedID = userDesignatedID
        self.name = name
        self.locations = locations
        self.dateLastPurchased = dateLastPurchased
        if let customerAccessibleQuantity = customerAccessibleQuantity {
            self.customerAccessibleQuantity = customerAccessibleQuantity
        }
        if let backstockQuantity = backstockQuantity {
            self.backstockQuantity = backstockQuantity
        }
    }
}
