//
//  JSONErrors.swift
//  StockManagerServerApplication
//
//  Created By Zachary Grimaldi and Joseph Paul on 8/20/20.
//

import Foundation


/// An extension for our custom StockManagerError object
extension StockManagerError {
    
    /// JSON Error codes exist in the range **1500-1599**
    
    /// An inner-class of StockManagerError for statically available
    /// errors relating to JSON serialization/encoding/decoding operations
    /// within the application.
    class JSONErrors {
        
        static let serializationError = StockManagerError(title: "Unable to serialize JSON.",
        code: 1501)
        
        static let castingError = StockManagerError(title: "Unable to cast object to JSON.",
        code: 1501)
        
        
        
    }
    
    
}
