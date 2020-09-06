//
//  UUID.swift
//  StockManagerServerApplication
//
//  Created By Zachary Grimaldi and Joseph Paul on 8/11/20.
//

import Foundation

/// An extension for objects of type UUID
extension UUID {
    
    /// A static variable to quickly create unique identifiers
    /// of length 20 that do not contain spaces or dashes,
    /// only uppercase letters and numbers.
    static var uuidStringTwentyCharsNoDashes: String {
        return String( (UUID().uuidString + UUID().uuidString)
                        .filter({$0 != "-"})
                        .prefix(20)
        )
    }
    
}
