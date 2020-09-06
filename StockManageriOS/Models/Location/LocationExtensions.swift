//
//  LocationExtensions.swift
//  StockManagerServerApplication
//
//  Created By Zachary Grimaldi and Joseph Paul on 8/11/20.
//

/// An extension for our  custom Location object that focuses
extension Location {


    var json : [String:Any] {
        var result = [String:Any]()
        
        result["accessibility"] = self.accessibility.rawValue
        result["type"] = self.type.rawValue
        
        if self.aisle != "" {
            result["aisle"] = self.aisle
        }
        
        if self.spot != "" {
            result["spot"] = self.spot
        }
        
        if self.aisleSection != "" {
            result["aisleSection"] = self.aisleSection
        }
        
        if self.description != "" {
            result["description"] = self.description
        }
        
        return result
    }
    
    
    
    static func from(_ object: [String:Any]) -> Location {
        var result = Location()
        
        if let accessibility = object["accessibility"] as? String {
            if let accessibility = Accessibility(rawValue: accessibility) {
                result.accessibility = accessibility
            } else {
                result.accessibility = .unprocessed
            }
        } else {
            result.accessibility = .unprocessed
        }
        
        if let aisle = object["aisle"] as? String {
            result.aisle = aisle
        } else {
            result.aisle = ""
        }
        
        if let type = object["type"] as? String {
            if let type = LocationType(rawValue: type) {
                result.type = type
            } else {
                result.type = .unknown
            }
        } else {
            result.type = .unknown
        }
        
        if let description = object["description"] as? String {
            result.description = description
        } else {
            result.description = ""
        }
        
        if let spot = object["spot"] as? String {
            result.spot = spot
        } else {
            result.spot = ""
        }
        
        if let aisleSection = object["aisleSection"] as? String {
            result.aisleSection = aisleSection
        } else {
            result.aisleSection = ""
        }

        return result
    }
}
