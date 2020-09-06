//
//  Packaging+Extensions.swift
//  
//
//  Created By Zachary Grimaldi and Joseph Paul on 5/23/20.
//

import Foundation

extension Packaging {
    
    var value: String {
        switch self {
        case .loose:
            return "Loose"
        case .boxed:
            return "Boxed"
        case .pallet:
            return "Pallet"
        
        //Cases are exhaustive, no default needed
        }
    }
    
    var plural: String {
        switch self {
        case .loose:
            return "Loose Items"
        case .boxed:
            return "Boxed Items"
        case .pallet:
            return "Palleted Items"
        //Cases are exhaustive, no default needed
        }
    }
    
    static func from(_ string: String) throws -> Packaging {
        switch string {
        case "Loose", "Loose Items":
            return .loose
        case "Boxed", "Boxed Items":
            return .boxed
        case "Pallet", "Palleted Items":
            return .pallet
        default:
            throw StockManagerError.ModelErrors.illegalPackaging
        }
    }
    
    static func all() -> [Packaging] {
        return [.loose, .boxed, .pallet]
    }
}
