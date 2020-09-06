//
//  Location.swift
//  
//
//  Created By Zachary Grimaldi and Joseph Paul on 5/23/20.
//

/// A struct describing one location an `InventoryItem` is stored at.
struct Location: Codable {
    
    /// the aisle number or letter
    var aisle : String
    
    /// the aisle shelf number or general section
    var aisleSection : String
    
    /// the item's specific location
    var spot : String
    
    /// the text description of the location if more specifics are required
    var description : String
    
    /// the location type that describes how the item is displayed
    var type : LocationType
    
    /// the accessibility of the item to the customer,
    /// either `processed` (available for purchase) or `unprocessed` (unreachable for purchase)
    var accessibility : Accessibility
    
    
    /// initializer with all values set to their defaults so that it can be initialized empty
    public init(aisle: String = "", aisleSection: String = "", spot: String = "", description: String = "",
                type: LocationType = .unknown, accessibility: Accessibility = .unprocessed) {
        self.aisle = aisle
        self.aisleSection = aisleSection
        self.spot = spot
        self.description = description
        self.type = type
        self.accessibility = accessibility
    }
    
}
