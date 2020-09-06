//
//  DateExtensions.swift
//  StockManagerWebServer
//
//  Created By Zachary Grimaldi and Joseph Paul on 8/10/20.
//  Copyright © 2020 Zachary Grimaldi. All rights reserved.
//

import Foundation

/// An extension for objects of type Date
extension Date {
    
    /// A computed string for a Date in the format `"yyyy-MM-dd_HH-mm-ss-a"`
    /// This is perfect for using MacOS filenames (would still need a file extension)
    var sweeperOutputString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd_HH-mm-ss-a"
        return dateFormatter.string(from: self)
    }
    
    /// A computed string for a Date in the format `"yyyy-MM-dd HH:mm:ss:Z"`
    /// This is perfect for printing to screen.
    var viewOutputString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss:Z"
        return dateFormatter.string(from: self)
    }
}
